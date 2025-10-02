event_inherited();

if(Battle_GetState()==BATTLE_STATE.IN_TURN && moveable){
	global.is_moving = 1
}
else{
	global.is_moving = 0;
}