///@desc Menu End
switch (Battle_GetMenuChoiceButton())
{
	case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
		// 敵が倒されているかチェック
		if (_hp <= 0) {
			//死後の塵
			var inst = instance_create_depth(x,y,0,battle_death_particle);
			inst.sprite = sprite_index;
			inst.scale_x = image_xscale;
			inst.scale_y = image_yscale;
			audio_play_sound(snd_vaporize,0,0);
			Battle_RewardExp(_exp);
			Battle_RewardGold(_gold);
			instance_destroy();
		}
		break;
	case BATTLE_MENU_CHOICE_BUTTON.ACT:
		if Battle_GetMenuChoiceEnemy() == Battle_ConvertEnemySlotToMenuChoiceEnemy(_enemy_slot)
		{
		    switch (Battle_GetMenuChoiceAction())
			{
				//行動のテキスト
		        case 0:
					//act1
					Dialog_Add("* Act1 text");
		            break;

		        case 1:
		            //act2
		            Dialog_Add("* Act2 text");
		            break;

		        case 2:
		            // act3
		            Dialog_Add("* Act3 text");
					break;
				case 3:
		            // act4
		            Dialog_Add("* Act4 text");
					break;
				case 4:
		            // act5
		            Dialog_Add("* Act5 text");
					break;
				case 5:
		            // act6
		            Dialog_Add("* Act6 text");
					break;
		    }
		}
			break;
	case BATTLE_MENU_CHOICE_BUTTON.MERCY:
		switch(Battle_GetMenuChoiceMercy())
		{
			case 0:
				if Battle_IsEnemySpareable(_enemy_slot)
				{
					repeat(14)
					{
						var dust = instance_create_depth(Battle_GetEnemyCenterPosX(_enemy_slot)+random_range(-25,25),Battle_GetEnemyCenterPosY(_enemy_slot)+random_range(-25,25),depth-1,battle_dustcloud);
						var X = Battle_GetEnemyCenterPosX(_enemy_slot);
						var Y = Battle_GetEnemyCenterPosY(_enemy_slot);
						with(dust)
						{
							if x > X && y < Y
								direction = random_range(0,90);
							else if x < X && y < Y
								direction = random_range(90,180);
							else if x < X && y > Y
								direction = random_range(180,270);
							else
								direction = random_range(270,360);
						}
					}

					image_alpha = 0.5;
					audio_stop_sound(snd_vaporize);
					audio_play_sound(snd_vaporize,0,0);
					Battle_RemoveEnemy(_enemy_slot);
					Battle_RewardGold(_gold);
				}
				break;
		}
		break;
}