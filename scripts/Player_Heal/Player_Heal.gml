///@arg heal 回復量
///@arg inv インターバル
///@arg mode 0:本家準拠 1:余剰分のKRを削除 2:KRを考慮しない
function Player_Heal(heal,inv=0,mode=0) {
	var HEAL=argument[0];

	if(HEAL>=0)&&(inv<=0||!instance_exists(healer)){
		var HP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP);
		var HP_MAX=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP_MAX);
		switch mode {
			case 0:
				Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.HP,(HP+HEAL<=HP_MAX-Player_GetKr() ? HP+HEAL : HP_MAX-Player_GetKr()));
				break
			case 1:
				Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.HP,(HP+HEAL<=HP_MAX ? HP+HEAL : HP_MAX));
				if Player_GetHp()+Player_GetKr() > Player_GetHpMax() {
					Player_SetKr(max(0,Player_GetKr()-(Player_GetHp()+Player_GetKr()-Player_GetHpMax())))
				}
				break
			case 2:
				Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.HP,(HP+HEAL<=HP_MAX ? HP+HEAL : HP_MAX));
				break
		}
		if inv > 0 {
			instance_create_depth(0,0,0,healer).alarm[0] = inv
		}
		return true;
	}else{
		return Player_Hurt(-HEAL);
	}

}
