///@desc text_typer専用
function GetTextSizePerLine(TEXT) {
	var results = [];
	var line = 0;
	var width_sum = 0;
	var line_height = 0;
	var font = 0;
	var scale_x = 1;
	var scale_y = 1;
	var space_x = 0;
	var space_y = 0;

	var resolve_value = function(value) {
		if (ds_map_exists(_map_macro, value)) {
			return ds_map_find_value(_map_macro, value);
		}
		return real(value);
	};

	var len = string_length(TEXT);
	for (var i = 1; i <= len; i++) {
		var ch = string_char_at(TEXT, i);

		if (ch == "\\") {
			i += 1;
			ch = string_char_at(TEXT, i);
		}

		if (ch == "{") {
			var cmd = [];
			var token = "";
			var str_mode = false;
			var str_input = false;

			i += 1;
			while (i <= len) {
				var cmd_char = string_char_at(TEXT, i);
				if ((cmd_char == " " || cmd_char == "}") && !str_input) {
					if (!str_mode && array_length(cmd) > 0) {
						token = resolve_value(token);
					}
					array_push(cmd, token);
					str_mode = false;
					str_input = false;
					token = "";
				}
				else if (cmd_char == "`") {
					str_mode = true;
					str_input = !str_input;
				}
				else {
					if (!str_mode || (str_mode && str_input)) {
						if (cmd_char == "\\") {
							i += 1;
							cmd_char = string_char_at(TEXT, i);
						}
						token += cmd_char;
					}
				}

				if (cmd_char == "}" && !str_input) {
					break;
				}
				i += 1;
			}

			if (array_length(cmd) > 0) {
				switch (cmd[0]) {
					case "font":
						if (array_length(cmd) > 1 && is_real(cmd[1]) && cmd[1] >= 0 && cmd[1] < array_height_2d(_group_font)) {
							font = cmd[1];
						}
						break;
					case "scale":
						if (array_length(cmd) > 1 && is_real(cmd[1])) {
							scale_x = cmd[1];
							scale_y = cmd[1];
						}
						break;
					case "scale_x":
						if (array_length(cmd) > 1 && is_real(cmd[1])) {
							scale_x = cmd[1];
						}
						break;
					case "scale_y":
						if (array_length(cmd) > 1 && is_real(cmd[1])) {
							scale_y = cmd[1];
						}
						break;
					case "space_x":
						if (array_length(cmd) > 1 && is_real(cmd[1])) {
							space_x = cmd[1];
						}
						break;
					case "space_y":
						if (array_length(cmd) > 1 && is_real(cmd[1])) {
							space_y = cmd[1];
						}
						break;
					case "sprite":
						if (array_length(cmd) > 1) {
							var spr = cmd[1];
							if (is_string(spr)) {
								spr = asset_get_index(spr);
							}
							if (sprite_exists(spr)) {
								var sprite_font = 0;
								width_sum += (sprite_get_width(spr) + _group_font_space_x[font, sprite_font] + space_x) * _group_font_scale_x[font, sprite_font] * scale_x;
								draw_set_font(_group_font[font, 0]);
								line_height = max(line_height, (string_height(" ") + _group_font_space_y[font] + space_y) * _group_font_scale_y[font, 0] * scale_y);
							}
						}
						break;
				}
			}
		}
		else if (ch == "&") {
			if (line_height <= 0) {
				draw_set_font(_group_font[font, 0]);
				line_height = (string_height(" ") + _group_font_space_y[font] + space_y) * _group_font_scale_y[font, 0] * scale_y;
			}
			results[line] = [width_sum, line_height, scale_y];
			line += 1;
			width_sum = 0;
			line_height = 0;
		}
		else {
			var char_font = (ord(ch) < 128 ? 0 : 1);
			draw_set_font(_group_font[font, char_font]);
			width_sum += (string_width(ch) + _group_font_space_x[font, char_font] + space_x) * _group_font_scale_x[font, char_font] * scale_x;
			draw_set_font(_group_font[font, 0]);
			line_height = max(line_height, (string_height(" ") + _group_font_space_y[font] + space_y) * _group_font_scale_y[font, 0] * scale_y);
		}
	}

	if (line_height <= 0) {
		draw_set_font(_group_font[font, 0]);
		line_height = (string_height(" ") + _group_font_space_y[font] + space_y) * _group_font_scale_y[font, 0] * scale_y;
	}
	results[line] = [width_sum, line_height, scale_y];
	line += 1;
	width_sum = 0;
	line_height = 0;

	return results;
}
