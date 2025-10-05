event_inherited()
_turn = 0 //ターン

random_turn = false //攻撃がランダムになるか

///random_turnが有効な場合のみ///

rand_min = 0 //ランダムターンの最小値
rand_max = 0 //ランダムターンの最大値

////////////////////////////////

firstattack = false //敵の先制攻撃を有効にするか
avoid = true //攻撃を避けるか
attack_prog = false //攻撃した場合のみターンが進むか
atk_rturn = false //攻撃しなかった際にランダムターンが発生するか(attack_progが有効な場合のみ)

///atk_rturnが有効な場合のみ///

atk_rand_min = 0 //ランダムターンの最小値
atk_rand_max = 0 //ランダムターンの最大値

//////////////////////////////

Battle_SetTurnInfo(BATTLE_TURN.TIME,-1) //攻撃の時間を無制限に設定 60で1秒

//大きさをニ倍　スプライトのサイズに応じて調整してください(draw_sprite等には効果はないので注意)
image_xscale = 2
image_yscale = 2