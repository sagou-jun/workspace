#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<netdb.h>
#include<iostream>

#define PORT 8765
#define timeout 7
#define bufMax 256

using namespace std;

int main(int argc,char *argv[]){
  int sockfd1,sockfd2;
  int len;
  struct sockaddr_in addr;
  struct sockaddr_in c_addr;
  struct timeval tv;
  fd_set fds,readfds;
  
  if(argc != 2 && argc != 3)
    {
      cerr<<"Usage:sock2.exe host"<<endl;
      cerr<<"Usage:sock2.exe client \"IP\""<<endl;
      exit(1);
    }
  string str = argv[1];
  if(str == "host")
    {
      cerr<<"generate soket\n";
      if((sockfd1 = socket(AF_INET,SOCK_STREAM,0)) < 0)
	{
	  perror("socket");
	  exit(1);
	}

      bzero((char *)&addr,sizeof(addr));
      addr.sin_family = AF_INET;
      addr.sin_port = htons(PORT);
      addr.sin_addr.s_addr = INADDR_ANY;

      cerr<<"binding...";
      if(bind(sockfd1,(struct sockaddr *)&addr,sizeof(addr)) < 0)
	{
	  perror("bind");
	  close(sockfd1);
	  exit(1);
	}
      cerr<<"OK"<<endl;

      cerr<<"listen...";
      if(listen(sockfd1,1) < 0)
	{
	  perror("listen");
	  close(sockfd1);
	  exit(1);
	}
      cerr<<"OK"<<endl;
      /*ホスト名の確認 デバッグ用*/
      char hostname[128];
      struct addrinfo hints,*res;
      int err;
      memset(&hints,0,sizeof(hints));
      hints.ai_socktype = SOCK_STREAM;
      hints.ai_family = AF_INET;
      gethostname(hostname,sizeof(hostname));
      if((err = getaddrinfo(hostname,NULL,&hints,&res)) != 0)
	{
	  perror("getaddrinfo");
	  close(sockfd1);
	  exit(1);
	}
      struct in_addr host_addr;
      host_addr.s_addr = ((struct sockaddr_in *)(res->ai_addr))->sin_addr.s_addr;
      cerr<<"accepting(hostname:"<<hostname<<",IP="<<inet_ntoa(host_addr)<<",PORT="<<PORT<<")...";

      /*accept*/
      len = sizeof(c_addr);
      if((sockfd2 = accept(sockfd1,(struct sockaddr *)&c_addr,&len)) < 0)
	{
	  perror("accept");
	  exit(1);
	}
      cerr<<"OK"<<endl;
      
      close(sockfd1);
      char buf[bufMax];
      int buflen;

      while((buflen = recv(sockfd2,&buf,sizeof(buf),0)) > 0)
	{
	  if(!strcmp(buf,"quit"))
	    {
	      cout<<"quit buf="<<buflen<<":"<<buf<<endl;
	      break;
	    }
	  cout<<"recv>>"<<buf<<endl;
	  send(sockfd2,&buf,buflen,0);
	  cout<<"send>>"<<buf<<endl;
	  memset(buf,0,sizeof(buf));
	}
      cout<<"exit"<<endl;
      close(sockfd2);
    }
  else if(str == "client" && argc == 3)
    {

      cerr<<"generating socket"<<endl;
      if((sockfd1 = socket(AF_INET,SOCK_STREAM,0)) < 0)
	{
	  perror("socket");
	  exit(1);
	}
      bzero((char *)&addr,sizeof(addr));
      struct hostent *hp;

      if((hp = gethostbyname(argv[2])) == NULL)
	{
	  perror("No such host");
	  exit(1);
	}
      bcopy(hp->h_addr,&c_addr.sin_addr,hp->h_length);
      c_addr.sin_family = AF_INET;
      c_addr.sin_port = htons(PORT);
      //c_addr.sin_addr.s_addr = inet_addr(argv[2]);
      cerr<<"IP ="<<inet_ntoa(c_addr.sin_addr)<<" PORT="<<PORT<<endl;
      
      // timeout
      tv.tv_sec = timeout;
      tv.tv_usec = 0;
      
      FD_ZERO(&readfds);
      FD_SET(sockfd1,&readfds);

      memcpy(&fds,&readfds,sizeof(readfds));
      cerr<<"connecting...";
      int n = select(sockfd1+1,NULL,&fds,NULL,&tv);
      if(n == 0)
	{
	  cerr<<"timeout";
	  close(sockfd1);
	  exit(1);
	}
      else if(n < 0)
	{
	  perror("select");
	  close(sockfd1);
	  exit(1);
	  }

      if(connect(sockfd1,(struct sockaddr *)&c_addr,sizeof(c_addr)) < 0)
	{
	  perror("connect");
	  close(sockfd1);
	  exit(1);
	}
      
      cerr<<"OK"<<endl;

      string  msg;
      char buf[bufMax];
      int buflen;
      while(1)
	{
	  cout<<"send message:";
	  cin>>msg;
	  if(msg.length() < (bufMax - 1))
	    {
	      strcpy(buf, msg.c_str());
	      buflen = msg.length();
	    }
	  else
	    {
	      strncpy(buf,msg.c_str(),(bufMax - 1));
	      buf[255] = '\0';
	      buflen = bufMax;
	    }
	  send(sockfd1,&buf,buflen,0);
	  if(!strcmp(buf,"quit"))
	    {
	      cout<<"exit"<<endl;
	      break;
	    }
	  memset(buf,0,sizeof(buf));
	  buflen = recv(sockfd1,&buf,sizeof(buf),0);
	  cout<<"recv>>"<<buf<<endl;
	}
      close(sockfd1);
    }
  else
    cerr<<"Invalid arguments"<<endl;
  return 0;
}
