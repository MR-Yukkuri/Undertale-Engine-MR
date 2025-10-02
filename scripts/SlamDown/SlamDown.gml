///@arg anim_target アニメーションを再生する敵
///@desc ソウルを下に叩きつけます。
function SlamDown(anim_target=battle_enemy){
var TARGET = anim_target
Battle_SetSoul(battle_soul_blue)
battle_soul.dir = DIR.DOWN;
battle_soul.move = 6;
battle_soul.impact = 1;
battle_soul.jump_state = 2;
with (TARGET)
{
	if variable_instance_exists(id,"slamv_sprite") {
		alarm[3] = -1
		body_sprite = slamv_sprite
		body_image = 0
		Anim_Destroy(id,"slambody_x")
		Anim_Destroy(id,"slambody_y")
		Anim_Destroy(id,"slamhead_x")
		Anim_Destroy(id,"slamhead_y")
		Anim_Destroy(id,"body_image")
		Anim_Create(id,"slambody_x",2,0,slambody_x,-slambody_x,5)
		Anim_Create(id,"slamhead_x",2,0,slamhead_x,-slamhead_x,5)
		Anim_Create(id,"slambody_y",2,0,slambody_y,-5-slambody_y,5)
		Anim_Create(id,"slamhead_y",2,0,slambody_y,-7-slambody_y,5)
		Anim_Create(id,"slambody_y",2,1,-5,10,7,5)
		Anim_Create(id,"slamhead_y",2,1,-7,14,7,5)
		Anim_Create(id,"body_image",2,1,0,sprite_get_number(slamv_sprite)-1,6,5)
	    alarm[2] = 13
	}
}

}