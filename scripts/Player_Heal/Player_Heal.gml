///@arg heal
function Player_Heal(heal,inv=0) {
	var HEAL=argument[0];

	if(HEAL>=0)&&(inv<=0||!instance_exists(healer)){
		var HP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP);
		var HP_MAX=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP_MAX);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.HP,(HP+HEAL<=HP_MAX ? HP+HEAL : HP_MAX));
		if inv > 0 {
			instance_create_depth(0,0,0,healer).alarm[0] = inv
		}
		return true;
	}else{
		return Player_Hurt(-HEAL);
	}

}
