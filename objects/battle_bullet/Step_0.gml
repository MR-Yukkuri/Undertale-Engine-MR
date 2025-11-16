if(place_meeting(x,y,battle_soul))&&image_alpha>0.6&&hit{
	Battle_CallSoulEventBulletCollision();
	if hit_destroy {
		instance_destroy()
	}
}
if instance_exists(battle_soul_yellow_bullet) && (place_meeting(x,y,battle_soul_yellow_bullet)&&can_break){
	with(battle_soul_yellow_bullet) {
		if place_meeting(x,y,other.id) {
			instance_destroy()
		}
	}
	event_user(3)
	snd_play(snd_mtt_burst)
}
if can_prevent && instance_exists(battle_soul_green) {
	var des = true
	for(var i=0;i<array_length(target_shield);i++) {
		if battle_soul.dir[target_shield[i]]%360 == (direction+180)%360 && point_distance(x,y,battle_soul.x,battle_soul.y) <= 32+(sprite_width-sprite_xoffset){
			if i == array_length(target_shield)-1 && des {
				snd_play(snd_ding)
				battle_soul.s_hit[target_shield[i]] = 4
				instance_destroy()
			}
		}
		else {
			des = false
		}
	}
}
image_angle+=rotate