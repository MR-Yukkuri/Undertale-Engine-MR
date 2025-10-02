event_user(0)
menus = [["Start",Menu_Start],["Settings",undefined],["Credit",undefined]]
settings = [
	{
		obj : global,
		name : "InfHp",
		val : "infhp",
		initial : false,
		type : 0
	},
	{
		obj : global,
		name : "Language",
		val : "lang",
		initial : LANGUAGE.JAPANESE,
		type : 1,
		cho : ["English","Japanese"]
	}
]
for(var i=0;i<array_length(settings);i++) {
	var Obj = settings[i].obj
	var Val = settings[i].val
	var Load = LoadFile(Val,settings[i].initial)
	if Obj == global {
		variable_global_set(Val,is_bool(settings[i].initial) ? bool(Load) : Load)
	}
	else if instance_exists(Obj) {
		variable_instance_set(Obj,Val,is_bool(settings[i].initial) ? bool(Load) : Load)
	}
}
credit = [
	["UNDERTALE ENGINE","TML"],
	["Engine modded","zhazha/MR"]
]
enum MENU_CHOICE {
	MENU,
	SETTINGS,
	CREDIT
}
state = 0
choice = array_create(3,0)
blend = c_white
c_blend = c_yellow
menu_position = [160,120]
menu_alpha = 1
menu_scale = 1
menu_space = 15

settings_position = [80,120]
settings_scale = 1
settings_alpha = 1
settings_space = 15

credit_position = [160,120]
credit_scale = 1
credit_alpha = 1
credit_space = 15