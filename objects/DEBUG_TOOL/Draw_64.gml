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
if view_debug {
	var ObjNames = []
	var Id = []
	var Y = undefined
	var Xx = undefined
	var Wid = 0

	if c_state < 2 {
		with (all) {
			var match = (other.c_state == 1 && array_contains(other.obj, id)) || (other.c_state != 1 && other.m_check(x, y, true))
			draw_sprite_ext(spr_debug_overlay, 0, x, y, 1, 1, 0, match ? c_yellow : c_white, 0.5)
			
			if match {
				var name = object_get_name(object_index)
				var tx = x + 16
				var sw = string_width(name)
				if tx + sw > room_width tx = room_width - sw
				if is_undefined(Y) Y = y
				if is_undefined(Xx) || Xx > tx Xx = tx
				if sw > Wid Wid = sw
				array_push(ObjNames, name)
				array_push(Id, id)
			}
		}
	}
	else if c_state == 2 {
		ObjNames = variable_instance_get_names(obj)
		Y = obj.y
		Xx = obj.x + 16

		if array_length(ObjNames) == 0 {
			ObjNames = [ $"<{object_get_name(obj.object_index)}>", "(variable not found)" ]
			Wid = max(string_width(ObjNames[0]), string_width(ObjNames[1]))
		}
		else {
			var widths = []
			for (var i = 0; i < array_length(ObjNames); i++) {
				var key = ObjNames[i]
				widths[i] = string_width(key + " : " + string(variable_instance_get(obj, key)))
			}
			array_sort(widths, function(a, b) { return b - a })
			array_insert(ObjNames, 0, $"<{object_get_name(obj.object_index)}>")
			Wid = max(widths[0], string_width(ObjNames[0]))
		}

		with (all) {
			draw_sprite_ext(spr_debug_overlay, 0, x, y, 1, 1, 0, other.obj == id ? c_yellow : c_white, 0.5)
		}
	}

	if array_length(ObjNames) > 0 {
		if c_state > 0 {
			Xx = list_pos[0]
			Y = list_pos[1]
		}

		draw_set_alpha(0.5)
		draw_roundrect_colour(Xx - 5, Y - 5, Xx + Wid, Y + string_height(" ") * array_length(ObjNames), c_black, c_black, false)
		draw_set_alpha(1)

		var list_hover = m_check(list_pos[0] - 8, list_pos[1] - 5, true)
		if c_state > 0
			draw_sprite_ext(spr_debug_overlay, 1, list_pos[0] - 8, list_pos[1] - 5, 1, 1, 0, list_hover ? c_yellow : c_white, 1)

		for (var i = 0; i < array_length(ObjNames); i++) {
			var key = ObjNames[i]
			var value = (c_state == 2 && i > 0 && key != "(variable not found)") ? " : " + string(variable_instance_get(obj, key)) : ""
			var text = key + value
			var y_pos = Y + i * string_height(" ")
			var hover = (c_state == 1 || (c_state == 2 && i > 0 && key != "(variable not found)")) && m_check_range(Xx, y_pos, Xx + string_width(text), y_pos + string_height(text) - 5)
			draw_text_outline(Xx, y_pos, text, , hover ? c_yellow : c_white, , , 2)
		}

		if mouse_check_button_pressed(mb_left) {
			switch c_state {
				case 0:
					obj = Id
					c_state = 1
					list_pos = [Xx, Y]
					break
				case 1:
					for (var i = 0; i < array_length(ObjNames); i++) {
						var y_pos = Y + i * string_height(" ")
						if m_check_range(Xx, y_pos, Xx + string_width(ObjNames[i]), y_pos + string_height(ObjNames[i])) {
							c_state = 2
							obj = Id[i]
						}
					}
					if list_hover c_state = 0
					break
				case 2:
					if list_hover {
						c_state = 0
						break
					}
					for (var i = 0; i < array_length(ObjNames); i++) {
						var key = ObjNames[i]
						if c_state == 2 && i > 0 && key != "(variable not found)" {
							var text = key + " : " + string(variable_instance_get(obj, key))
							var y_pos = Y + i * string_height(" ")
							if m_check_range(Xx, y_pos, Xx + string_width(text), y_pos + string_height(text) - 5) {
								var val = variable_instance_get(obj, key)
								var new_val = get_string_auto(key, val)
								variable_instance_set(obj, key, new_val)
								mouse_clear(mb_left)
							}
						}
					}
					break
			}
		}

		if c_state > 0 && mouse_check_button(mb_left) {
			list_pos[0] += mouse_x - oldmpos[0]
			list_pos[1] += mouse_y - oldmpos[1]
		}
	}
}
oldmpos = [mouse_x, mouse_y]
