surface_set_target(Battle_GetBoardSurface())
draw_set_color(image_blend)
draw_set_alpha(image_alpha)
var segments = 64
var step = 360/segments
for (var i = 0; i < 360; i += step) {
    var x1 = x+lengthdir_x(radius,i)
    var y1 = y+lengthdir_y(radius,i)
    var x2 = x+lengthdir_x(radius,i+step)
    var y2 = y+lengthdir_y(radius,i+step)
    draw_line_width(x1,y1,x2,y2,2)
}
draw_set_alpha(1)
draw_set_color(c_white)
surface_reset_target()
