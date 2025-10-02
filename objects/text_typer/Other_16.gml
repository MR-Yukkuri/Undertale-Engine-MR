var Txt = GetTextSizePerLine(text)
var scale_x = _group_font_scale_x[_font,0] * _scale_x;
switch(_halign) {
	case 0:
		_align_x = 0
		break
	case 1:
		_align_x = -Txt[_line,0]/2
		break
	case 2:
		_align_x = -Txt[_line,0]
		break
}
var H = 0
for(var i=0;i<array_length(Txt);i++) {
	H+=Txt[i,1]
}
var scale_y = Txt[_line,2]
switch(_valign) {
	case 0:
		_align_y = 0
		break
	case 1:
		_align_y = -H/2
		break
	case 2:
		_align_y = -H
		break
}