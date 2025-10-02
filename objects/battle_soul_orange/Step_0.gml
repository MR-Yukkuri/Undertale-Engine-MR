event_inherited();

//移动
if(Battle_GetState()==BATTLE_STATE.IN_TURN && moveable){
	if t%2==0 {
		instance_create_depth(x,y,depth+1,battle_soul_orange_af)
	}
	if Input_IsHeld(INPUT.DOWN) {
		lastkey[0] = 1
		if !Input_IsHeld(INPUT.RIGHT) && !Input_IsHeld(INPUT.LEFT)
			lastkey[1] = -1
	}
	else if Input_IsHeld(INPUT.UP) {
		lastkey[0] = 0
		if !Input_IsHeld(INPUT.RIGHT) && !Input_IsHeld(INPUT.LEFT)
			lastkey[1] = -1
	}
	if Input_IsHeld(INPUT.RIGHT) {
		lastkey[1] = 1
		if !Input_IsHeld(INPUT.UP) && !Input_IsHeld(INPUT.DOWN)
			lastkey[0] = -1
	}
	else if Input_IsHeld(INPUT.LEFT) {
		lastkey[1] = 0
		if !Input_IsHeld(INPUT.UP) && !Input_IsHeld(INPUT.DOWN)
			lastkey[0] = -1
	}
	var SPD=Player_GetSpdTotal()
	var SPD=(Input_IsHeld(INPUT.CANCEL) ? SPD/2 : SPD);
	repeat(SPD*10){
		if(lastkey[0]==0){
			if(!position_meeting(x,y-sprite_height/2,block)){
				y-=0.1;
			}
		}
		if(lastkey[0]==1){
			if(!position_meeting(x,y+sprite_height/2,block)){
				y+=0.1;
			}
		}
		if(lastkey[1]==0){
			if(!position_meeting(x-sprite_width/2,y,block)){
				x-=0.1;
			}
		}
		if(lastkey[1]==1){
			if(!position_meeting(x+sprite_width/2,y,block)){
				x+=0.1;
			}
		}
	}
	t++
}
else {
	lastkey[0] = 0
	lastkey[1] = 0
}