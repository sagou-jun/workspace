#include<curses.h>
#include<string.h>
#include<time.h>
#include"ballgame.h"

void game();

int main()
{
  initscr();
  noecho();
  cbreak();
  keypad(stdscr,TRUE);
  game();
  
  endwin();
  return 0;
}

void game()
{
  struct BALL ball;
  struct BLC *list = NULL,*temp = NULL;
  struct BAR bar;
  struct member highscore;
  FILE *fp;
  int ch = -1;
  int delay = 0;
  int waitcount;
  int Dx = 0;
  int shoot = 1;
  int score = 0;
  time_t start;
  time_t timer;
  int life = 3;
  int point;
  char brank[10];
  char differ[7];
  highscore.score = 0;
  strcpy(highscore.name,"------"); 

  if((fp = fopen("HighScore.txt","r")) != NULL)
    {
      fscanf(fp,"%d",&(highscore.score));
      fgets(highscore.name,100,fp);
      fclose(fp);
    }
  
  switch(title()){
  case 0:
    bar.len = 9;
    strcpy(bar.bar_str,"=========");
    waitcount = 12000;
    point = 100;
    strcpy(brank,"         ");
    strcpy(differ,"EASY");
    break;
  case 1:
    bar.len = 7;
    strcpy(bar.bar_str,"=======");
    waitcount = 10000;
    point = 150;
    strcpy(brank,"       ");
    strcpy(differ,"NORMAL");
    break;
  case 2:
    bar.len = 5;
    strcpy(bar.bar_str,"=====");
    waitcount = 8000;
    point = 200;
    strcpy(brank,"     ");
    strcpy(differ,"HARD");
    break;
  }

  if(ob_init(&ball,&list,&bar) == 0)
    return;
  reset(&ball,&bar);
  start = time(NULL);
  mvaddch(ball.y,ball.x,ball.ball_str);
  mvaddstr(bar.y,bar.x,bar.bar_str);
  mvaddstr(LINES - 3,(COLS - 13)/2,"ENTER SPACE KEY");
  timeout(0);
  while((ch = getch()) != 'q')
    {
      mvaddstr(bar.y,bar.x,brank);
      mvaddch(ball.y,ball.x,' ');
      delay++;
      
      if(delay%waitcount == 0)
	{
	  if(!shoot)
	    {
	      ball.x = ball.x + ball.Vx;
	      ball.y = ball.y + ball.Vy;
	    }
	  else
	    {
	      reset(&ball,&bar);
	      start = time(NULL);
	    }
	  if(list == NULL)
	    {
	      gameover(score);
	      break;
	    }
	  else
	    if(BLC_HIT(&ball,&list))
	      score += point;
	  mvaddstr(6,COLS-11,"        ");
	}
      ball_limit(&ball);
      bar_limit(&bar);
      
      if(BAR_HIT(&ball,&bar))
	beep();
      
      if(ball.y >= LINES)
	{
	  mvaddstr(6,COLS - 11,"!!MISS!!");
	  beep();
	  reset(&ball,&bar);
	  ball.Vx = Dx;
	  ball.Vy = -1;
	  shoot = 1;
	  life -= 1;
	  if(life < 0)
	    {
	      gameover(score);
	      break;
	    }
	  mvaddstr(LINES - 3,(COLS - 13)/2,"ENTER SPACE KEY");
	}
      
      switch(ch){
      case KEY_LEFT:
	bar.x -= 1;
	Dx += (Dx < 1)? 1:0;
	break;
      case KEY_RIGHT:
	bar.x += 1;
	Dx -= (Dx >-1)? 1:0;
	break;
      case KEY_UP:
	bar.y -= 1;
	break;
      case KEY_DOWN:
	bar.y += 1;
	break;
      case ' ':
	shoot = 0;
	mvaddstr(LINES - 3,(COLS - 13)/2,"                    ");
	break;
      case 'r':
	life = 3;
      default:
	break;
	}
      timer = time(NULL);
      
      mvaddstr(bar.y,bar.x,bar.bar_str);
      mvaddch(ball.y,ball.x,ball.ball_str);
      mvaddstr(0,COLS - 11,"          ");
      mvaddstr(1,COLS - 11,"          ");
      mvaddstr(2,COLS - 11,"          ");
      mvaddstr(3,COLS - 11,"          ");
      mvaddstr(4,COLS - 11,"          ");
      mvaddstr(5,COLS - 11,"          ");
      mvprintw(0,COLS - 11,"%s",differ);
      mvprintw(1,COLS - 11,"SCORE %d",score);
      mvprintw(2,COLS - 11,"TIME %d",(int)difftime(timer,start));
      mvprintw(3,COLS - 11,"BALL %d",life);
      mvprintw(4,COLS - 11,"HighS %d",highscore.score);
      mvprintw(5,COLS - 11,"Name %s",highscore.name);
      }
}
