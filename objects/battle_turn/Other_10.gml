	///@desc Turn Preparation Start

//枠を65×65の大きさに変形　変形が終わると攻撃が始まる
//ここで変形する必要がないなら消してもOK
Battle_SetTurnInfo(BATTLE_TURN.BOARD_DOWN,65);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_UP,65);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_LEFT,65);
Battle_SetTurnInfo(BATTLE_TURN.BOARD_RIGHT,65);