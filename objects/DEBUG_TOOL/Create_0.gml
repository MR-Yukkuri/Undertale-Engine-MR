depth = -9999
show_variable = [
	{
		obj : global,
		variable : ["infhp","kr","color_damagetype","overlay"],
		show : false
	},
	{
		obj : battle_turn,
		variable : "time",
		show : true
	},
	{
		obj : battle_soul,
		variable : ["x","y"],
		show : false
	},
	{
		obj : battle_board,
		variable : ["up","down","left","right"],
		show : false
	}
]
click = false
mx = 0
my = 0
obj = noone
m_check = function(x,y) {
	return mouse_x/(room_width/640) >= x && mouse_x/(room_width/640) <= x+12 && mouse_y/(room_height/480) >= y && mouse_y/(room_height/480)<= y+12
}