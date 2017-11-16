#include<curses.h>
#include"ballgame.h"

typedef struct{
  int x;
  int y;
  int dx;
  int dy;
}ball;

typedef struct{
  int x;
  int y;
}block;

typedef struct{
  int x;
  int y;
}bar;

int main(){
  initscr();//スクリーンの初期化(必須)
  noecho();//キー入力を返さないモードに設定
  cbreak();//入力にバッファを使用しないモードに設定
  keypad(srdscr,TRUE);/*カーソルキーを有効にする。各キーはKEY_UP,KEY_DOWN,KEY_LEFT,KEY_RIGHTのマクロで表される*/
  game();

  endwin();//制御端末を終了する。
  return 0;
}
