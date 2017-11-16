#include<stdio.h>
#include<windows.h>

DWORD WINAPI ThreadA(LPVOID arg);
DWORD WINAPI ThreadB(LPVOID arg);

int main(){
  HANDLE threadA,threadB;
  DWORD threadAID,threadBID;
  return 0;
}
