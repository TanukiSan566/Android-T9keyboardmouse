#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "km_debounce.h"
static char g_log[8192]; static long g_now;
static void deb_out(int code, int value, bool k){ (void)k; char b[64]; snprintf(b,sizeof b,"%ld:%d%c ",g_now,code,value==1?'v':(value==0?'^':'r')); strcat(g_log,b); }
static void reset(int ms,int gh){ memset(g_dk,0,sizeof g_dk); g_deb_ms=ms; g_deb_ghost_ms=gh; g_deb_pending=0; g_deb_n_bounce=g_deb_n_ghost=0; g_log[0]=0; g_now=0; }
/* 推进时间并处理到点计时 */
static void adv(long t){ while(g_now<t){ int to=-1; g_now=g_now; deb_poll(g_now,&to); if(to<0||g_now+to>t){ g_now=t; deb_poll(g_now,&to); break;} g_now+=to>0?to:0; if(to<=0) g_now++; } }
static void ev(long t,int code,int val){ adv(t); deb_feed(code,val,true,g_now); }
static int fails=0;
#define CHECK(name,exp) do{ adv(g_now+1000); if(strcmp(g_log,exp)){printf("FAIL %s\n  got: %s\n  exp: %s\n",name,g_log,exp);fails++;}else printf("ok   %s -> %s\n",name,g_log);}while(0)
int main(void){
  reset(100,0); ev(0,2,1); ev(120,2,0); CHECK("clean press, D=100,ghost=0","0:2v 220:2^ ");
  reset(100,0); ev(0,2,1); ev(50,2,0); ev(60,2,1); ev(200,2,0); CHECK("release bounce swallowed","0:2v 300:2^ ");
  reset(100,0); ev(0,2,1); ev(50,2,0); ev(87,2,1); ev(300,2,0); CHECK("87ms gap bounce (seen in real log) swallowed","0:2v 400:2^ ");
  reset(100,30); ev(0,2,1); ev(10,2,0); CHECK("ghost 10ms press dropped","");
  reset(100,30); ev(0,2,1); ev(10,2,0); ev(20,2,1); ev(300,2,0); CHECK("ghost then real press","50:2v 400:2^ ");
  reset(100,30); ev(0,2,1); ev(150,2,0); ev(300,2,1); ev(450,2,0); CHECK("two human taps 150ms gap both pass","30:2v 250:2^ 330:2v 550:2^ ");
  reset(100,0); ev(0,2,1); ev(100,2,0); ev(150,2,1); ev(250,2,0); CHECK("re-press 50ms after release (inside window) is bounce","0:2v 350:2^ ");
  reset(100,0); ev(0,2,1); ev(100,2,0); ev(230,2,1); ev(330,2,0); CHECK("re-press 130ms after release is a new press","0:2v 200:2^ 230:2v 430:2^ ");
  reset(100,0); ev(0,2,1); ev(50,2,2); ev(100,2,2); ev(200,2,0); CHECK("autorepeat passes while held","0:2v 50:2r 100:2r 300:2^ ");
  reset(0,0); ev(0,5,1); ev(5,5,0); CHECK("all off passes through exactly","0:5v 5:5^ ");
  /* 系统日志里 # 键(KEY_NUMERIC_POUND?)的真实乱序 */
  reset(100,0); ev(0,228,1); ev(101,228,0); ev(205,228,1); ev(217,228,0); ev(224,228,1); ev(238,228,0); ev(340,228,1); ev(392,228,0); ev(412,228,1); ev(417,228,0); ev(441,228,1); ev(537,228,0);
  printf("real messy # key sequence (D=100): %s | bounce=%ld ghost=%ld pending=%d\n", (adv(g_now+1000),g_log), g_deb_n_bounce,g_deb_n_ghost,g_deb_pending);
  reset(130,0); ev(0,228,1); ev(101,228,0); ev(205,228,1); ev(217,228,0); ev(224,228,1); ev(238,228,0); ev(340,228,1); ev(392,228,0); ev(412,228,1); ev(417,228,0); ev(441,228,1); ev(537,228,0);
  printf("same sequence (D=130):             %s | bounce=%ld\n", (adv(g_now+1000),g_log), g_deb_n_bounce);
  reset(100,0); if(deb_any_busy()){printf("FAIL idle\n");fails++;} ev(0,3,1); if(!deb_any_busy()){printf("FAIL busy\n");fails++;} ev(10,3,0); if(!deb_any_busy()){printf("FAIL busy2\n");fails++;} adv(500); if(deb_any_busy()||g_deb_pending!=0){printf("FAIL drain %d\n",g_deb_pending);fails++;}
  printf(fails?"FAILED %d\n":"ALL PASS\n",fails); return fails?1:0; }
