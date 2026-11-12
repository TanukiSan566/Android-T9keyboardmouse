#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#define DEB_MAXKEY 0x300
static bool g_deb_key[DEB_MAXKEY];
/* 同一个物理键在不同机型上可能上报不同键码，成组处理: 勾选其中一个，整组一起生效 */
static void deb_key_set(int code, bool on) {
    if (code <= 0 || code >= DEB_MAXKEY) return;
    g_deb_key[code] = on;
    if (code == 55 || code == 227 || code == 0x20a) {           /* * 键 */
        g_deb_key[55] = g_deb_key[227] = g_deb_key[0x20a] = on;
    } else if (code == 228 || code == 0x20b) {                  /* # 键 */
        g_deb_key[228] = g_deb_key[0x20b] = on;
    } else if (code >= 2 && code <= 11) {                       /* 数字键 1..9,0 对应 KEY_NUMERIC_x */
        int n = (code == 11) ? 0 : code - 1;
        g_deb_key[0x200 + n] = on;
    } else if (code >= 0x200 && code <= 0x209) {
        int n = code - 0x200;
        g_deb_key[n == 0 ? 11 : n + 1] = on;
    }
}
static void deb_keys_default(void) {
    memset(g_deb_key, 0, sizeof(g_deb_key));
    for (int c = 2; c <= 11; c++) deb_key_set(c, true);          /* 0-9 */
    deb_key_set(227, true);                                      /* * */
    deb_key_set(228, true);                                      /* # */
}


int main(){ deb_keys_default(); int bad=0;
 int on[]={2,3,4,5,6,7,8,9,10,11,512,513,514,515,516,517,518,519,520,521,55,227,522,228,523};
 for(unsigned i=0;i<sizeof on/sizeof*on;i++) if(!g_deb_key[on[i]]){printf("missing %d\n",on[i]);bad++;}
 int off[]={0x67,0x6c,0x69,0x6a,0x161,0x3b,0x9e,12,1};
 for(unsigned i=0;i<sizeof off/sizeof*off;i++) if(g_deb_key[off[i]]){printf("unexpected %d\n",off[i]);bad++;}
 deb_key_set(5,false); if(g_deb_key[5]||g_deb_key[0x204]){printf("alias off failed\n");bad++;}
 deb_key_set(0x161,true); if(!g_deb_key[0x161]){printf("add confirm failed\n");bad++;}
 printf(bad?"FAIL\n":"KEY TABLE OK (digits+aliases on; arrows/confirm/F1/back off)\n"); return bad; }