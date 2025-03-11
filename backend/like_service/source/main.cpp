#include "server.hpp"
#include <boost/asio.hpp>
#include <cstdlib>
#include <iostream>

namespace net = boost::asio;
using tcp = net::ip::tcp;

int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cerr << "Usage: like_service <address> <port>\n"
                  << "Example:\n"
                  << "    like_service 0.0.0.0 8100\n";
        return EXIT_FAILURE;
    }
    
    auto const address = net::ip::make_address(argv[1]);
    auto const port = static_cast<unsigned short>(std::atoi(argv[2]));
    
    net::io_context ioc{1};
    
    std::make_shared<listener>(ioc, tcp::endpoint{address, port})->run();
    
    ioc.run();
    
    return EXIT_SUCCESS;
}
