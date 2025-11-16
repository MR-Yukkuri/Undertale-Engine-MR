// Inherit the parent event
event_inherited();
distance-=spd
if mode == 1 && !is_c && distance <= c_dis {
	is_c = true
	Anim_Create(id,"dir",2,1,dir,180,25)
	direction += 180
}
if follow_soul {
	x = battle_soul.x+lengthdir_x(distance,dir+180)
	y = battle_soul.y+lengthdir_y(distance,dir+180)
}
else {
	x = cx+lengthdir_x(distance,dir+180)
	y = cy+lengthdir_y(distance,dir+180)
}
if instance_exists(battle_soul_green)&&battle_soul_green.shield_amount==1 {
	if assist {
		if mode == 0 && instance_nearest(battle_soul.x,battle_soul.y,battle_bullet_arrow) == id {
			image_index = 1
		}
		else {
			image_index = 0
		}
	}
}