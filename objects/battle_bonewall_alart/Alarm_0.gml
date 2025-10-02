state = 1
alarm[2] = -1
var bone = []
audio_play_sound(snd_bonewall,0,0)
switch(dir) {
	case DIR.DOWN:
	case DIR.UP:
		for(var i=0;battle_board.x-battle_board.left-2+space*i<battle_board.x+battle_board.right+5;i++) {
			if dir==DIR.DOWN {
				bone[i] = MakeBoneBottom(battle_board.x-battle_board.left-2+space*i,0,,,,color,,,,alarm[1]+5,,,,follow,follow_target)
				bone[i].y+=6
			}
			else {
				bone[i] = MakeBoneTop(battle_board.x-battle_board.left-2+space*i,0,,,,color,,,,alarm[1]+5,,,,follow,follow_target)
				bone[i].y-=6
			}
			if follow
			MakeShaker(bone[i],"follow_x",3,,,,5)
			else
			MakeShaker(bone[i],"x",3,,,,5)
		}
		break
	case DIR.LEFT:
	case DIR.RIGHT:
		for(var i=0;battle_board.y-battle_board.up-2+space*i<battle_board.y+battle_board.down+5;i++) {
			if dir == DIR.LEFT {
				bone[i] = MakeBoneLeft(battle_board.y-battle_board.up-2+space*i,0,,,,color,,,,alarm[1]+5,,,,follow,follow_target)
				bone[i].x-=6
			}
			else {
				bone[i] = MakeBoneRight(battle_board.y-battle_board.up-2+space*i,0,,,,color,,,,alarm[1]+5,,,,follow,follow_target)
				bone[i].x+=6
			}
			if follow
			MakeShaker(bone[i],"follow_x",3,,,,5)
			else
			MakeShaker(bone[i],"y",3,,,,5)
		}
		break
}
for(var i=0;i<array_length(bone);i++) {
	Anim_Create(bone[i],"length",0,0,0,length,5)
	Anim_Create(bone[i],"length",0,0,length,-length,5,alarm[1])
}