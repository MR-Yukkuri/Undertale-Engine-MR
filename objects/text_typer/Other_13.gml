///@desc Clear
_char_x=0;
_char_y=0;

var proc=0;
repeat(ds_list_size(_list_inst)){
	var INST=ds_list_find_value(_list_inst,proc);
	if(instance_exists(INST)){
		if INST.fadeout {
			with(INST) {
				var xx,yy
				Anim_Create(id,"alpha",1,1,alpha,-alpha,fadeout_dur)
				if abs(fadeout_x) > 0 || abs(fadeout_y) > 0 {
					if fadeout_rand {
						xx = random_range(-fadeout_x,fadeout_x)
						yy = random_range(-fadeout_y,fadeout_y)
					}
					else {
						xx = fadeout_x
						yy = fadeout_y
					}
					Anim_Create(INST,"x",2,1,x,xx,fadeout_dur)
					Anim_Create(INST,"y",2,1,y,yy,fadeout_dur)
				}
				alarm[0] = fadeout_dur
			}
		}
		else
		instance_destroy(INST);
	}
	proc+=1;
}
ds_list_clear(_list_inst);