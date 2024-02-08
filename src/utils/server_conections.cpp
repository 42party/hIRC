#include "../header/ircserv.hpp"

int connection()
{
	// SE ACONTECER DE FICAR FUNCIONANDO OU NAO VEJA O PROTOCOLO
	int myConnection = socket(AF_INET, SOCK_STREAM, 0);

 //socket -> bind -> port -> listen
	return (myConnection);
}


