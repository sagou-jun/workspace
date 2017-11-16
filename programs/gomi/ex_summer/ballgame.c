#include<curses.h>
#include<string.h>
#include<stdlib.h>
#include"ballgame.h"
#define blclen 5

int BLC_HIT(struct BALL *ball,struct BLC **list)
{
  struct BLC *blc = NULL,*temp = NULL;
  if(*list == NULL)
    return 0;
  blc = (*list)->next;
  temp = *list;

  if((ball->x >= (*list)->x)&&(ball->x <= ((*list)->x + (*list)->len))&&(ball->y == (*list)->y))
    {
      ball->Vy = -1 *(ball->Vy);
      mvaddstr((*list)->y,(*list)->x,"     ");
      free(*list);
      *list = blc;
      return 1;
    }
      
  while(blc != NULL)
    {
      if((ball->x >= blc->x)&&(ball->x <= (blc->x + blc->len))&&((ball->y /*+ball->Vy*/) == blc->y))
	{
	  ball->Vy = -1 *(ball->Vy);
	  mvaddstr(blc->y,blc->x,"     ");
	  temp->next = blc->next;
	  free(blc);
	  return 1;
	}
      if(((ball->x + ball->Vx) == blc->x)||((ball->x + ball->Vx) == (blc->x + blc->len)))
	if(ball->y == blc->y)
	  {
	    ball->Vx = -1 *(ball->Vx);
	    mvaddstr(blc->y,blc->x,"     ");
	    temp->next = blc->next;
	    free(blc);
	    return 1;
	  }
      temp = blc;
      blc = blc->next;
    }
  return 0;
}

int BAR_HIT(struct BALL *ball,struct BAR *bar)
{
  if((ball->x >= bar->x )&&(ball->x <= (bar->x + bar->len - 1))&&((ball->y +ball->Vy) == bar->y))
    {
      ball->Vy = -1;
      return 1;
    }
  if((ball->x == bar->x))
    if((ball->y + ball->Vy) == bar->y)
      {
	ball->Vy = -1;
	ball->Vx += (ball->Vx > -1)? -1:0;
	return 1;
      }
  if(ball->x == (bar->x + bar->len))
    if((ball->y + ball->Vy) == bar->y)
	{
	  ball->Vy = -1;
	  ball->Vx += (ball->Vx < 1)? 1:0;
	  return 1;
	}
    return 0;
}

int ob_init(struct BALL *ball,struct BLC **list,struct BAR *bar)
{
  struct BLC *p = NULL;
  int i,j,sum = 0;

  clear();
  mvaddch(0,0,'*');
  mvaddch(0,COLS - 12,'*');
  for(i = 1;i <= COLS - 13;i++)
    mvaddch(0,i,'-');
  for(i = 1;i <= LINES;i++)
    {
      mvaddch(i,0,'|');
      mvaddch(i,COLS-12,'|');
    }
  
  bar->x = COLS/2 - 2;
  bar->y = LINES - 5;
  ball->x = COLS/2;
  ball->y = LINES - 6;
  ball->Vy = -1;
  ball->Vx = 1;
  ball->ball_str = '@';

  for(j = 0;LINES/2 - 2- 2*j >= 4 ;j++)
    for(i = 0; (blclen + 1)*2*i <= COLS - 15 - blclen;i++)/*blclen + 1)*2*i <= COLS - 14 - blclen*/
      {
	if((p = malloc(sizeof(struct BLC))) == NULL)
	  return 0;
	p->x = (blclen + 1)*2*i + 2;/*(blclen + 1)*2*i + 2;*/
	p->y = 2*j + 5;
	p->len = blclen;
	strcpy(p->blc_str,"#####");
	p->next = (*list);
	(*list) = p;
	mvaddstr((*list)->y,(*list)->x,(*list)->blc_str);
      }
  return 1;
}

void ball_limit(struct BALL *ball)
{
  if(ball->x <= 1)
    ball->Vx = 1;
  if(ball->x >= COLS - 13)
    ball->Vx = -1;
  if(ball->y <= 1)
      ball->Vy = 1;
}

void bar_limit(struct BAR *bar)
{
  if(bar->x  <= 2)
    bar->x = 2;
  if(((bar->x + bar->len)) >= (COLS -13))
    bar->x = COLS - 13 - bar->len;
}

void reset(struct BALL *ball,struct BAR *bar)
{
  ball->x = bar->x + bar->len/2;
  ball->y = bar->y - 1;
  //ball->Vx = -1;
  //ball->Vy = -1;
}

void gameover(int score)
{
  int i;
  
  clear();
  mvaddch(0,0,'*');
  mvaddch(0,COLS - 12,'*');
  for(i = 1;i <= COLS - 13;i++)
    mvaddch(0,i,'-');
  for(i = 1;i <= LINES;i++)
    {
      mvaddch(i,0,'|');
      mvaddch(i,COLS-12,'|');
    }
  while((i = getch()) != ' ')
    {
      mvaddstr(LINES/2 - 3,COLS/3,"@@@@@   @   @ @ @ @@@@@ @@@@@ @   @ @@@@@ @@@@@");
      mvaddstr(LINES/2 - 2,COLS/3,"@      @ @  @@@@@ @     @   @ @   @ @     @   @");
      mvaddstr(LINES/2 - 1,COLS/3,"@ @@@ @@@@@ @ @ @ @@@@@ @   @ @   @ @@@@@ @@@@@");
      mvaddstr(LINES/2    ,COLS/3,"@   @ @   @ @ @ @ @     @   @  @ @  @     @  @ ");
      mvaddstr(LINES/2 + 1,COLS/3,"@@@@@ @   @ @ @ @ @@@@@ @@@@@   @   @@@@@ @   @");
      mvprintw(LINES/2 + 2,COLS/2,"YOUR SCORE:%d",score);
      highscore(score);
    }
}

int title()
{
  int ch;
  int i;
  int diff = 0;
  
  clear();
  mvaddch(0,0,'*');
  mvaddch(0,COLS-2,'*');
  for(i = 1;i <= COLS-3;i++)
    mvaddch(0,i,'-');
  for(i = 1;i <= LINES;i++)
    {
      mvaddch(i,0,'|');
      mvaddch(i,COLS-2,'|');
    }

  mvaddstr(LINES/2 -4,COLS/2 -10,"@@@@  @     @@@@@ @@@@@ @   @");
  mvaddstr(LINES/2 -3,COLS/2 -10,"@   @ @     @   @ @     @  @ ");
  mvaddstr(LINES/2 -2,COLS/2 -10,"@@@@@ @     @   @ @     @ @  ");
  mvaddstr(LINES/2 -1,COLS/2 -10,"@   @ @     @   @ @     @  @ ");
  mvaddstr(LINES/2   ,COLS/2 -10,"@@@@  @@@@@ @@@@@ @@@@@ @   @");
  mvaddstr(LINES/2 +2,COLS/2,"EASY");
  mvaddstr(LINES/2 +3,COLS/2,"NORMAL");
  mvaddstr(LINES/2 +4,COLS/2,"HARD");
  mvaddch(LINES/2 +2,COLS/2 -1,'>');
  mvaddstr(LINES/2 +6,COLS/2,"ENTER SPACE KEY");

  while((ch = getch()) != 'q')
    {
      switch(ch)
	{
	case KEY_UP:
	  diff -= (diff > 0)? 1:0;
	  break;
	case KEY_DOWN:
	  diff += (diff < 2)? 1:0;
	  break;
	case ' ':
	  return diff;
	default:
	  break;
	}
      mvaddch(LINES/2 +2,COLS/2 -1,' ');
      mvaddch(LINES/2 +3,COLS/2 -1,' ');
      mvaddch(LINES/2 +4,COLS/2 -1,' ');
      mvaddch(LINES/2 +2 +diff,COLS/2 -1,'>');
    }
}

void highscore(int score)
{
  struct member list[5];
  FILE *fp;
  int i,j,ch,temp,f = 0;
  char name[7],str[7];

  timeout(-1);
  //nocbreak();
  echo();
  keypad(stdscr,FALSE);
  
  //mvaddstr(LINES/2 +3, COLS/2 -15,"TEST");
  
  if((fp = fopen("HighScore.txt","r")) != NULL)
    {
      mvaddstr(LINES/2 +2,COLS/2 -31,"HIGH SCORE");
      for(i = 0;i < 5;i++)
	{
	  if(feof(fp))
	    break;
	  fscanf(fp,"%d%*c",&(list[i].score));
	  fgets(list[i].name,7,fp);
	  if(list[i].name[strlen(list[i].name) -1] == '\n')
	    list[i].name[strlen(list[i].name) -1] = '\0';
	  mvprintw(LINES/2 +3+i,COLS/2 -30,"%d %s",list[i].score,list[i].name);
	  j = i + 1;
	}
      fclose(fp);
    }
  else
    mvaddstr(LINES/2 +2,COLS/2 -20,"FILE NOT FOUND");

  if((fp = fopen("HighScore.txt","w")) == NULL)
    {
      mvaddstr(LINES/2 +4,COLS/2 -20,"FILE CAN NOT OPEN");
      while(1);
    }
  else
    {
      
      for(i = 0;i < j;i++)
	{
	  if((score > list[i].score)&&(f == 0))
	    {
	      mvaddstr(LINES/2 +4,COLS/2 -20,"Input your name.");
	      move(LINES/2 +5,COLS/2 -20);
	      fflush(stdin);
	      getnstr(name,16);
	      temp = list[i].score;
	      list[i].score = score;
	      score = temp;
	      strcpy(str,list[i].name);
	      strcpy(list[i].name,name);
	      strcpy(name,str);
	      break;
	    }
	}
      for(i = 0;i < j;i++)
	{
	  fprintf(fp,"%d %s\n",list[i].score,list[i].name);
	}
    }
  mvaddstr(LINES/2 +6,COLS/2 -20,"Enter space key to finish");
  while(1)
    {
      move(LINES/2 +5,COLS/2 -20);
      if((ch = getch()) == ' ')
	{
	  endwin();
	  exit(1);
	}
    }
}


/*
main(){
  struct BALL ball;
  struct BLC *list = NULL;
  struct BAR bar;

  initscr();
  noecho();
  cbreak();
  keypad(stdscr,TRUE);
  
  fprintf(stderr,"\n%d %d\n",COLS,LINES);

  ob_init(&ball,&list,&bar);
  while(getch() != 'q');
  endwin();
}
*/
