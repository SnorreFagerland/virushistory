/*
   tests if vulnerable to overflow for bind (pre 8.1.2 / 4.9.8) named
   nameserver must have fake-iquery option turned on
   written solely by Joshua J. Drake (jdrake@pulsar.net)
*/

/* local type includes */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <string.h>
#include <ctype.h>
/* network type includes */
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <arpa/nameser.h>
#include <netdb.h>

void handle_alarm();
int lookup_host();
void attack_bind();
int make_keypkt();
int send_packet();
int get_packet();
int vulnerable();

void
main(argc, argv)
   int argc;
   char *argv[];
{
   struct sockaddr_in ra;

   if (argc != 2)
     {
       printf("usage: %s <host>\n", argv[0]);
       return;
     }
   if (!lookup_host(&ra, argv[1], NAMESERVER_PORT))
      return;
   srand(time(NULL));
   attack_bind(ra);
}

int
lookup_host(ra, hn, rp)
   struct sockaddr_in *ra;
   char *hn;
   unsigned short rp;
{
   ra->sin_family = AF_INET;
   ra->sin_port = htons(rp);
   if ((ra->sin_addr.s_addr = inet_addr(hn)) == -1)
     {
	struct hostent *he;

	if ((he = gethostbyname(hn)) != (struct hostent *)NULL)
	  {
	     memcpy(&ra->sin_addr.s_addr, he->h_addr, 4);
	     return 1;
	  }
	else
	   herror("Unable to resolve hostname");
     }
   else
      return 1;
   return 0;
}

void
attack_bind(ra)
   struct sockaddr_in ra;
{
   int sd, pktlen;
   char keypkt[512], inbuf[512], rname[256];
   struct hostent *he;

   if ((sd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
     {
	perror("cannot open tcp socket");
	return;
     }
   
   fflush(stdout);
   signal(SIGALRM, handle_alarm);
   alarm(15);
   if (connect(sd, (struct sockaddr *)&ra, sizeof(ra)) == -1)
     {
	perror("Unable to connect");
	close(sd);
	return;
     }
   
   alarm(0);

   if ((he = gethostbyaddr((char *)&ra.sin_addr, sizeof(ra.sin_addr), AF_INET)) == (struct hostent *)NULL)
      sprintf(rname, "%s", inet_ntoa(ra.sin_addr));
   else
      strncpy(rname, he->h_name, sizeof(rname));

   pktlen = make_keypkt(keypkt);
   if (!send_packet(sd, keypkt, pktlen))
      return;
   if (!get_packet(sd, inbuf, &pktlen) || pktlen <= 0)
      return;
   if (vulnerable(inbuf))
      printf("%s is vulnerable.\n", rname);
   else
      printf("%s is not vulnerable.\n", rname);
   close(sd);
}

void
handle_alarm(sn)
   int sn;
{
   alarm(0);
   signal(SIGALRM, SIG_DFL);
   printf("Unable to connect: Connection timed out\n");
   exit(0);
}

int
make_keypkt(pktbuf)
   char *pktbuf;
{
   HEADER *dnsh;
   char *ptr = pktbuf;
   int pktlen = 0;
   unsigned long ttl = 31337;
   unsigned long addr = inet_addr("1.2.3.4");

   memset(pktbuf, 0, sizeof(pktbuf));

/* fill the dns header */
   dnsh = (HEADER *)ptr;
   dnsh->id		= htons(rand()%65535);
   dnsh->qr		= 0;
   dnsh->opcode		= IQUERY;
   dnsh->aa		= 0;
   dnsh->tc		= 0;
   dnsh->rd		= 1;
   dnsh->ra		= 1;
   dnsh->unused		= 0;
/* removed for portability (it's zero already)
   dnsh->pr		= 0;
 */
   dnsh->rcode		= 0;
   dnsh->qdcount	= htons(0);
   dnsh->ancount	= htons(1);
   dnsh->nscount	= htons(0);
   dnsh->arcount	= htons(0);
   pktlen += sizeof(HEADER);
   ptr += sizeof(HEADER);
/* this is the domain name (nothing here) */
   *(ptr++) = '\0';
   pktlen++;
/* fill out the rest of the rr */
   PUTSHORT(T_A, ptr);
   PUTSHORT(C_IN, ptr);
   PUTLONG(ttl, ptr);
   PUTSHORT(4, ptr);
   PUTLONG(addr, ptr);
   ptr += 4;
   pktlen += ((sizeof(short) * 3) + sizeof(long) + 4);

   return pktlen;
}

int
send_packet(sd, pktbuf, pktlen)
   int sd, pktlen;
   char *pktbuf;
{
   char tmp[2], *tmpptr;

   tmpptr = tmp;
   PUTSHORT(pktlen, tmpptr);
   if (write(sd, tmp, 2) != 2 || write(sd, pktbuf, pktlen) != pktlen)
     {
	perror("write failed");
	return 0;
     }
   return 1;
}

int
get_packet(sd, pktbuf, pktlen)
   int sd, *pktlen;
   char *pktbuf;
{
   char tmp[2], *tmpptr;

   tmpptr = tmp;
   if (read(sd, tmp, 2) != 2)
     {
	perror("read failed");
	return 0;
     }
   GETSHORT(*pktlen, tmpptr);
   if (read(sd, pktbuf, *pktlen) != *pktlen)
     {
	perror("read failed");
	return 0;
     }
   return 1;
}

int
vulnerable(pktbuf)
   char *pktbuf;
{
   HEADER *dnsh = (HEADER *)pktbuf;

   if (dnsh->rcode == 0)
      return 1;
   return 0;
}
