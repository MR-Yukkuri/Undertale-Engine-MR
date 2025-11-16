depth = -9999
view_debug = false
show_variable = [
	{
		obj : global,
		variable : ["infhp","kr","color_damagetype","overlay"],
		show : false
	},
	{
		obj : DEBUG_TOOL,
		variable : "view_debug",
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
c_state = 0
obj = []
list_pos = [0,0]
oldmpos = [device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)]

m_check = function(x,y,overlay=false) {
	if overlay
	return device_mouse_x_to_gui(0) >= x-6 && device_mouse_x_to_gui(0) <= x+6 && device_mouse_y_to_gui(0) >= y-6 && device_mouse_y_to_gui(0)<= y+6
	else
	return device_mouse_x_to_gui(0) >= x && device_mouse_x_to_gui(0) <= x+12 && device_mouse_y_to_gui(0) >= y && device_mouse_y_to_gui(0)<= y+12
}
m_check_range = function(x1,y1,x2,y2){
	return device_mouse_x_to_gui(0) >= x1 && device_mouse_x_to_gui(0) <= x2 && device_mouse_y_to_gui(0) >= y1 && device_mouse_y_to_gui(0)<= y2
}
get_string_auto = function(prompt, default_value) { //chatgptにやらせたので不具合あるかも
    var type_str = typeof(default_value)
    var str_input = get_string(prompt, string(default_value))
    if str_input == "" str_input = string(default_value)

    var result

    switch (type_str) {
        case "number":
        case "int32":
        case "int64":
            result = real(str_input)
            break

        case "bool":
            var lower = string_lower(str_input)
            result = (lower == "true" || lower == "1")
            break

        case "string":
            result = str_input
            break

        case "array":
            if string_char_at(str_input, 1) == "[" {
                var parsed = json_parse(str_input)
                if is_array(parsed)
                    result = parsed
                else
                    result = [str_input]
            } else {
                result = string_split(str_input, ",")
                for (var i = 0; i < array_length(result); i++) {
                    var val = string_trim(result[i])
                    if string_length(val) > 0 && is_real(val)
                        result[i] = real(val)
                    else
                        result[i] = val
                }
            }
            break

        case "struct":
            var ok = false
            if string_char_at(str_input, 1) == "{" {
                var parsed = json_parse(str_input)
                if is_struct(parsed) {
                    result = parsed
                    ok = true
                }
            }
            if !ok {
                result = {}
                var parts = string_split(str_input, ",")
                for (var i = 0; i < array_length(parts); i++) {
                    var kv = string_split(parts[i], "=")
                    if array_length(kv) >= 2 {
                        var key = string_trim(kv[0])
                        var val = string_trim(kv[1])
                        if is_real(val)
                            val = real(val)
                        result[$ key] = val
                    }
                }
            }
            break

        case "method":
            if script_exists(asset_get_index(str_input))
                result = method(global, asset_get_index(str_input))
            else
                result = default_value
            break

        case "ptr":
            result = default_value
            show_debug_message("⚠ pointer型は変更できません")
            break

        case "undefined":
            result = str_input
            break

        default:
            result = str_input
            break
    }

    return result
}
