#ifndef HANDLERS_HPP
#define HANDLERS_HPP

#include <memory>
#include <string>
#include <boost/beast/http.hpp>

class session;

namespace handlers {
namespace http = boost::beast::http;

void handle_like_comment_add(http::request<http::string_body>& req,
                             std::shared_ptr<session> sess);
void handle_like_comment_remove(http::request<http::string_body>& req,
                                std::shared_ptr<session> sess);

void handle_like_review_add(http::request<http::string_body>& req,
                            std::shared_ptr<session> sess);
void handle_like_review_remove(http::request<http::string_body>& req,
                               std::shared_ptr<session> sess);

}

#endif // HANDLERS_HPP
