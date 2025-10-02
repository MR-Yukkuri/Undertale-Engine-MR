if size > 0 {
	if time == 0 {
		var S = use_cos ? cos(count)*space_size : sin(count)*space_size
		if dir == 0 {
			MakeBoneTwoV(x,y+S,center_space,hspd,color,head,,,,,follow,follow_target)
			time = abs(floor(space/hspd))
		}
		else {
			MakeBoneTwoH(x+S,y,center_space,vspd,color,head,,,,,follow,follow_target)
			time = abs(floor(space/vspd))
		}
		size--
		count+=space_cycle
	}
	else time--
}
else {
	instance_destroy()
}