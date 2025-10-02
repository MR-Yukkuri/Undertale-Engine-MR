///@desc Functions
//設定リセット
Settings_Reset = function() {
	var Obj
	for(var i=0;i<array_length(settings);i++) {
		Obj = settings[i].obj
		if Obj == global {
			variable_global_set(settings[i].val,settings[i].initial)
		}
		else if instance_exists(Obj) {
			variable_instance_set(Obj,settings[i].val,settings[i].initial)
		}
	}
}
#region Select
Menu_Select = function(_max=1,type=0) {
	var vi = Input_IsPressed(INPUT.DOWN)-Input_IsPressed(INPUT.UP)
	var hi = Input_IsPressed(INPUT.RIGHT)-Input_IsPressed(INPUT.LEFT)
	if (type ? hi : vi) != 0{
		snd_play(snd_menu_switch)
	}
	choice[state]+= type ? hi : vi
	if choice[state] < 0 {
		choice[state] = _max-1
	}
	choice[state]%=_max
	
}
Menu_Cancel = function(bstate = 0) {
	if Input_IsPressed(INPUT.CANCEL) {
		snd_play(snd_menu_cancel)
		state = bstate
	}
}
#endregion
//start選択時
Menu_Start = function(){
	Encounter_Start(0)
}