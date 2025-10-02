var Txt = "",yy=10
draw_set_font(font_mars_needs_cunnilingus)
draw_set_color(c_white)
for(var i=0;i<array_length(show_variable);i++) {
	var is_global = show_variable[i].obj == global
	var is_system = show_variable[i].obj == noone
	if instance_exists(show_variable[i].obj) || is_global || is_system {
		if !is_array(show_variable[i].variable) {
			show_variable[i].variable = [show_variable[i].variable]
		}
		Txt = is_global ? "global" : (is_system ? "game" : object_get_name(show_variable[i].obj))
		draw_text_outline(30,yy,Txt,,,,,2)
		var Col = m_check(10,yy+4) ? c_yellow : c_white
		if mouse_check_button_pressed(mb_left) && m_check(10,yy+4) {
			show_variable[i].show = !show_variable[i].show
		}
		draw_sprite_ext(spr_debug_hiddenbox,show_variable[i].show,10,yy+4,1,1,0,Col,1)
		yy+=string_height(Txt)
		if show_variable[i].show {
			for(var ii=0;ii<array_length(show_variable[i].variable);ii++) {
				var V = is_global ? variable_global_get(show_variable[i].variable[ii]) : (is_system ? show_variable[i].variable[ii] : variable_instance_get(show_variable[i].obj,show_variable[i].variable[ii]))
				Txt = $"{is_system ? show_variable[i].var_name[ii] : show_variable[i].variable[ii]}:{V}"
				draw_text_outline(30+18,yy,Txt,c_black,,,,2)
				if is_bool(V) && !is_system{
					var Col = m_check(10+18,yy+4) ? c_yellow : c_white
					if mouse_check_button_pressed(mb_left) && m_check(10+18,yy+4) {
						if is_global
							variable_global_set(show_variable[i].variable[ii],!variable_global_get(show_variable[i].variable[ii]))
						else
							variable_instance_set(show_variable[i].obj,show_variable[i].variable[ii],!variable_instance_get(show_variable[i].obj,show_variable[i].variable[ii]))
					}
					draw_sprite_ext(spr_debug_checkbox,V,10+18,yy+4,1,1,0,Col,1)
				}
				
				yy+=string_height(Txt)
			}
		}
	}
}
/*if mouse_check_button_pressed(mb_right) && !click{
	click = true
	mx = mouse_x
	my = mouse_y
	obj = instance_nearest(mx,my,all)
}
if click {
	if instance_exists(obj) {
		var Obj_name = object_get_name(obj.object_index)
		draw_set_alpha(0.5)
		draw_roundrect_color(mx,my,mx+string_width(Obj_name)+4,my+string_height(Obj_name)+4,c_black,c_black,false)
		draw_set_alpha(1)
		draw_roundrect_color(mx,my,mx+string_width(Obj_name)+4,my+string_height(Obj_name)+4,c_white,c_white,1)
		draw_text(mx+5,my+5,Obj_name)
		
	}
	else {
		click = false
	}
}*/