///@desc Init
Battle_SetEnemyName(_enemy_slot,"* Test Enemy"); //敵の名前
Battle_SetEnemyDEF(_enemy_slot,-15); //防御力
Battle_SetEnemySpareable(_enemy_slot,false); //見逃せるかどうか
//ステータス
_hp = 100;
_hp_max = 100;
_exp = 0; //EXP量
_gold = 0; //ゴールド量
//--------------------------------------
//ACTS 不要な分は消してください
//--------------------------------------

//--------------------------------------
//Act Choice 1
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,1); //一枠目
Battle_SetEnemyActionName(_enemy_slot,0,"* Act1"); //行動名
//--------------------------------------
//Act Choice 2
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,2); //二枠目
Battle_SetEnemyActionName(_enemy_slot,1,"* Act2"); //行動名
//--------------------------------------
//Act Choice 3
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,3); //三枠目
Battle_SetEnemyActionName(_enemy_slot,2,"* Act3"); //行動名
//--------------------------------------
//Act Choice 4
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,4); //四枠目
Battle_SetEnemyActionName(_enemy_slot,3,"* Act4"); //行動名
//--------------------------------------
//Act Choice 5
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,5); //五枠目
Battle_SetEnemyActionName(_enemy_slot,4,"* Act5"); //行動名
//--------------------------------------
//Act Choice 6
//--------------------------------------
Battle_SetEnemyActionNumber(_enemy_slot,6); //六枠目
Battle_SetEnemyActionName(_enemy_slot,5,"* Act6"); //行動名