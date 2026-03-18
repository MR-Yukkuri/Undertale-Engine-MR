if is_paps {
	///@desc Soul Collision
	switch(color) {
		case COLOR.WHITE:
			if global.kr && use_kr_paps {
				if !instance_exists(hurter) {
					Player_HurtKr(damage_paps)
					instance_create_depth(0,0,0,hurter)
				}
			}
			else {
				Battle_CallSoulEventHurt();
				Player_Hurt(damage_paps)
			}
			break
		case COLOR.BLUE:
			if global.is_moving {
				if global.kr && use_kr_paps {
					if !instance_exists(hurter) {
						Player_HurtKr(damage_paps)
						instance_create_depth(0,0,0,hurter)
					}
				}
				else {
					Battle_CallSoulEventHurt();
					Player_Hurt(damage_paps)
				}
			}
			break
	
		case COLOR.ORANGE:
			if !global.is_moving {
				if global.kr && use_kr_paps {
					if !instance_exists(hurter) {
						Player_HurtKr(damage_paps)
						instance_create_depth(0,0,0,hurter)
					}
				}
				else {
					Battle_CallSoulEventHurt();
					Player_Hurt(damage_paps)
				}
			}
			break
	
		case COLOR.GREEN:
			if global.kr && use_kr_paps {
				if !instance_exists(healer) {
					Player_Heal(damage_paps)
					instance_create_depth(0,0,0,healer).alarm[0] = 1
				}
			}
			else {
				Player_Heal(damage_paps,Player_GetInvTotal())
			}
			break
	}
}
else
	event_inherited();


