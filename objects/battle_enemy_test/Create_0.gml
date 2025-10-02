event_inherited()
_turn = 0; //ターン
firstattack = false; //敵の先制攻撃を有効にするか(trueで有効)
avoid = true; //攻撃を避けるか(falseで無効)
Battle_SetTurnInfo(BATTLE_TURN.TIME,-1); //攻撃の時間を無制限に設定 60で1秒

//大きさをニ倍　スプライトのサイズに応じて調整してください(draw_sprite等には効果はないので注意)
image_xscale = 2;
image_yscale = 2;