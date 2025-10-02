function Player_HurtKr(damage=1) {
	var kr=Player_GetKr();
	var hp=Player_GetHp();
	if(hp>1){
		if hp-damage <= 0
			Player_SetHp(1)
		else	
			Player_Hurt(damage);
		if(kr<40){
			Player_SetKr(kr+1);
		}
	}else{
		if(Player_GetKr()>0){
			Player_SetKr(kr-1);
		}else{
			Player_SetHp(0);
		}
	}
	Player_SetKrTimer(40-Player_GetKr())
	return true;


}
