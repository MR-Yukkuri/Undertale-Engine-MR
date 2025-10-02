///@desc Init
Battle_SetEnemyName(_enemy_slot,"＊ サンズ"); //敵の名前
Battle_SetEnemyDEF(_enemy_slot,-15); //防御力
Battle_SetEnemySpareable(_enemy_slot,false); //見逃せるかどうか
//ステータス
_hp = 1;
_hp_max = 1;
_exp = 0; //EXP量
_gold = 0; //ゴールド量
//--------------------------------------
//ACTS 不要な分は消してください
//--------------------------------------

//--------------------------------------
//Act Choice 1
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,1); //一枠目
Battle_SetEnemyActionName(_enemy_slot,0,"＊ ぶんせき"); //行動名