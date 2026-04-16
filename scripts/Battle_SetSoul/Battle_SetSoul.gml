///@arg soul_obj
///@arg sound 
///@arg effect
function Battle_SetSoul(SOUL,SND=false,EFFECT=false) {
	if(Battle_IsSoulValid(SOUL)&&object_exists(SOUL)){
		var X=0;
		var Y=0;
		if(instance_exists(battle_soul)){
			X=battle_soul.x;
			Y=battle_soul.y;
			instance_destroy(battle_soul);
		}
		var Soul = instance_create_depth(X,Y,DEPTH_BATTLE.SOUL,SOUL);
		if SND
			snd_play(snd_ding)
		if EFFECT {
			var Ef = instance_create_depth(X,Y,DEPTH_BATTLE.SOUL-1,battle_soul_effect);
			Ef.sprite_index = Soul.sprite_index
			Ef.image_blend = Soul.image_blend
		}
		return true;
	}else{
		return false;
	}


}
