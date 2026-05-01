var Txt = GetTextSizePerLine(text);
var line_count = array_length(Txt);
var current_line = clamp(_line, 0, line_count - 1);

var H = 0;
for (var i = 0; i < line_count; i++) {
	H += Txt[i, 1];
	switch (_halign) {
		case 0:
			_line_align_x[i] = 0;
			break;
		case 1:
			_line_align_x[i] = -Txt[i, 0] / 2;
			break;
		case 2:
			_line_align_x[i] = -Txt[i, 0];
			break;
	}
}

_align_x = _line_align_x[current_line];

switch (_valign) {
	case 0:
		_align_y = 0;
		break;
	case 1:
		_align_y = -H / 2;
		break;
	case 2:
		_align_y = -H;
		break;
}

for (var proc = 0; proc < ds_list_size(_list_inst); proc++) {
	var INST = _list_inst[| proc];
	if (instance_exists(INST)) {
		with (INST) {
			_align_x = other._line_align_x[_line];
			_align_y = other._align_y;
			other.CharUpdate(id);
		}
	}
}
