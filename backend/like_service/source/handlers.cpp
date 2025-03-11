#include "handlers.hpp"
#include "server.hpp"
#include <boost/beast/http.hpp>
#include <cstdlib>
#include <iostream>
#include <pqxx/pqxx>
#include <nlohmann/json.hpp>

namespace handlers
{
  namespace http = boost::beast::http;
  namespace asio = boost::asio;
  namespace beast = boost::beast;
  using tcp = asio::ip::tcp;
  using json = nlohmann::json;

  static void prepare_cors(http::response<http::string_body> &res)
  {
    res.set(http::field::access_control_allow_origin, "*");
    res.set(http::field::access_control_allow_headers, "Content-Type, Authorization, session-token");
    res.set(http::field::access_control_allow_methods, "GET, POST, PUT, DELETE, OPTIONS");
  }

  static void send_response(std::shared_ptr<session> sess, http::response<http::string_body> &res)
  {
    res.prepare_payload();
    sess->send_response(std::move(res));
  }

  static void send_error(std::shared_ptr<session> sess, http::status status,
                         const std::string &error_message,
                         const http::request<http::string_body> &req)
  {
    http::response<http::string_body> res{status, req.version()};
    res.set(http::field::content_type, "application/json");
    prepare_cors(res);
    res.body() = "{\"error\": \"" + error_message + "\"}";
    send_response(sess, res);
  }

  static void send_success(std::shared_ptr<session> sess, http::status status,
                           const std::string &message,
                           const http::request<http::string_body> &req)
  {
    http::response<http::string_body> res{status, req.version()};
    res.set(http::field::content_type, "application/json");
    prepare_cors(res);
    res.body() = message;
    send_response(sess, res);
  }

  static bool validate_session_token(const std::string &token, const int user_id)
  {
    try
    {
      asio::io_context ioc;
      tcp::resolver resolver(ioc);

      std::string host = std::getenv("AUTH_SERVICE_HOST");
      std::string port = std::getenv("AUTH_SERVICE_PORT");

      auto const results = resolver.resolve(host, port);
      tcp::socket socket(ioc);
      asio::connect(socket, results.begin(), results.end());

      http::request<http::string_body> req{http::verb::post, "/api/auth/check_token", 11};
      req.set(http::field::host, host);
      req.set("session-token", token);
      req.set(http::field::content_type, "application/json");
      req.body() = "{\"user_id\":" + std::to_string(user_id) + "}";
      req.prepare_payload();

      http::write(socket, req);

      beast::flat_buffer buffer;
      http::response<http::string_body> res;
      http::read(socket, buffer, res);

      boost::system::error_code ec;
      socket.shutdown(tcp::socket::shutdown_both, ec);

      return res.result() == http::status::ok;
    }
    catch (const std::exception &e)
    {
      std::cerr << "Error in validate_session_token: " << e.what() << "\n";
    }
    return false;
  }

  static std::string get_db_connection_string()
  {
    const char *db_url = std::getenv("DATABASE_URL");
    return db_url ? std::string(db_url) : "";
  }

  void handle_like_comment_add(http::request<http::string_body> &req,
                               std::shared_ptr<session> sess)
  {
    if (req.find("session_token") == req.end())
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }
    std::string token(req["session_token"]);

    json body;
    try
    {
      body = json::parse(req.body());
    }
    catch (const std::exception &)
    {
      send_error(sess, http::status::bad_request, "Invalid JSON", req);
      return;
    }
    if (!body.contains("user_id"))
    {
      send_error(sess, http::status::bad_request, "Missing user_id", req);
      return;
    }
    int user_id = body["user_id"];

    if (!validate_session_token(token, user_id))
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }

    std::string target(req.target());
    std::string prefix = "/api/like/comment/";
    if (target.find(prefix) != 0)
    {
      send_error(sess, http::status::bad_request, "Invalid URL format", req);
      return;
    }
    int comment_id = std::stoi(target.substr(prefix.size()));

    try
    {
      std::string conn_str = get_db_connection_string();
      pqxx::connection c(conn_str);
      pqxx::work txn(c);
      std::string query = "INSERT INTO comment_likes (user_id, comment_id) VALUES (" +
                          txn.quote(user_id) + ", " + txn.quote(comment_id) + ") ON CONFLICT DO NOTHING;";
      txn.exec(query);
      txn.commit();

      send_success(sess, http::status::ok, "Like successfully added", req);
    }
    catch (const std::exception &e)
    {
      std::cerr << "Database error: " << e.what() << "\n";
      send_error(sess, http::status::internal_server_error, "Internal Server Error", req);
    }
  }

  void handle_like_comment_remove(http::request<http::string_body> &req,
                                  std::shared_ptr<session> sess)
  {
    if (req.find("session_token") == req.end())
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }
    std::string token(req["session_token"]);

    json body;
    try
    {
      body = json::parse(req.body());
    }
    catch (const std::exception &)
    {
      send_error(sess, http::status::bad_request, "Invalid JSON", req);
      return;
    }
    if (!body.contains("user_id"))
    {
      send_error(sess, http::status::bad_request, "Missing user_id", req);
      return;
    }
    int user_id = body["user_id"];

    if (!validate_session_token(token, user_id))
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }

    std::string target(req.target());
    std::string prefix = "/api/like/comment/";
    if (target.find(prefix) != 0)
    {
      send_error(sess, http::status::bad_request, "Invalid URL format", req);
      return;
    }
    int comment_id = std::stoi(target.substr(prefix.size()));

    try
    {
      std::string conn_str = get_db_connection_string();
      pqxx::connection c(conn_str);
      pqxx::work txn(c);
      std::string query = "DELETE FROM comment_likes WHERE user_id = " +
                          txn.quote(user_id) + " AND comment_id = " + txn.quote(comment_id) + ";";
      txn.exec(query);
      txn.commit();

      send_success(sess, http::status::ok, "Like successfully removed", req);
    }
    catch (const std::exception &e)
    {
      std::cerr << "Database error: " << e.what() << "\n";
      send_error(sess, http::status::internal_server_error, "Internal Server Error", req);
    }
  }

  void handle_like_review_add(http::request<http::string_body> &req,
                              std::shared_ptr<session> sess)
  {
    if (req.find("session_token") == req.end())
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }
    std::string token(req["session_token"]);

    json body;
    try
    {
      body = json::parse(req.body());
    }
    catch (const std::exception &)
    {
      send_error(sess, http::status::bad_request, "Invalid JSON", req);
      return;
    }
    if (!body.contains("user_id"))
    {
      send_error(sess, http::status::bad_request, "Missing user_id", req);
      return;
    }
    int user_id = body["user_id"];

    if (!validate_session_token(token, user_id))
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }

    std::string target(req.target());
    std::string prefix = "/api/like/review/";
    if (target.find(prefix) != 0)
    {
      send_error(sess, http::status::bad_request, "Invalid URL format", req);
      return;
    }
    int review_id = std::stoi(target.substr(prefix.size()));

    try
    {
      std::string conn_str = get_db_connection_string();
      pqxx::connection c(conn_str);
      pqxx::work txn(c);
      std::string query = "INSERT INTO review_likes (user_id, review_id) VALUES (" +
                          txn.quote(user_id) + ", " + txn.quote(review_id) + ") ON CONFLICT DO NOTHING;";
      txn.exec(query);
      txn.commit();

      send_success(sess, http::status::ok, "Like successfully added", req);
    }
    catch (const std::exception &e)
    {
      std::cerr << "Database error: " << e.what() << "\n";
      send_error(sess, http::status::internal_server_error, "Internal Server Error", req);
    }
  }

  void handle_like_review_remove(http::request<http::string_body> &req,
                                 std::shared_ptr<session> sess)
  {
    if (req.find("session_token") == req.end())
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }
    std::string token(req["session_token"]);

    json body;
    try
    {
      body = json::parse(req.body());
    }
    catch (const std::exception &)
    {
      send_error(sess, http::status::bad_request, "Invalid JSON", req);
      return;
    }
    if (!body.contains("user_id"))
    {
      send_error(sess, http::status::bad_request, "Missing user_id", req);
      return;
    }
    int user_id = body["user_id"];

    if (!validate_session_token(token, user_id))
    {
      send_error(sess, http::status::unauthorized, "Unauthorized", req);
      return;
    }

    std::string target(req.target());
    std::string prefix = "/api/like/review/";
    if (target.find(prefix) != 0)
    {
      send_error(sess, http::status::bad_request, "Invalid URL format", req);
      return;
    }
    int review_id = std::stoi(target.substr(prefix.size()));

    try
    {
      std::string conn_str = get_db_connection_string();
      pqxx::connection c(conn_str);
      pqxx::work txn(c);
      std::string query = "DELETE FROM review_likes WHERE user_id = " +
                          txn.quote(user_id) + " AND review_id = " + txn.quote(review_id) + ";";
      txn.exec(query);
      txn.commit();

      send_success(sess, http::status::ok, "Like successfully removed", req);
    }
    catch (const std::exception &e)
    {
      std::cerr << "Database error: " << e.what() << "\n";
      send_error(sess, http::status::internal_server_error, "Internal Server Error", req);
    }
  }

}
