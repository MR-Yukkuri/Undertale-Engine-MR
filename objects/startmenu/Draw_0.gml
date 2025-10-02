draw_set_font(font_dt_mono)
if state == MENU_CHOICE.MENU {
	draw_set_halign(fa_center)
	draw_set_font(font_dt_mono)
	for(var i=0;i<array_length(menus);i++) {
		var Col = choice[MENU_CHOICE.MENU] == i ? c_blend : blend
		draw_text_outline(menu_position[0],menu_position[1]+i*menu_space,menus[i,0],c_black,Col,menu_scale,menu_scale,settings_scale,0,menu_alpha)
	}
	draw_set_halign(fa_left)
}
else if state == MENU_CHOICE.SETTINGS {
	for(var i=0;i<array_length(settings)+2;i++) {
		var Col = choice[MENU_CHOICE.SETTINGS] == i ? c_blend : blend
		var V = "",xx,yy
		xx = settings_position[0]
		yy = settings_position[1]+i*settings_space
		if array_length(settings) == i {
			Txt = "Reset to default"
		}
		else if array_length(settings)+1 == i {
			Txt = "Back"
		}
		else {
			if settings[i].obj == global {
				V = variable_global_get(settings[i].val)
			}
			else {
				V = variable_instance_get(settings[i].obj,settings[i].val)
			}
			if settings[i].type == 0 {
				V = V ? "ON" : "OFF"
			}
			else if settings[i].type == 1 {
				V = settings[i].cho[V]
			}
			var Txt = $"{settings[i].name} <{V}>"
		}
		draw_text_outline(xx,yy,Txt,c_black,Col,settings_scale,settings_scale,settings_scale,0,settings_alpha)
	}
}
else if state == MENU_CHOICE.CREDIT {
	draw_set_halign(fa_center)
	for(var i=0;i<array_length(credit);i++) {
		draw_text_outline(credit_position[0],credit_position[1]+i*credit_space,$"{credit[i,0]} by {credit[i,1]}",c_black,blend,credit_scale,credit_scale,credit_scale,0,credit_alpha)
	}
	draw_text_outline(credit_position[0],credit_position[1]+i*credit_space,"[Press x to back]",c_black,c_gray,credit_scale,credit_scale,credit_scale,0,credit_alpha)
	draw_set_halign(fa_left)
}