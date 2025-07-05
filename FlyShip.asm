;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module FlyShip
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_score
	.globl _check_score
	.globl _initGame
	.globl _draw_stars
	.globl _draw_title_screen
	.globl _clock
	.globl _rand
	.globl _initrand
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _cgb_compatibility
	.globl _cpu_fast
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad_init
	.globl _waitpadup
	.globl _waitpad
	.globl _joypad
	.globl _SCORE_TILE
	.globl _SCORE
	.globl _PLAYER_X
	.globl _stars
	.globl _Sprites
	.globl _PLAYER
	.globl _PLAYER_SHOT
	.globl _ENEMY
	.globl _joypad_t_val
	.globl _had_Shot
	.globl _FIRE_TIMER
	.globl _FIRE_INDEX
	.globl _STAR3_TIMER
	.globl _STAR2_TIMER
	.globl _STAR1_TIMER
	.globl _STAR3_INDEX
	.globl _STAR2_INDEX
	.globl _STAR1_INDEX
	.globl _temp4
	.globl _temp3
	.globl _temp2
	.globl _temp1
	.globl _temp0
	.globl _cgb_enable
	.globl _enemy_spwaned
	.globl _state
	.globl _rand_num
	.globl _title_map
	.globl _title_data
	.globl _title_pal
	.globl _star3
	.globl _star2
	.globl _star1
	.globl _t4
	.globl _t3
	.globl _t2
	.globl _t1
	.globl _pause
	.globl _gameOver
	.globl _score_tiles
	.globl _empty0
	.globl _empty
	.globl _backGround
	.globl _BGs
	.globl _star_pal
	.globl _sprite1_pal
	.globl _sprite0_pal
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_rand_num::
	.ds 1
_state::
	.ds 1
_enemy_spwaned::
	.ds 1
_cgb_enable::
	.ds 1
_temp0::
	.ds 1
_temp1::
	.ds 1
_temp2::
	.ds 1
_temp3::
	.ds 1
_temp4::
	.ds 1
_STAR1_INDEX::
	.ds 1
_STAR2_INDEX::
	.ds 1
_STAR3_INDEX::
	.ds 1
_STAR1_TIMER::
	.ds 1
_STAR2_TIMER::
	.ds 1
_STAR3_TIMER::
	.ds 1
_FIRE_INDEX::
	.ds 1
_FIRE_TIMER::
	.ds 1
_had_Shot::
	.ds 1
_joypad_t_val::
	.ds 5
_ENEMY::
	.ds 4
_PLAYER_SHOT::
	.ds 4
_PLAYER::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_Sprites::
	.ds 288
_stars::
	.ds 6
_PLAYER_X::
	.ds 1
_SCORE::
	.ds 5
_SCORE_TILE::
	.ds 5
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;FlyShip.c:48: void draw_title_screen(void)
;	---------------------------------
; Function draw_title_screen
; ---------------------------------
_draw_title_screen::
;g:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;FlyShip.c:51: for (temp1 = 0; temp1 < 40; ++temp1)
	xor	a, a
	ld	(#_temp1),a
00105$:
;FlyShip.c:52: move_sprite(temp1, 0, 0);
	ld	a, (_temp1)
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;FlyShip.c:51: for (temp1 = 0; temp1 < 40; ++temp1)
	ld	hl, #_temp1
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00105$
;g:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;FlyShip.c:54: set_bkg_data(37, 136, title_data);
	ld	de, #_title_data
	push	de
	ld	hl, #0x8825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:55: set_bkg_tiles(0, 0, 20, 1, empty);
	ld	bc, #_empty
	push	bc
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;FlyShip.c:56: set_bkg_tiles(0, 1, 20, 18, title_map);
	ld	de, #_title_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;FlyShip.c:57: set_win_tiles(0, 0, 20, 1, empty);
	push	bc
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:58: }
	ret
_sprite0_pal:
	.dw #0x7fff
	.dw #0x0c88
	.dw #0x000e
	.dw #0x0000
_sprite1_pal:
	.dw #0x7fff
	.dw #0x7ca0
	.dw #0x5ca0
	.dw #0x0000
_star_pal:
	.dw #0x6bff
	.dw #0x2a0f
	.dw #0x4000
	.dw #0x0000
_BGs:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
_backGround:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_empty:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_empty0:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_score_tiles:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_gameOver:
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x00	; 0
_pause:
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x0f	; 15
_t1:
	.db #0x01	; 1
	.db #0x25	; 37
_t2:
	.db #0x02	; 2
	.db #0x25	; 37
_t3:
	.db #0x03	; 3
	.db #0x25	; 37
_t4:
	.db #0x04	; 4
	.db #0x25	; 37
_star1:
	.db #0x04	; 4
	.db #0xe3	; 227
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0xe6	; 230
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x80	; 128
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0x20	; 32
	.db #0xc7	; 199
_star2:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xe3	; 227
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x26	; 38
	.db #0xc1	; 193
	.db #0x20	; 32
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xff	; 255
_star3:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0x24	; 36
	.db #0xc3	; 195
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
_title_pal:
	.dw #0x6de0
	.dw #0x7c00
	.dw #0x3de0
	.dw #0x0000
_title_data:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7a	; 122	'z'
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x65	; 101	'e'
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0x3f	; 63
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0x3f	; 63
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0xf8	; 248
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0x6f	; 111	'o'
	.db #0xf0	; 240
	.db #0x5f	; 95
	.db #0xe0	; 224
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xfd	; 253
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf3	; 243
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x9c	; 156
	.db #0x8c	; 140
	.db #0x9e	; 158
	.db #0x8e	; 142
	.db #0x9e	; 158
	.db #0x8e	; 142
	.db #0x9e	; 158
	.db #0x8c	; 140
	.db #0x9c	; 156
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xe6	; 230
	.db #0x40	; 64
	.db #0x27	; 39
	.db #0x47	; 71	'G'
	.db #0x27	; 39
	.db #0x47	; 71	'G'
	.db #0x27	; 39
	.db #0x47	; 71	'G'
	.db #0x26	; 38
	.db #0x47	; 71	'G'
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xe6	; 230
	.db #0xc6	; 198
	.db #0x39	; 57	'9'
	.db #0x30	; 48	'0'
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0x39	; 57	'9'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x71	; 113	'q'
	.db #0x79	; 121	'y'
	.db #0x31	; 49	'1'
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x06	; 6
	.db #0xf6	; 246
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x5e	; 94
	.db #0x3e	; 62
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x87	; 135
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0x3b	; 59
	.db #0x03	; 3
	.db #0x3b	; 59
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x08	; 8
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1e	; 30
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0x93	; 147
	.db #0xc3	; 195
	.db #0x93	; 147
	.db #0x81	; 129
	.db #0x93	; 147
	.db #0x81	; 129
	.db #0x13	; 19
	.db #0x99	; 153
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0xc0	; 192
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe6	; 230
	.db #0xc7	; 199
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe4	; 228
	.db #0xc6	; 198
	.db #0x3e	; 62
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc6	; 198
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x31	; 49	'1'
	.db #0x19	; 25
	.db #0x31	; 49	'1'
	.db #0x19	; 25
	.db #0x11	; 17
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xe0	; 224
	.db #0xc6	; 198
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x63	; 99	'c'
	.db #0xf1	; 241
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x1e	; 30
	.db #0x9e	; 158
	.db #0x1e	; 30
	.db #0x9e	; 158
	.db #0x1e	; 30
	.db #0x9c	; 156
	.db #0x1e	; 30
	.db #0x9c	; 156
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xc6	; 198
	.db #0xe7	; 231
	.db #0x47	; 71	'G'
	.db #0xe7	; 231
	.db #0x47	; 71	'G'
	.db #0xe7	; 231
	.db #0x47	; 71	'G'
	.db #0x27	; 39
	.db #0x47	; 71	'G'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xb7	; 183
	.db #0x02	; 2
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x23	; 35
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xdf	; 223
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x59	; 89	'Y'
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x2d	; 45
	.db #0x0d	; 13
	.db #0x11	; 17
	.db #0x43	; 67	'C'
	.db #0x51	; 81	'Q'
	.db #0x43	; 67	'C'
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0x80	; 128
	.db #0x29	; 41
	.db #0xa4	; 164
	.db #0x1c	; 28
	.db #0x80	; 128
	.db #0x2c	; 44
	.db #0xa0	; 160
	.db #0x1c	; 28
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3b	; 59
	.db #0xb4	; 180
	.db #0x1b	; 27
	.db #0x94	; 148
	.db #0x83	; 131
	.db #0x24	; 36
	.db #0xa3	; 163
	.db #0x24	; 36
	.db #0x93	; 147
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x32	; 50	'2'
	.db #0x02	; 2
	.db #0x34	; 52	'4'
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0x12	; 18
	.db #0x30	; 48	'0'
	.db #0x51	; 81	'Q'
	.db #0x94	; 148
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x91	; 145
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x72	; 114	'r'
	.db #0x22	; 34
	.db #0xa4	; 164
	.db #0x08	; 8
	.db #0x2f	; 47
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x67	; 103	'g'
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0x0f	; 15
	.db #0x46	; 70	'F'
	.db #0xf7	; 247
	.db #0x36	; 54	'6'
	.db #0x0f	; 15
	.db #0x46	; 70	'F'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x9f	; 159
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x2e	; 46
	.db #0x27	; 39
	.db #0x2c	; 44
	.db #0x24	; 36
	.db #0x28	; 40
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc9	; 201
	.db #0xff	; 255
	.db #0x49	; 73	'I'
	.db #0x80	; 128
	.db #0xb4	; 180
	.db #0x36	; 54	'6'
	.db #0xb4	; 180
	.db #0x36	; 54	'6'
	.db #0xb5	; 181
	.db #0xb1	; 177
	.db #0xc8	; 200
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x0f	; 15
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_title_map:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x32	; 50	'2'
	.db #0x44	; 68	'D'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x25	; 37
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x64	; 100	'd'
	.db #0x40	; 64
	.db #0x65	; 101	'e'
	.db #0x5c	; 92
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x25	; 37
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x7b	; 123
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x25	; 37
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x25	; 37
	.db #0x99	; 153
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0xa3	; 163
	.db #0xa4	; 164
	.db #0xa5	; 165
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xa8	; 168
	.db #0xa9	; 169
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xac	; 172
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
;FlyShip.c:59: void draw_stars()
;	---------------------------------
; Function draw_stars
; ---------------------------------
_draw_stars::
;FlyShip.c:61: if (cgb_enable)
	ld	a, (#_cgb_enable)
	or	a, a
	jr	Z, 00102$
;FlyShip.c:63: set_bkg_palette(0, 1, star_pal);
	ld	de, #_star_pal
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
00102$:
;FlyShip.c:65: set_bkg_data(37, 4, BGs);
	ld	de, #_BGs
	push	de
	ld	hl, #0x425
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:66: set_bkg_data(38, 1, BGs + 1 + STAR1_INDEX);
	ld	bc, #_BGs + 1
	ld	a, c
	ld	hl, #_STAR1_INDEX
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	push	de
	ld	hl, #0x126
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:67: set_bkg_data(39, 1, BGs + 1 + STAR2_INDEX);
	ld	a, c
	ld	hl, #_STAR2_INDEX
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	push	de
	ld	hl, #0x127
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:68: set_bkg_data(40, 1, BGs + 1 + STAR3_INDEX);
	ld	a, c
	ld	hl, #_STAR3_INDEX
	add	a, (hl)
	ld	c, a
	jr	NC, 00132$
	inc	b
00132$:
	push	bc
	ld	hl, #0x128
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:69: set_bkg_tiles(0, 0, 20, 20, backGround);
	ld	bc, #_backGround
	push	bc
	ld	hl, #0x1414
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;FlyShip.c:70: set_bkg_tiles(0, 20, 20, 20, backGround);
	push	bc
	ld	hl, #0x1414
	push	hl
	ld	hl, #0x1400
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;FlyShip.c:71: set_win_tiles(0, 0, 20, 1, empty0);
	ld	de, #_empty0
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:72: set_win_tiles(0, 0, 5, 1, score_tiles);
	ld	de, #_score_tiles
	push	de
	ld	hl, #0x105
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x06
;FlyShip.c:77: move_sprite(0, PLAYER_X, 0x7D);
	ld	a, (_PLAYER_X)
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x7d
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:78: move_sprite(1, PLAYER_X + 8, 0x7D);
	ld	a, (_PLAYER_X)
	add	a, #0x08
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x7d
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:79: move_sprite(2, PLAYER_X, 0x89);
	ld	a, (_PLAYER_X)
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x89
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:80: move_sprite(3, PLAYER_X + 8, 0x89);
	ld	a, (_PLAYER_X)
	add	a, #0x08
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x89
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:81: if (cgb_enable)
	ld	a, (#_cgb_enable)
	or	a, a
	ret	Z
;g:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x01
;FlyShip.c:85: set_sprite_prop(4, 0x01);
;FlyShip.c:87: }
	ret
;FlyShip.c:88: void initGame(void)
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;FlyShip.c:90: PLAYER.y = player_y;
	ld	hl, #_PLAYER + 1
	ld	(hl), #0x7d
;FlyShip.c:91: PLAYER.height = 16;
	ld	hl, #_PLAYER + 2
	ld	(hl), #0x10
;FlyShip.c:92: PLAYER.width = 6;
	ld	hl, #_PLAYER + 3
	ld	(hl), #0x06
;FlyShip.c:93: had_Shot = 0;
;FlyShip.c:94: enemy_spwaned = 0;
	xor	a, a
	ld	(#_had_Shot), a
	ld	(#_enemy_spwaned),a
;FlyShip.c:95: ENEMY.x = 0;
	ld	bc, #_ENEMY+0
	xor	a, a
	ld	(bc), a
;FlyShip.c:96: ENEMY.y = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
;FlyShip.c:97: joypad_init(1, &joypad_t_val);
	ld	de, #_joypad_t_val
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_joypad_init
	add	sp, #3
;FlyShip.c:98: }
	ret
;FlyShip.c:99: void check_score(void)
;	---------------------------------
; Function check_score
; ---------------------------------
_check_score::
;FlyShip.c:101: for (temp0 = 0; temp0 < 5; ++temp0)
	xor	a, a
	ld	(#_temp0),a
	ld	bc, #_SCORE+0
00104$:
;FlyShip.c:103: if (SCORE[temp0] == 10)
	ld	a, c
	ld	hl, #_temp0
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	sub	a, #0x0a
	jr	NZ, 00105$
;FlyShip.c:105: SCORE[temp0] = 0;
	xor	a, a
	ld	(de), a
;FlyShip.c:106: ++SCORE[temp0 - 1];
	ld	a, (hl)
	dec	a
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, bc
	inc	(hl)
00105$:
;FlyShip.c:101: for (temp0 = 0; temp0 < 5; ++temp0)
	ld	hl, #_temp0
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00104$
;FlyShip.c:109: }
	ret
;FlyShip.c:110: void set_score(void)
;	---------------------------------
; Function set_score
; ---------------------------------
_set_score::
;FlyShip.c:112: for (temp0 = 0; temp0 < 5; ++temp0)
	xor	a, a
	ld	(#_temp0),a
00102$:
;FlyShip.c:114: SCORE_TILE[temp0] = SCORE[temp0] + 0x01;
	ld	a, #<(_SCORE_TILE)
	ld	hl, #_temp0
	add	a, (hl)
	ld	c, a
	ld	a, #>(_SCORE_TILE)
	adc	a, #0x00
	ld	b, a
	ld	a, #<(_SCORE)
	add	a, (hl)
	ld	e, a
	ld	a, #>(_SCORE)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	inc	a
	ld	(bc), a
;FlyShip.c:112: for (temp0 = 0; temp0 < 5; ++temp0)
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00102$
;FlyShip.c:116: set_win_tiles(5, 0, 5, 1, SCORE_TILE);
	ld	de, #_SCORE_TILE
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:117: }
	ret
;FlyShip.c:118: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
;FlyShip.c:120: cgb_compatibility();
	call	_cgb_compatibility
;FlyShip.c:122: font_init();
	call	_font_init
;FlyShip.c:123: font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;FlyShip.c:124: font_set(font);
	push	de
	call	_font_set
	pop	hl
;FlyShip.c:125: initrand(clock());
	call	_clock
	push	de
	call	_initrand
	pop	hl
;g:\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;FlyShip.c:127: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;FlyShip.c:128: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;FlyShip.c:129: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;FlyShip.c:130: cgb_enable = _cpu == CGB_TYPE;
	ld	a, (#__cpu)
	sub	a, #0x11
	ld	a, #0x01
	jr	Z, 00565$
	xor	a, a
00565$:
	ld	hl, #_cgb_enable
	ld	(hl), a
;FlyShip.c:131: if (cgb_enable)
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;FlyShip.c:133: cpu_fast();
	call	_cpu_fast
;FlyShip.c:134: set_bkg_palette(0, 1, title_pal);
	ld	de, #_title_pal
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
;FlyShip.c:135: set_sprite_palette(0, 1, sprite0_pal);
	ld	de, #_sprite0_pal
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
;FlyShip.c:136: set_sprite_palette(1, 1, sprite1_pal);
	ld	de, #_sprite1_pal
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_sprite_palette
	add	sp, #4
00102$:
;FlyShip.c:138: set_sprite_data(0, 18, Sprites);
	ld	de, #_Sprites
	push	de
	ld	hl, #0x1200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;FlyShip.c:139: draw_title_screen();
	call	_draw_title_screen
;FlyShip.c:140: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;FlyShip.c:141: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;FlyShip.c:142: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;FlyShip.c:143: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;FlyShip.c:144: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;FlyShip.c:145: initGame();
	call	_initGame
;FlyShip.c:146: while (1)
00196$:
;FlyShip.c:148: wait_vbl_done();
	call	_wait_vbl_done
;FlyShip.c:149: if (state == 0)
	ld	a, (#_state)
	or	a, a
	jr	NZ, 00104$
;FlyShip.c:151: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
;FlyShip.c:152: state = 1;
	ld	hl, #_state
	ld	(hl), #0x01
;FlyShip.c:153: temp0 = 120;
	ld	hl, #_temp0
	ld	(hl), #0x78
00104$:
;FlyShip.c:155: if (state == 1)
	ld	a, (#_state)
	dec	a
	jp	NZ, 00116$
;FlyShip.c:157: if (temp0 == 120)
	ld	a, (#_temp0)
	sub	a, #0x78
	jr	NZ, 00106$
;FlyShip.c:159: set_win_tiles(9, 0, 1, 1, t4);
	ld	de, #_t4
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:160: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;FlyShip.c:161: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:162: NR23_REG = 0x3A;
	ld	a, #0x3a
	ldh	(_NR23_REG + 0), a
;FlyShip.c:163: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
00106$:
;FlyShip.c:165: if (temp0 == 80)
	ld	a, (#_temp0)
	sub	a, #0x50
	jr	NZ, 00108$
;FlyShip.c:167: set_win_tiles(9, 0, 1, 1, t3);
	ld	de, #_t3
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:168: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;FlyShip.c:169: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:170: NR23_REG = 0x3A;
	ld	a, #0x3a
	ldh	(_NR23_REG + 0), a
;FlyShip.c:171: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
00108$:
;FlyShip.c:173: if (temp0 == 40)
	ld	a, (#_temp0)
	sub	a, #0x28
	jr	NZ, 00110$
;FlyShip.c:175: set_win_tiles(9, 0, 1, 1, t2);
	ld	de, #_t2
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:176: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;FlyShip.c:177: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:178: NR23_REG = 0x3A;
	ld	a, #0x3a
	ldh	(_NR23_REG + 0), a
;FlyShip.c:179: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
00110$:
;FlyShip.c:181: if (temp0 == 0)
	ld	a, (#_temp0)
	or	a, a
	jr	NZ, 00112$
;FlyShip.c:183: set_win_tiles(9, 0, 1, 1, t1);
	ld	bc, #_t1+0
	push	bc
	ld	hl, #0x101
	push	hl
	ld	hl, #0x09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:184: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;FlyShip.c:185: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:186: NR23_REG = 0x9E;
	ld	a, #0x9e
	ldh	(_NR23_REG + 0), a
;FlyShip.c:187: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG + 0), a
;FlyShip.c:188: draw_stars();
	call	_draw_stars
;FlyShip.c:189: state = 2;
	ld	hl, #_state
	ld	(hl), #0x02
00112$:
;FlyShip.c:191: if (temp0 > 0)
	ld	hl, #_temp0
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;FlyShip.c:192: temp0--;
	dec	(hl)
00116$:
;FlyShip.c:194: if (state == 2)
	ld	a, (#_state)
	sub	a, #0x02
	jp	NZ, 00196$
;FlyShip.c:196: if (((joypad() & J_A) || (joypad() & J_B)) && had_Shot == 0)
	call	_joypad
	bit	4, a
	jr	NZ, 00120$
	call	_joypad
	bit	5, a
	jr	Z, 00118$
00120$:
	ld	hl, #_had_Shot
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
;FlyShip.c:198: had_Shot = 1;
	ld	(hl), #0x01
;FlyShip.c:199: PLAYER_SHOT.x = PLAYER_X + 4;
	ld	a, (_PLAYER_X)
	add	a, #0x04
	ld	hl, #_PLAYER_SHOT
;FlyShip.c:200: PLAYER_SHOT.y = player_y + 16;
	ld	(hl+), a
	ld	(hl), #0x7d
;FlyShip.c:201: PLAYER_SHOT.height = 9;
	ld	hl, #_PLAYER_SHOT + 2
	ld	(hl), #0x09
;FlyShip.c:202: PLAYER_SHOT.width = 8;
	ld	hl, #_PLAYER_SHOT + 3
	ld	(hl), #0x08
;FlyShip.c:203: NR10_REG = 0x3B;
	ld	a, #0x3b
	ldh	(_NR10_REG + 0), a
;FlyShip.c:204: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;FlyShip.c:205: NR12_REG = 0xF2;
	ld	a, #0xf2
	ldh	(_NR12_REG + 0), a
;FlyShip.c:206: NR13_REG = 0xB4;
	ld	a, #0xb4
	ldh	(_NR13_REG + 0), a
;FlyShip.c:207: NR14_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR14_REG + 0), a
00118$:
;FlyShip.c:209: if (joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00124$
;FlyShip.c:211: if (PLAYER_X > 0x08)
	ld	a, #0x08
	ld	hl, #_PLAYER_X
	sub	a, (hl)
	jr	NC, 00124$
;FlyShip.c:212: --PLAYER_X;
	dec	(hl)
00124$:
;FlyShip.c:214: if (joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00128$
;FlyShip.c:216: if (PLAYER_X < 0x98)
	ld	hl, #_PLAYER_X
	ld	a, (hl)
	sub	a, #0x98
	jr	NC, 00128$
;FlyShip.c:217: ++PLAYER_X;
	inc	(hl)
00128$:
;FlyShip.c:219: if (joypad() & J_START)
	call	_joypad
	rlca
	jr	NC, 00130$
;FlyShip.c:221: state = 4;
	ld	hl, #_state
	ld	(hl), #0x04
;FlyShip.c:222: set_win_tiles(12, 0, 5, 1, pause);
	ld	de, #_pause
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x0c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:223: NR21_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR21_REG + 0), a
;FlyShip.c:224: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:225: NR23_REG = 0x96;
	ld	a, #0x96
	ldh	(_NR23_REG + 0), a
;FlyShip.c:226: NR24_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR24_REG + 0), a
00130$:
;FlyShip.c:228: check_score();
	call	_check_score
;FlyShip.c:229: set_score();
	call	_set_score
;g:\gbdk\include\gb\gb.h:1475: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	add	a, #0xfe
	ldh	(_SCY_REG + 0), a
;FlyShip.c:231: if (FIRE_TIMER == 0)
	ld	a, (#_FIRE_TIMER)
	or	a, a
	jr	NZ, 00132$
;FlyShip.c:233: FIRE_INDEX = (FIRE_INDEX == 0) ? 1 : 0;
	ld	a, (#_FIRE_INDEX)
	or	a, a
	ld	a, #0x01
	jr	Z, 00220$
	xor	a, a
00220$:
	ld	(#_FIRE_INDEX),a
;FlyShip.c:234: FIRE_TIMER = 10;
	ld	hl, #_FIRE_TIMER
	ld	(hl), #0x0a
	jr	00133$
00132$:
;FlyShip.c:238: --FIRE_TIMER;
	ld	hl, #_FIRE_TIMER
	dec	(hl)
00133$:
;FlyShip.c:241: if (STAR1_TIMER == 0)
	ld	a, (#_STAR1_TIMER)
	or	a, a
	jr	NZ, 00137$
;FlyShip.c:243: STAR1_INDEX++;
	ld	hl, #_STAR1_INDEX
	inc	(hl)
;FlyShip.c:244: if (STAR1_INDEX > 2)
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00135$
;FlyShip.c:245: STAR1_INDEX = 0;
	ld	(hl), #0x00
00135$:
;FlyShip.c:246: STAR1_TIMER = 10;
	ld	hl, #_STAR1_TIMER
	ld	(hl), #0x0a
	jr	00138$
00137$:
;FlyShip.c:250: STAR1_TIMER--;
	ld	hl, #_STAR1_TIMER
	dec	(hl)
00138$:
;FlyShip.c:252: if (STAR2_TIMER == 0)
	ld	a, (#_STAR2_TIMER)
	or	a, a
	jr	NZ, 00142$
;FlyShip.c:254: STAR2_INDEX++;
	ld	hl, #_STAR2_INDEX
	inc	(hl)
;FlyShip.c:255: if (STAR2_INDEX > 2)
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00140$
;FlyShip.c:256: STAR2_INDEX = 0;
	ld	(hl), #0x00
00140$:
;FlyShip.c:257: STAR2_TIMER = 21;
	ld	hl, #_STAR2_TIMER
	ld	(hl), #0x15
	jr	00143$
00142$:
;FlyShip.c:261: STAR2_TIMER--;
	ld	hl, #_STAR2_TIMER
	dec	(hl)
00143$:
;FlyShip.c:263: if (STAR3_TIMER == 0)
	ld	a, (#_STAR3_TIMER)
	or	a, a
	jr	NZ, 00147$
;FlyShip.c:265: STAR3_INDEX++;
	ld	hl, #_STAR3_INDEX
	inc	(hl)
;FlyShip.c:266: if (STAR3_INDEX > 2)
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00145$
;FlyShip.c:267: STAR3_INDEX = 0;
	ld	(hl), #0x00
00145$:
;FlyShip.c:268: STAR3_TIMER = 29;
	ld	hl, #_STAR3_TIMER
	ld	(hl), #0x1d
	jr	00148$
00147$:
;FlyShip.c:272: STAR3_TIMER--;
	ld	hl, #_STAR3_TIMER
	dec	(hl)
00148$:
;FlyShip.c:275: set_bkg_data(38, 1, stars[STAR1_INDEX]);
	ld	bc, #_stars+0
	ld	a, (_STAR1_INDEX)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #0x126
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:276: set_bkg_data(39, 1, stars[STAR2_INDEX]);
	ld	a, (_STAR2_INDEX)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #0x127
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:277: set_bkg_data(40, 1, stars[STAR3_INDEX]);
	ld	a, (_STAR3_INDEX)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x128
	push	hl
	call	_set_bkg_data
	add	sp, #4
;FlyShip.c:278: set_sprite_tile(2, 4 + FIRE_INDEX * 4);
	ld	a, (_FIRE_INDEX)
	add	a, a
	add	a, a
	add	a, #0x04
	ld	c, a
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), c
;FlyShip.c:279: set_sprite_tile(3, 6 + FIRE_INDEX * 4);
	ld	a, (_FIRE_INDEX)
	add	a, a
	add	a, a
	add	a, #0x06
	ld	c, a
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;FlyShip.c:280: move_sprite(0, PLAYER_X, 0x7D);
	ld	a, (_PLAYER_X)
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x7d
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:281: move_sprite(1, PLAYER_X + 8, 0x7D);
	ld	a, (_PLAYER_X)
	add	a, #0x08
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x7d
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:282: move_sprite(2, PLAYER_X, 0x89);
	ld	a, (_PLAYER_X)
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x89
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:283: move_sprite(3, PLAYER_X + 8, 0x89);
	ld	a, (_PLAYER_X)
	add	a, #0x08
	ld	c, a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x89
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:285: ++ENEMY.y;
	ld	a, (#(_ENEMY + 1) + 0)
	inc	a
	ld	(#(_ENEMY + 1)),a
;FlyShip.c:286: if (enemy_spwaned == 0)
	ld	hl, #_enemy_spwaned
	ld	a, (hl)
	or	a, a
	jr	NZ, 00158$
;FlyShip.c:288: enemy_spwaned = 1;
	ld	(hl), #0x01
;FlyShip.c:289: for (temp1 = 0; temp1 < 10; ++temp1)
	xor	a, a
	ld	(#_temp1),a
00214$:
;FlyShip.c:291: temp0 = rand();
	call	_rand
	ld	hl, #_temp0
	ld	(hl), e
;FlyShip.c:292: if (temp0 < 0x08)
	ld	a, (hl)
	sub	a, #0x08
	jr	C, 00155$
;FlyShip.c:294: else if (temp0 > 0x98)
	ld	a, #0x98
	sub	a, (hl)
	jr	NC, 00156$
;FlyShip.c:297: break;
00155$:
;FlyShip.c:289: for (temp1 = 0; temp1 < 10; ++temp1)
	ld	hl, #_temp1
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x0a
	jr	C, 00214$
00156$:
;FlyShip.c:299: ENEMY.x = temp0;
	ld	de, #_ENEMY
	ld	a, (_temp0)
	ld	(de), a
;FlyShip.c:300: ENEMY.y = 0;
	ld	hl, #(_ENEMY + 1)
;FlyShip.c:301: ENEMY.height = 16;
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x10
;FlyShip.c:302: ENEMY.width = 6;
	ld	hl, #_ENEMY + 3
	ld	(hl), #0x06
	jr	00159$
00158$:
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x10
;FlyShip.c:308: move_sprite(5, ENEMY.x, ENEMY.y);
	ld	hl, #(_ENEMY + 1)
	ld	b, (hl)
	ld	hl, #_ENEMY
	ld	c, (hl)
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:309: move_sprite(6, ENEMY.x + 8, ENEMY.y);
	ld	hl, #(_ENEMY + 1)
	ld	c, (hl)
	ld	a, (#_ENEMY + 0)
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+24
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;FlyShip.c:309: move_sprite(6, ENEMY.x + 8, ENEMY.y);
00159$:
;FlyShip.c:311: PLAYER.x = PLAYER_X;
	ld	de, #_PLAYER
	ld	a, (_PLAYER_X)
	ld	(de), a
;FlyShip.c:313: if (ENEMY.y > 200)
	ld	a, (#(_ENEMY + 1) + 0)
	cp	a, #0xc9
	jr	C, 00161$
;FlyShip.c:315: enemy_spwaned = 0;
	xor	a, a
	ld	(#_enemy_spwaned),a
00161$:
;FlyShip.c:318: PLAYER_SHOT.y -= 2;
	ld	a, (#(_PLAYER_SHOT + 1) + 0)
	dec	a
	dec	a
	ld	(#(_PLAYER_SHOT + 1)),a
;FlyShip.c:319: if (PLAYER_SHOT.y < 3)
	ld	a, (#(_PLAYER_SHOT + 1) + 0)
	sub	a, #0x03
	jr	NC, 00163$
;FlyShip.c:321: had_Shot = 0;
	xor	a, a
	ld	(#_had_Shot),a
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x1a
;FlyShip.c:322: set_sprite_tile(4, 0x1A);
00163$:
;FlyShip.c:324: if (had_Shot == 1)
	ld	a, (#_had_Shot)
	dec	a
	jr	NZ, 00165$
;g:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
;FlyShip.c:327: move_sprite(4, PLAYER_SHOT.x, PLAYER_SHOT.y);
	ld	hl, #(_PLAYER_SHOT + 1)
	ld	b, (hl)
	ld	hl, #_PLAYER_SHOT
	ld	c, (hl)
;g:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;g:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;FlyShip.c:327: move_sprite(4, PLAYER_SHOT.x, PLAYER_SHOT.y);
00165$:
;FlyShip.c:330: if ((ENEMY.x + 3 >= PLAYER_SHOT.x && ENEMY.x + 3 <= PLAYER_SHOT.x + PLAYER_SHOT.width) &&
	ld	hl, #_ENEMY
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	ld	a, (#_PLAYER_SHOT + 0)
	ldhl	sp,	#2
	ld	(hl+), a
;FlyShip.c:301: ENEMY.height = 16;
;FlyShip.c:302: ENEMY.width = 6;
;FlyShip.c:330: if ((ENEMY.x + 3 >= PLAYER_SHOT.x && ENEMY.x + 3 <= PLAYER_SHOT.x + PLAYER_SHOT.width) &&
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00176$
	ld	hl, #_PLAYER_SHOT + 3
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	C, 00176$
;FlyShip.c:285: ++ENEMY.y;
	ld	a, (#(_ENEMY + 1) + 0)
	ldhl	sp,	#7
	ld	(hl), a
;FlyShip.c:318: PLAYER_SHOT.y -= 2;
	ld	a, (#(_PLAYER_SHOT + 1) + 0)
	ldhl	sp,	#6
	ld	(hl), a
;FlyShip.c:331: (ENEMY.y >= PLAYER_SHOT.y && ENEMY.y <= PLAYER_SHOT.y + PLAYER_SHOT.height) ||
	ldhl	sp,	#7
	ld	a, (hl-)
	sub	a, (hl)
	jr	C, 00176$
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #_PLAYER_SHOT + 2
	ld	e, (hl)
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00168$
00176$:
;FlyShip.c:332: (PLAYER_SHOT.x >= ENEMY.x + 3 && PLAYER_SHOT.x <= ENEMY.x + 3 + ENEMY.width) &&
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	C, 00169$
	ld	hl, #(_ENEMY + 3)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00169$
;FlyShip.c:318: PLAYER_SHOT.y -= 2;
	ld	hl, #(_PLAYER_SHOT + 1)
	ld	c, (hl)
;FlyShip.c:285: ++ENEMY.y;
	ld	hl, #(_ENEMY + 1)
	ld	b, (hl)
;FlyShip.c:333: (PLAYER_SHOT.y >= ENEMY.y && PLAYER_SHOT.y <= ENEMY.y + ENEMY.height))
	ld	a, c
	sub	a, b
	jr	C, 00169$
	ldhl	sp,	#4
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, (#(_ENEMY + 2) + 0)
	ld	d, #0x00
	ld	e, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	b, #0x00
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	C, 00169$
00168$:
;FlyShip.c:335: if (had_Shot)
	ld	hl, #_had_Shot
	ld	a, (hl)
	or	a, a
	jr	Z, 00169$
;FlyShip.c:337: ++SCORE[3];
	ld	bc, #_SCORE+3
	ld	a, (bc)
	inc	a
	ld	(bc), a
;FlyShip.c:338: had_Shot = 0;
	ld	(hl), #0x00
;FlyShip.c:339: ENEMY.y = 200;
	ld	hl, #(_ENEMY + 1)
	ld	(hl), #0xc8
;FlyShip.c:340: PLAYER_SHOT.y = 3;
	ld	hl, #(_PLAYER_SHOT + 1)
	ld	(hl), #0x03
;FlyShip.c:341: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;FlyShip.c:342: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;FlyShip.c:343: NR43_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR43_REG + 0), a
;FlyShip.c:344: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00169$:
;FlyShip.c:330: if ((ENEMY.x + 3 >= PLAYER_SHOT.x && ENEMY.x + 3 <= PLAYER_SHOT.x + PLAYER_SHOT.width) &&
	ld	hl, #_ENEMY
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;FlyShip.c:347: if ((ENEMY.x + 3 >= PLAYER.x + 3 && ENEMY.x + 3 <= PLAYER.x + 3 + PLAYER.width) &&
	ld	hl, #_PLAYER
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;FlyShip.c:348: (ENEMY.y >= PLAYER.y && ENEMY.y <= PLAYER.y + PLAYER.height) ||
;FlyShip.c:347: if ((ENEMY.x + 3 >= PLAYER.x + 3 && ENEMY.x + 3 <= PLAYER.x + 3 + PLAYER.width) &&
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00186$
	ld	hl, #_PLAYER + 3
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00186$
;FlyShip.c:285: ++ENEMY.y;
	ld	hl, #(_ENEMY + 1)
	ld	c, (hl)
;FlyShip.c:348: (ENEMY.y >= PLAYER.y && ENEMY.y <= PLAYER.y + PLAYER.height) ||
	ld	hl, #(_PLAYER + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00186$
	ld	e, b
	ld	d, #0x00
	ld	hl, #_PLAYER + 2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	b, #0x00
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00178$
00186$:
;FlyShip.c:349: (PLAYER.x + 3 >= ENEMY.x + 3 && PLAYER.x + 3 <= ENEMY.x + 3 + ENEMY.width) &&
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00179$
	ld	hl, #(_ENEMY + 3)
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00179$
;FlyShip.c:350: (PLAYER.y >= ENEMY.y && PLAYER.y <= ENEMY.y + ENEMY.height))
	ld	hl, #(_PLAYER + 1)
	ld	c, (hl)
;FlyShip.c:285: ++ENEMY.y;
	ld	hl, #(_ENEMY + 1)
	ld	b, (hl)
;FlyShip.c:350: (PLAYER.y >= ENEMY.y && PLAYER.y <= ENEMY.y + ENEMY.height))
	ld	a, c
	sub	a, b
	jr	C, 00179$
	ld	a, b
	ld	b, #0x00
	ld	hl, #(_ENEMY + 2)
	ld	l, (hl)
	ld	h, #0x00
	ld	e, a
	ld	d, b
	add	hl, de
	ld	b, #0x00
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	C, 00179$
00178$:
;FlyShip.c:352: for (temp0 = 0; temp0 < 5; ++temp0)
	xor	a, a
	ld	(#_temp0),a
	ld	bc, #_SCORE+0
00215$:
;FlyShip.c:354: SCORE[temp0] = 0;
	ld	a, c
	ld	hl, #_temp0
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	xor	a, a
	ld	(de), a
;FlyShip.c:352: for (temp0 = 0; temp0 < 5; ++temp0)
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00215$
;FlyShip.c:356: state = 3;
	ld	hl, #_state
	ld	(hl), #0x03
;FlyShip.c:357: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;FlyShip.c:358: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;FlyShip.c:359: NR43_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR43_REG + 0), a
;FlyShip.c:360: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;FlyShip.c:361: set_win_tiles(10, 0, 10, 1, gameOver);
	ld	bc, #_gameOver+0
	push	bc
	ld	hl, #0x10a
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
00179$:
;FlyShip.c:363: if (state == 3)
	ld	a, (#_state)
	sub	a, #0x03
	jr	NZ, 00190$
;FlyShip.c:365: waitpad(J_A);
	ld	a, #0x10
	call	_waitpad
;g:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;FlyShip.c:367: draw_title_screen();
	call	_draw_title_screen
;FlyShip.c:368: state = 0;
	xor	a, a
	ld	(#_state),a
;FlyShip.c:369: if (cgb_enable)
	ld	a, (#_cgb_enable)
	or	a, a
	jr	Z, 00188$
;FlyShip.c:370: set_bkg_palette(0, 1, title_pal);
	ld	de, #_title_pal
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
00188$:
;FlyShip.c:371: initGame();
	call	_initGame
00190$:
;FlyShip.c:373: if (state == 4)
	ld	a, (#_state)
	sub	a, #0x04
	jp	NZ, 00196$
;FlyShip.c:375: waitpadup();
	call	_waitpadup
;FlyShip.c:376: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
;FlyShip.c:377: waitpadup();
	call	_waitpadup
;FlyShip.c:378: NR21_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR21_REG + 0), a
;FlyShip.c:379: NR22_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR22_REG + 0), a
;FlyShip.c:380: NR23_REG = 0x96;
	ld	a, #0x96
	ldh	(_NR23_REG + 0), a
;FlyShip.c:381: NR24_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR24_REG + 0), a
;FlyShip.c:382: set_win_tiles(12, 0, 5, 1, empty0);
	ld	de, #_empty0
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x0c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;FlyShip.c:383: state = 2;
	ld	hl, #_state
	ld	(hl), #0x02
	jp	00196$
;FlyShip.c:387: }
	add	sp, #8
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__Sprites:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x16	; 22
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x0b	; 11
	.db #0x15	; 21
	.db #0x17	; 23
	.db #0x2b	; 43
	.db #0x37	; 55	'7'
	.db #0x5b	; 91
	.db #0x7b	; 123
	.db #0x9f	; 159
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0xd0	; 208
	.db #0xb0	; 176
	.db #0x68	; 104	'h'
	.db #0x10	; 16
	.db #0xf8	; 248
	.db #0xd0	; 208
	.db #0xa8	; 168
	.db #0xe8	; 232
	.db #0xd4	; 212
	.db #0xec	; 236
	.db #0xda	; 218
	.db #0xde	; 222
	.db #0xf9	; 249
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x1f	; 31
	.db #0x23	; 35
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xe4	; 228
	.db #0xf8	; 248
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x23	; 35
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x1f	; 31
	.db #0x30	; 48	'0'
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xf2	; 242
	.db #0xfc	; 252
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0xf8	; 248
	.db #0x0c	; 12
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7b	; 123
	.db #0xe7	; 231
	.db #0x37	; 55	'7'
	.db #0x6b	; 107	'k'
	.db #0x17	; 23
	.db #0x2b	; 43
	.db #0x0b	; 11
	.db #0x15	; 21
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x0d	; 13
	.db #0x1a	; 26
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0xde	; 222
	.db #0xe7	; 231
	.db #0xec	; 236
	.db #0xd6	; 214
	.db #0xe8	; 232
	.db #0xd4	; 212
	.db #0xd0	; 208
	.db #0xa8	; 168
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0xb0	; 176
	.db #0x58	; 88	'X'
	.db #0x20	; 32
	.db #0xf0	; 240
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
__xinit__stars:
	.dw _star1
	.dw _star2
	.dw _star3
__xinit__PLAYER_X:
	.db #0x4d	; 77	'M'
__xinit__SCORE:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__SCORE_TILE:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
