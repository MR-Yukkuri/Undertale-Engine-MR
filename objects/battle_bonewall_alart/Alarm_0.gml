state = 1
alarm[2] = -1
var bone = []
audio_play_sound(snd_bonewall,0,0)
switch(dir) {
	case DIR.DOWN:
	case DIR.UP:
		for(var i=0;fx-follow_target.left-2+space*i<fx+follow_target.right+5;i++) {
			if dir==DIR.DOWN {
				bone[i] = MakeBoneBottom(fx-follow_target.left-2+space*i,0,,,,color,,,,alarm[1]+5,,,,,follow,follow_target)
				if follow
				bone[i].follow_y+=6
				else
				bone[i].y+=6
			}
			else {
				bone[i] = MakeBoneTop(fx-follow_target.left-2+space*i,0,,,,color,,,,alarm[1]+5,,,,,follow,follow_target)
				if follow
				bone[i].follow_y-=6
				else
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
		for(var i=0;fy-follow_target.up-2+space*i<fy+follow_target.down+5;i++) {
			if dir == DIR.LEFT {
				bone[i] = MakeBoneLeft(fy-follow_target.up-2+space*i,0,,,,color,,,,alarm[1]+5,,,,,follow,follow_target)
				if follow
				bone[i].follow_x-=6
				else
				bone[i].x-=6
			}
			else {
				bone[i] = MakeBoneRight(fy-follow_target.up-2+space*i,0,,,,color,,,,alarm[1]+5,,,,,follow,follow_target)
				if follow
				bone[i].follow_x+=6
				else
				bone[i].x+=6
			}
			if follow
			MakeShaker(bone[i],"follow_y",3,,,,5)
			else
			MakeShaker(bone[i],"y",3,,,,5)
		}
		break
}
for(var i=0;i<array_length(bone);i++) {
	bone[i].auto_destroy = false
	Anim_Create(bone[i],"length",0,0,0,length,5)
	Anim_Create(bone[i],"length",0,0,length,-length,5,alarm[1])
}