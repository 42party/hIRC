#include "header/ircserv.hpp"

// NAO PODEMOS DAR EXIT SOMOS OS SERVER MULA E NEM RETURN (0)
int check_port_limit(int port)
{
	if (port < 1025 || port > 65535)
		return (-1);
	return (port);
}

int verify_contents(int argc, char** argv)
{
	if (argc != 3)
		return (-1);
	if (check_port_limit(atoi(argv[1])) == -1)
		return (-1);
	if (connection() == -1)
		return (-1);
	return (0);
}

int main(int argc, char** argv)
{
	// ./ircserv <port> <password>
	if (verify_contents(argc, argv) == -1)
		return (0);

	return (0);
}
