SHIMのAPIの使い方

shim_parse_2.cxx、shim_parse_2.hxx、shim.cxx、shim.hxxを以下の文でコンパイルして、できたオブジェクトファイルをAPIを使用しているプログラムといっしょにコンパイルしてください。

CXX = g++
shim_parse_2.o:shim_parse_2.cxx shim.hxx shim_parse_2.hxx
	$(CXX) -I.../libxsd -c shim_parse_2.cxx -o shim_parse_2.o

shim.o:shim.cxx shim.hxx
	$(CXX) shim.cxx -c -o shim.o




コアを指定する場合
get_latency(char* 命令名,int BEST or TYPICAL or WORST,char* コンポーネントセット名1,char*コンポーネントセット名2,...,"|",char* マスターコンポーネント名);

コアを指定しない場合
get_latency(char*　命令名,int BEST or TYPICAL or WORST,"\0");

マスターコンポーネント名だけ指定したい場合
get_latency(char* 命令名,int BEST or TYPICAL or WORST,"|",char* マスターコンポーネント名);



コンポーネントセットを指定する場合はSystemConfiguration直下のコンポーネントセットは含めず、目的のマスターコンポーネントをすぐ下に持つコンポーネントセットまですべて指定して下さい。
