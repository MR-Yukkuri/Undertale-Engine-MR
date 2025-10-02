if time == movetime+pause {
	image_index = 0
}
if time == movetime+pause+5 {
	image_index = 1
}
if time == movetime+pause+10 {
	Camera_Shake(4,4,1,1)
	audio_stop_sound(snd_gb_release)
	audio_play_sound(snd_gb_release,0,0)
	image_index = 2
	alarm[1] = 3
	beam = instance_create_depth(0,0,0,battle_bullet_gb_beam)
	beam_alpha = 1
	beam.color = color
	alarm[2] = duration
	Anim_Create(id,"beam_scale",1,1,0,1,10)
	Anim_Create(id,"beam_yscale",1,1,0,image_yscale*2,10)
}
if time == movetime+pause+15{
	if follow {
		direction = follow_angle+180
		speed = 50
		Anim_Create(id,"follow_hspeed",2,1,0,hspeed,240)
		Anim_Create(id,"follow_vspeed",2,1,0,vspeed,240)
		speed = 0
	}
	else {
		direction = image_angle+180
		Anim_Create(id,"speed",2,1,0,50,240)
	}
}
time++