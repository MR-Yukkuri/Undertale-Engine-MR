if size > 0 {
	if time == 0 {
		var S = use_cos ? cos(count)*space_size : sin(count)*space_size
		if dir == 0 {
			if is_paps
			MakeBoneTwoVP(x,y+S,center_space,hspd,color,head,,,,,follow,follow_target)
			else
			MakeBoneTwoV(x,y+S,center_space,hspd,color,head,,,,,follow,follow_target)
			time = floor(space/abs(hspd))
		}
		else {
			if is_paps
			MakeBoneTwoHP(x+S,y,center_space,vspd,color,head,,,,,follow,follow_target)
			else
			MakeBoneTwoH(x+S,y,center_space,vspd,color,head,,,,,follow,follow_target)
			time = floor(space/abs(vspd))
		}
		size--
		count+=space_cycle
	}
	else time--
}
else {
	instance_destroy()
}