var confirm = Input_IsPressed(INPUT.CONFIRM)
switch(state) {
	#region Menu
	case MENU_CHOICE.MENU:
		Menu_Select(array_length(menus))
		if confirm {
			snd_play(snd_menu_confirm)
			state = choice[MENU_CHOICE.MENU]
			if array_get(menus[choice[MENU_CHOICE.MENU]],1) != undefined
				script_execute(menus[choice[MENU_CHOICE.MENU],1])
		}
		break
	#endregion
	#region Settings
	case MENU_CHOICE.SETTINGS:
		Menu_Select(array_length(settings)+2)
		if confirm {
			snd_play(snd_menu_confirm)
			var i = choice[MENU_CHOICE.SETTINGS]
			if i == array_length(settings) {
				Settings_Reset()
			}
			else if i == array_length(settings)+1 {
				state = MENU_CHOICE.MENU
				choice[MENU_CHOICE.SETTINGS] = 0
			}
			else {
				var Obj = settings[i].obj
				var Val = settings[i].val
				if Obj == global {
					variable_global_set(Val,!variable_global_get(Val))
					SaveFile(Val,variable_global_get(Val))
				}
				else if instance_exists(Obj) {
					variable_instance_set(Obj,Val,!variable_instance_get(Obj,Val))
					SaveFile(Val,variable_instance_get(Obj,Val))
				}
				
			}
		}
		break
	#endregion
	#region Credit
	case MENU_CHOICE.CREDIT:
		Menu_Cancel(MENU_CHOICE.MENU)
		break
	#endregion
}