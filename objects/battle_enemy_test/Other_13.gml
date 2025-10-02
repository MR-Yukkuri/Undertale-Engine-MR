///@desc Menu Switch
if !avoid //回避しない場合
{
	switch(Battle_GetMenu()){
	case BATTLE_MENU.FIGHT_TARGET:
		//敵のhpバーを作成
		var inst=instance_create_depth(0,0,0,battle_menu_fight_hp_bar);
		inst.enemy_slot=_enemy_slot;
		inst.hp_max=_hp_max;
		inst.hp=_hp;
		break;
		
		case BATTLE_MENU.FIGHT_DAMAGE:
	
		if Battle_GetMenuChoiceEnemy() == Battle_ConvertEnemySlotToMenuChoiceEnemy(_enemy_slot)
		{
			var dmg=Battle_GetMenuFightDamage();
			var hp_orig=_hp;
		
			_hp=(_hp-dmg >= 0 ? _hp-dmg : 0);
		
			//ダメージを表記する
			var inst=instance_create_depth(x,y-150,0,battle_damage);
			inst.damage=dmg;
			inst.bar_hp_max=_hp_max;
			inst.bar_hp_original=hp_orig;
			inst.bar_hp_target=_hp;
		
			//ダメージの効果音と敵の動き
			if(dmg>0)
			{
				audio_play_sound(snd_damage,0,false);
				var shake=instance_create_depth(0,0,0,shaker);
				shake.target=self;
				shake.var_name="x";
				shake.shake_distance=15;
				shake.shake_decrease=3;
				shake.shake_speed=4;
			}
		}
		break;
	}
}
else //回避する場合
{
	if Battle_GetMenuChoiceEnemy() == Battle_ConvertEnemySlotToMenuChoiceEnemy(_enemy_slot)
	{
		if (!(Battle_GetMenuFightDamage() == -1))
		{
			if (Battle_GetMenu() == BATTLE_MENU.FIGHT_ANIM)
			{
				//回避モーション
				Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,-120,30);
				Anim_Create(id,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,x-120,120,30,40);
			}
			if (Battle_GetMenu() == BATTLE_MENU.FIGHT_DAMAGE)
			{
				//MISS表記
				a = instance_create_depth(Battle_GetEnemyCenterPosX(_enemy_slot),y-150,0,battle_damage);
				a.damage = -2;
			}
		}
	}
}