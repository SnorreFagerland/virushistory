 #include <stdio.h>
 #include <time.h>       
 #include <stdlib.h>

int myrand()
{
 int j;
  j=1+(int) (230.0*rand()/(RAND_MAX+1.0));
  return(j);
 }
    
 void main  () {  
 int i;
 
 srand((time(NULL)*rand()));

 for (i = 0; i < 3; i ++ )
      printf("%i.",myrand());
 
 printf("%i\n",myrand());
}
 

         
