event_inherited()
_turn = 0; //ターン
firstattack = false; //敵の先制攻撃を有効にするか(trueで有効)
avoid = true; //攻撃を避けるか(falseで無効)
Battle_SetTurnInfo(BATTLE_TURN.TIME,-1); //攻撃の時間を無制限に設定 60で1秒

head_sprite = spr_sans_head
sweat_sprite = spr_sans_sweat
flasheye_sprite = spr_sans_head2
body_sprite = spr_sans_body
legs_sprite = spr_sans_legs
slamv_sprite = spr_sans_body_slamv
slamh_sprite = spr_sans_body_slamh

head_image = 0
flasheye_image = 0
sweat_image = 0
body_image = 0
legs_image = 0

slambody_x = 0
slambody_y = 0
slamhead_x = 0
slamhead_y = 0
head_x = 0
head_y = 0
body_x = 0
body_y = 0
b = 0
eye_flash = false
mode = 1

Player_SetLv(19)
Player_SetHpMax(92)
Player_SetHp(92)