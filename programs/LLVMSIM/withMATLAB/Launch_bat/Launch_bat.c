#include<stdlib.h>
#include<stdio.h>

int main(int argc,char *argv[]){
  char CommandLine[512];
  int i;
  sprintf(CommandLine,"%s ","/usr/local/programs/LLVMSIM/bat/LLVMSIM_Launch.bat");
  for(i = 1;i < argc;i++)
    sprintf(CommandLine,"%s %s",CommandLine,argv[i]);
  printf("%s\n",CommandLine);
  system(CommandLine);
  return 0;
}
