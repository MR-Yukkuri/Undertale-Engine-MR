///@arg anim_target アニメーションを再生する敵
///@desc ソウルを左に叩きつけます。
function SlamLeft(anim_target=battle_enemy){
var TARGET = anim_target
Battle_SetSoul(battle_soul_blue)
battle_soul.dir = DIR.LEFT;
battle_soul.move = 6;
battle_soul.impact = 1;
battle_soul.jump_state = 2;
with (TARGET)
{
	if variable_instance_exists(id,"slamh_sprite") {
	    alarm[3] = -1
		body_sprite = slamh_sprite
		body_image = sprite_get_number(slamh_sprite)-1
		Anim_Destroy(id,"slambody_x")
		Anim_Destroy(id,"slambody_y")
		Anim_Destroy(id,"slamhead_x")
		Anim_Destroy(id,"slamhead_y")
		Anim_Destroy(id,"body_image")
		Anim_Create(id,"slambody_y",2,0,slambody_y,-slambody_y,5)
		Anim_Create(id,"slamhead_y",2,0,slamhead_y,-slamhead_y,5)
		Anim_Create(id,"slambody_x",2,0,slambody_x,5-slambody_x,5)
		Anim_Create(id,"slamhead_x",2,0,slambody_x,7-slambody_x,5)
		Anim_Create(id,"slambody_x",2,1,5,-10,7,5)
		Anim_Create(id,"slamhead_x",2,1,7,-14,7,5)
		Anim_Create(id,"body_image",2,1,sprite_get_number(slamh_sprite)-1,-(sprite_get_number(slamh_sprite)-1),6,5)
	    alarm[2] = 13
	}
}

}