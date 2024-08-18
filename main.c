#include <gb/gb.h>
#include <gb/font.h>
#include <stdio.h>
#include "sprites.c"
#include "bgs.c"
#include "BackGround.c"
#include "UI.c"
#include "stars.c"
#include "title_map.c"
#include "title_data.c"

struct OBJECT {
    UINT8 x;
    UINT8 y;
    UINT8 height;
    UINT8 width;
};
#define player_y 0x7D;
UINT8 state;
UINT8 enemy_spwaned;
UINT8 temp0;
UINT8 temp1;
UINT8 temp2;
UINT8 temp3;
UINT8 temp4;
UINT8 rand_num = 50;
UINT8 STAR1_INDEX;
UINT8 STAR2_INDEX;
UINT8 STAR3_INDEX;
UINT8 STAR1_TIMER;
UINT8 STAR2_TIMER;
UINT8 STAR3_TIMER;
UINT8 FIRE_INDEX;
UINT8 FIRE_TIMER;
UINT8 PLAYER_X = 0x4D;
UINT8 had_Shot;


struct OBJECT ENEMY;
struct OBJECT PLAYER_SHOT;
struct OBJECT PLAYER;
UINT8 SCORE[] = { 0, 0, 0, 0, 0 };
UINT8 SCORE_TILE[] = { 0, 0, 0, 0, 0 };
void draw_title_screen(){
    move_bkg(0,0);
    for(temp1=0;temp1<40;++temp1)
    move_sprite(temp1,0,0);
    move_bkg(0,0);
    set_bkg_data(37,127,title_data);
    set_bkg_tiles(0,0,20,1,empty);
    set_bkg_tiles(0,1,20,18,title_map);
    set_win_tiles(0,0,20,1,empty);
}
void initGame(){
    PLAYER.y = player_y;
    PLAYER.height = 16;
    PLAYER.width = 16;
    had_Shot=0;
    enemy_spwaned=0;
    ENEMY.x=0;
    ENEMY.y=0;
}

void check_score(){
    for(temp0=0;temp0<5;++temp0){
        if(SCORE[temp0]==10){
            SCORE[temp0]=0;
            ++SCORE[temp0-1];
        }
    }
}
void set_score(){
    for(temp0=0;temp0<5;++temp0){
        SCORE_TILE[temp0]=SCORE[temp0]+0x02;
    }
    set_win_tiles(5, 0, 5, 1, SCORE_TILE);
}
void main() {
    font_t font;
    font_init();
    font = font_load(font_min);
    font_set(font);
    move_win(7, 136);
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
    set_sprite_data(0, 18, Sprites);
    draw_title_screen();
    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
    DISPLAY_ON;
    SPRITES_8x16;
    initGame();

    while (1) {
        wait_vbl_done();
        if(state==0){
            waitpad(J_START);
            set_win_tiles(7, 0, 5, 1, ready);
            state=1;
            temp0=60;
        }
        if(state==1){
            if(temp0==0){
                set_bkg_data(37, 4, BGs);
                set_bkg_data(38, 1, BGs[1 + STAR1_INDEX]);
                set_bkg_data(39, 1, BGs[1 + STAR2_INDEX]);
                set_bkg_data(40, 1, BGs[1 + STAR3_INDEX]);
                set_bkg_tiles(0,0,20,20,backGround);
                set_bkg_tiles(0,20,20,20,backGround);
                set_win_tiles(0, 0, 5, 1, score_tiles);
                set_sprite_tile(0, 0);
                set_sprite_tile(1, 2);
                set_sprite_tile(2, 4);
                set_sprite_tile(3, 6);
                move_sprite(0, PLAYER_X, 0x7D);
                move_sprite(1, PLAYER_X + 8, 0x7D);
                move_sprite(2, PLAYER_X, 0x89);
                move_sprite(3, PLAYER_X + 8, 0x89);
                state=2;
            }else
            temp0--;
        }
        if(state==2){
            if (((joypad() & J_A) || (joypad() & J_B)) && had_Shot == 0) {
                had_Shot = 1;
                PLAYER_SHOT.x = PLAYER_X + 4;
                PLAYER_SHOT.y = player_y + 16;
                PLAYER_SHOT.height = 9;
                PLAYER_SHOT.width = 8;
                NR10_REG = 0x7B;
                NR11_REG = 0xC2;
                NR12_REG = 0x53;
                NR13_REG = 0xD6;
                NR14_REG = 0x86;
            }
            if (joypad() & J_LEFT) {
                if (PLAYER_X > 0x08)
                    --PLAYER_X;
            }
            if (joypad() & J_RIGHT) {
                if (PLAYER_X < 0x98)
                    ++PLAYER_X;
            }
            check_score();
            set_score();
            scroll_bkg(0, -2);
            if (rand_num >= 0x96) {
                rand_num = 0x0A;
            } else {
                rand_num += 2;
            }
            if (FIRE_TIMER == 0) {
                FIRE_INDEX = (FIRE_INDEX == 0) ? 1 : 0;
                FIRE_TIMER = 10;
            } else {
                --FIRE_TIMER;
            }

            if (STAR1_TIMER == 0) {
                STAR1_INDEX++;
                if (STAR1_INDEX > 2)
                    STAR1_INDEX = 0;
                STAR1_TIMER = 10;
            } else {
                STAR1_TIMER--;
            }
            if (STAR2_TIMER == 0) {
                STAR2_INDEX++;
                if (STAR2_INDEX > 2)
                    STAR2_INDEX = 0;
                STAR2_TIMER = 21;
            } else {
                STAR2_TIMER--;
            }
            if (STAR3_TIMER == 0) {
                STAR3_INDEX++;
                if (STAR3_INDEX > 2)
                    STAR3_INDEX = 0;
                STAR3_TIMER = 29;
            } else {
                STAR3_TIMER--;
            }
            
            set_bkg_data(38, 1, stars[STAR1_INDEX]);
            set_bkg_data(39, 1, stars[STAR2_INDEX]);
            set_bkg_data(40, 1, stars[STAR3_INDEX]);
            set_sprite_tile(2, 4 + FIRE_INDEX * 4);
            set_sprite_tile(3, 6 + FIRE_INDEX * 4);
            move_sprite(0, PLAYER_X, 0x7D);
            move_sprite(1, PLAYER_X + 8, 0x7D);
            move_sprite(2, PLAYER_X, 0x89);
            move_sprite(3, PLAYER_X + 8, 0x89);

            ++ENEMY.y;
            if (enemy_spwaned == 0) {
                enemy_spwaned = 1;
                ENEMY.x = rand_num;
                ENEMY.y = 0;
                ENEMY.height = 16;
                ENEMY.width = 16;
            } else {
                set_sprite_tile(5, 14);
                set_sprite_tile(6, 16);
                move_sprite(5, ENEMY.x, ENEMY.y);
                move_sprite(6, ENEMY.x + 8, ENEMY.y);
            }
            PLAYER.x = PLAYER_X;

            if (ENEMY.y > 200) {
                enemy_spwaned = 0;
            }

            PLAYER_SHOT.y-=2;
            if (PLAYER_SHOT.y < 3) {
                had_Shot = 0;
                set_sprite_tile(4, 0x1A);
            }
            if (had_Shot == 1) {
                set_sprite_tile(4, 12);
                move_sprite(4, PLAYER_SHOT.x, PLAYER_SHOT.y);
            }

            if ((ENEMY.x >= PLAYER_SHOT.x && ENEMY.x <= PLAYER_SHOT.x + PLAYER_SHOT.width) &&
                (ENEMY.y >= PLAYER_SHOT.y && ENEMY.y <= PLAYER_SHOT.y + PLAYER_SHOT.height) ||
                (PLAYER_SHOT.x >= ENEMY.x && PLAYER_SHOT.x <= ENEMY.x + ENEMY.width) &&
                (PLAYER_SHOT.y >= ENEMY.y && PLAYER_SHOT.y <= ENEMY.y + ENEMY.height)) {
                if(had_Shot){
                    ++SCORE[3];
                    had_Shot=0;
                    ENEMY.y = 200;
                    PLAYER_SHOT.y = 3;
                    NR41_REG = 0x34;
                    NR42_REG = 0x93;
                    NR43_REG = 0x89;
                    NR44_REG = 0x80;
                }
            }
            if ((ENEMY.x >= PLAYER.x && ENEMY.x <= PLAYER.x + PLAYER.width) &&
                (ENEMY.y >= PLAYER.y && ENEMY.y <= PLAYER.y + PLAYER.height) ||
                (PLAYER.x >= ENEMY.x && PLAYER.x <= ENEMY.x + ENEMY.width) &&
                (PLAYER.y >= ENEMY.y && PLAYER.y <= ENEMY.y + ENEMY.height)) {
                    for(temp0=0;temp0<5;++temp0){
                    SCORE[temp0]=0;
                    }
                    state = 3;
                    NR41_REG = 0x34;
                    NR42_REG = 0x93;
                    NR43_REG = 0x89;
                    NR44_REG = 0x80;
                    set_win_tiles(10,0,10,1,gameOver);
            } 
            if(state==3){
                waitpad(J_A);
                move_bkg(0,0);
                draw_title_screen();
                state=0;
                initGame();
            }
        }
    }
}
