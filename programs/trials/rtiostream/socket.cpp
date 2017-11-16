#include<cstdlib>
#include<cstring>
#include<cstdio>
#include<unistd.h>
#include<iostream>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netdb.h>
#include<arpa/inet.h>

using namespace std;

#define buf_Max 256
#define timeout 7

int main(int argc,char *argv[]){
  int server_sockfd;
  int client_sockfd;
  char buf[buf_Max];
  ssize_t buflen;
  struct sockaddr_in server_addr;
  struct sockaddr_in client_addr;
  socklen_t client_len;
  socklen_t server_len;
  
  if(argc < 3)
    {
      cerr<<"Invalid arguments"<<endl;
      cerr<<"Usage:socket.exe \"type\" \"port\" \"ipaddr\""<<endl;
      exit(1);
    }
  
  string arg1 = argv[1];
  int portN = atoi(argv[2]);

  if(arg1 == "server")
    {
      
      if((server_sockfd = socket(AF_INET,SOCK_STREAM,0)) < 0)
	{
	  cerr<<"socket error"<<endl;
	  exit(1);
	}

      if(server_sockfd < 0)
	{
	  cerr<<"socket error"<<endl;
	  exit(1);
	}
      
      cout<<"server socket generate"<<endl;
      cout<<"server address configure port:"<<portN<<endl;
      
      server_addr.sin_family = AF_INET;
      server_addr.sin_port = htons(portN);
      server_addr.sin_addr.s_addr = htonl(INADDR_ANY);

      cout<<"server socket bind generate"<<endl;
      if(bind(server_sockfd,(struct sockaddr *)&server_addr,sizeof(server_addr)) < 0)
	{
	  cerr<<"bind error"<<endl;
	  close(server_sockfd);
	  exit(1);
	}

      cout<<"server listen"<<endl;
      int n;
      if((n = listen(server_sockfd,1)) < 0)
	{
	  cerr<<"listen error"<<endl;
	  close(server_sockfd);
	  exit(1);
	}
      cerr<<"listen return:n="<<n<<endl;
      client_len = sizeof(client_addr);
      cout<<"client accepting"<<endl;
      if((client_sockfd = accept(server_sockfd,(struct sockaddr *)&client_addr,&client_len)) <= 0)
	{
	  cerr<<"accept error"<<endl;
	  close(server_sockfd);
	  exit(1);
	}
      cout<<"connection established"<<endl;
      while((buflen = recv(client_sockfd,buf,(buf_Max - 1),0)) > 0)
	{
	  send(client_sockfd,buf,(size_t)buflen,0);
	}
    }
  else if(arg1 == "client"&&argc >= 4)
    {
      if((client_sockfd = socket(AF_INET,SOCK_STREAM,0)) < 0)
	{
	  cerr<<"socket error"<<endl;
	  exit(1);
	}

      if(client_sockfd < 0)
	{
	  cerr<<"socket error"<<endl;
	  exit(1);
	}
      
      cout<<"client socket generate"<<endl;
      cout<<"client address configure ip:"<<argv[3]<<" port:"<<portN<<endl;
      
      client_addr.sin_family = AF_INET;
      client_addr.sin_port = htons(portN);
      client_addr.sin_addr.s_addr = inet_addr(argv[3]);

      /*タイムアウトのためにselectを使う*/
      fd_set fds,readfds;
      struct timeval tv;
      tv.tv_sec = timeout;
      tv.tv_usec = 0;
      
      FD_ZERO(&readfds);//FD_set初期化
      FD_SET(client_sockfd,&readfds);//fdの登録 
      memcpy(&fds,&readfds,sizeof(fd_set));//fdsコピー
      cout<<"client connect"<<endl;
      int n = select(0,&fds,NULL,NULL,&tv);
      if(n == 0)
	{
	  cerr<<"connection tiemout"<<endl;
	  close(client_sockfd);
	  exit(1);
	}
      else if(n < 0)
	{
	  cerr<<"client connect error"<<endl;
	  close(client_sockfd);
	  exit(1);
	}
      string input;
      cout<<"input message:";
      cin>>input;
      if(input.length() < (buf_Max - 1))
	{
	  strcpy(buf,input.c_str());
	  *(buf+input.length()) = '\0';
	  buflen = input.length() + 1;
	}
      else
	{
	  strncpy(buf,input.c_str(),(buf_Max - 1));
	  buf[buf_Max] = '\0';
	  buflen = buf_Max;
	}
      send(client_sockfd,buf,(size_t)buflen,1);
      while((buflen = recv(client_sockfd,buf,(buf_Max - 1),1)) > 0)
	{
	  send(client_sockfd,buf,(size_t)buflen,1);
	}
    }
  else
    {
      cerr<<"Usage:socket.exe \"type\" \"port\" \"ip addr\""<<endl;
      cerr<<"\"type\" is server or client"<<endl;
    }

  close(server_sockfd);
  close(client_sockfd);
  
  return 0;
}
