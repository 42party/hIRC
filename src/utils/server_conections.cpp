#include "../header/ircserv.hpp"
struct sockaddr {
               sa_family_t sa_family;
               char        sa_data[14];
};

int connection()
{
	struct sockaddr  my_addr;

	int mySocket;
	int myBind;
	int myListen;
	// SE ACONTECER DE FICAR FUNCIONANDO OU NAO VEJA O PROTOCOLO
	//socket -> bind -> port -> listen
	mySocket = socket(AF_INET, SOCK_STREAM, 0);
	myBind = bind(mySocket, (struct sockaddr *) &my_addr, sizeof(my_addr));
	myListen = listen(mySocket, 255);

	return (0);
}


