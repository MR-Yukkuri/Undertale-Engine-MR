if(place_meeting(x,y,battle_soul))&&image_alpha>0.6&&hit{
	Battle_CallSoulEventBulletCollision();
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
image_angle+=rotate