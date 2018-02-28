#include<iostream>
#include<stdlib.h>
#include<string>
#include<fstream>
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/graphviz.hpp>
#include <boost/graph/graph_utility.hpp>

using std::cout;
using std::cerr;
using std::endl;

typedef boost::adjacency_list<boost::listS, boost::vecS, boost::directedS> Graph;

enum {a,b,c,d,e,f,g};
const std::string name = "abcdefg"; 

int main(int argc,char *argv[]){
  if(argc != 2)
    {
      cerr<<"Usage ::graph.exe dot_File"<<endl;
      exit(1);
    }
  
  std::ifstream file(argv[1]);
 
  Graph g;
  boost::dynamic_properties dp(boost::ignore_other_properties);
  boost::read_graphviz(file,g,dp);

  boost::print_graph(g,name.c_str());
  return 0;
}
