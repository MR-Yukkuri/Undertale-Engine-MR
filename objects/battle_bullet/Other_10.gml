///@desc Soul Collision
switch(color) {
	case COLOR.WHITE:
		if global.kr && use_kr {
			if !instance_exists(hurter) {
				Player_HurtKr(damage)
				instance_create_depth(0,0,0,hurter)
			}
		}
		else {
			Battle_CallSoulEventHurt();
			Player_Hurt(damage)
		}
		break
	case COLOR.BLUE:
		if global.is_moving {
			if global.kr && use_kr {
				if !instance_exists(hurter) {
					Player_HurtKr(damage)
					instance_create_depth(0,0,0,hurter)
				}
			}
			else {
				Battle_CallSoulEventHurt();
				Player_Hurt(damage)
			}
		}
		break
	
	case COLOR.ORANGE:
		if !global.is_moving {
			if global.kr && use_kr {
				if !instance_exists(hurter) {
					Player_HurtKr(damage)
					instance_create_depth(0,0,0,hurter)
				}
			}
			else {
				Battle_CallSoulEventHurt();
				Player_Hurt(damage)
			}
		}
		break
	
	case COLOR.GREEN:
		if global.kr && use_kr {
			if !instance_exists(healer) {
				Player_Heal(damage)
				instance_create_depth(0,0,0,healer).alarm[0] = 1
			}
		}
		else {
			Player_Heal(damage,Player_GetInvTotal())
		}
		break
}