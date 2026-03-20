event_inherited();

if(Battle_GetState()==BATTLE_STATE.IN_TURN && moveable){
	if(!global.color_damagetype&&xprevious = x&&yprevious = y)||(global.color_damagetype&&(!Input_IsHeld(INPUT.LEFT)&&!Input_IsHeld(INPUT.RIGHT)&&!Input_IsHeld(INPUT.UP)&&!Input_IsHeld(INPUT.DOWN))){
		global.is_moving = 0;
	}
	else{
		global.is_moving = 1;
	}
}
else{
	global.is_moving = 0;
}