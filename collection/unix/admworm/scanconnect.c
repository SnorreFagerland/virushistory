/*
scannconect scan for the port 53 
read the host from the stdin
the code come at 90% from a imap checker proggie
anyway it's come from ADM too hehe =) 
*/

#define PROJECT          "ADM internet w0rm project"

#define MAXCHILD		20

#define CONNECT_TIMEOUT		10

#define PORT		        53

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#include <string.h>
#include <malloc.h>
#include <stdio.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

pid_t wait(int *status);
       
int sock;
char *flowbuf;

void connect_read_timeout() {
	close(sock);
}

void checkout(struct in_addr ip) {
	struct sockaddr_in sa;		


	memset(&sa, 0, sizeof(sa));
	memcpy(&sa.sin_addr, &ip, 4); 
	sa.sin_port = htons(PORT);

	if ((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == -1)
		exit(0);

	signal(SIGALRM, connect_read_timeout);
	alarm(CONNECT_TIMEOUT);
	if (connect(sock, (struct sockaddr *)&sa, sizeof(sa)) == -1) {
		alarm(0); close(sock);
		exit(0);
	}
	alarm(0);
        printf("%s\n",inet_ntoa(ip));
	exit(0);	
}

void main() {
	char ipS[256];
	struct in_addr ip;
	int childs = 0;

	while (fgets(ipS, sizeof(ipS), stdin) != NULL)
		if (inet_aton(ipS, &ip) != 0 && ip.s_addr != 0) {
			if (childs >= MAXCHILD) wait(NULL);
			switch (fork()) {
				case 0:
					checkout(ip);
					exit(0);
				case -1:
					perror("fork");
					exit(-1);
				default:
					childs++;
					break;
			}
		}
	while (childs--) wait(NULL);

	return;
}
