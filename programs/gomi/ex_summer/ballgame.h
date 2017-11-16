#ifndef ballgame_h_
#define ballgame_h_

struct BLC{
  int x;
  int y;
  int len;
  char blc_str[6];
  struct BLC *next;//線形リストで管理する
};

struct BALL{
  int x;
  int y;
  int Vx;
  int Vy;
  char ball_str;
};

struct BAR{
  int x;
  int y;
  int len;
  char bar_str[];
};

struct member{
  int score;
  char name[16];
};

int BLC_HIT(struct BALL *ball,struct BLC **list);//ブロックにぶつかった時に１、それ以外で０を返す
int BAR_HIT(struct BALL *ball,struct BAR *bar);//ラケットにぶつかった時に１、それ以外で０を返す
int ob_init(struct BALL *ball,struct BLC **list,struct BAR *bar);//初期化
void ball_limit(struct BALL *ball);//ボールが画面端にぶつかった時の処理
void bar_limit(struct BAR *BAR);//ラケットが画面はしにぶつかった時の処理
void reset(struct BALL *ball,struct BAR *bar);//ボールのリセット
void gameover(int score);//ゲームオーバー画面
int title();//難易度選択
void highscore(int score);//ファイル入出力
#endif
