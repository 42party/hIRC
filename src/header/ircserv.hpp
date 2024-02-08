#ifndef IRCSERV_HPP
# define IRCSERV_HPP

#include <iostream>
#include <poll.h>
#include <sys/socket.h>
#include <cstdlib>

int connection();
int verify_contents(int argc, char** argv);
int check_port(int port);

#endif
