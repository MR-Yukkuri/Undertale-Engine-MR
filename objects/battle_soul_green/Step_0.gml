// Inherit the parent event
event_inherited();

if(Battle_GetState()==BATTLE_STATE.IN_TURN && moveable){
	for(var i=0;i<shield_amount;i++) {
		if(keyboard_check_pressed(input[i,0])){
			if(!position_meeting(x,y-sprite_height/2,block)){
				dir[i] = DIR.UP;
			}
		}
		if(keyboard_check_pressed(input[i,1])){
			if(!position_meeting(x,y+sprite_height/2,block)){
				dir[i] = DIR.DOWN;
			}
		}
		if(keyboard_check_pressed(input[i,2])){
			if(!position_meeting(x-sprite_width/2,y,block)){
				dir[i] = DIR.LEFT;
			}
		}
		if(keyboard_check_pressed(input[i,3])){
			if(!position_meeting(x+sprite_width/2,y,block)){
				dir[i] = DIR.RIGHT;
			}
		}
	}
}