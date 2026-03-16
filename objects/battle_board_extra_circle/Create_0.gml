depth = DEPTH_BATTLE.BOARD;
radius = 60;	//圆的半径
board_number = global.borderCount

// 返回是否在圆内
function contains(_x, _y) {
	return sqr(_x - x) + sqr(_y - y) <= sqr(radius);
}

// 将点限制到圆内
// 返回限制结果
function limit(_x, _y) {
	_x -= x;
	_y -= y;
    var dist = sqrt(sqr(_x) + sqr(_y));
    if (dist <= 0) return [x + radius, y];
	var mul = radius / dist;
	return [_x * mul + x, _y * mul + y];
}

// 对_surf进行遮罩
function replaceSurfaceAlpha(_surf, _xOffset = 0, _yOffset = 0, _fillAlpha = true) {
	//一些设定
	surface_set_target(_surf);
	gpu_set_colorwriteenable(false, false, false, true);
	gpu_set_blendenable(false);
	
	//填充透明
	if(_fillAlpha) {
		draw_set_alpha(0);
		draw_rectangle(0, 0, surface_get_width(_surf), surface_get_height(_surf), false);
	}
	
	//挖空
	draw_set_alpha(1);
	draw_circle(x + _xOffset, y + _yOffset, radius, false);

	//恢复默认
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();
}

function drawFill(_color = undefined, _alpha = undefined) {
    var color = (_color != undefined) ? _color : ((instance_exists(battle_board)) ? battle_board.color_frame : c_white);
    var alpha = (_alpha != undefined) ? _alpha : ((instance_exists(battle_board)) ? battle_board.alpha_frame : 1);
    
    draw_set_color(color);
    draw_set_alpha(alpha);
    draw_circle(x, y, radius, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}

function drawBorder() {
    var thickness = 5;
    var sides = 64;
    var color = (instance_exists(battle_board)) ? battle_board.color_frame : c_white;
    var alpha = (instance_exists(battle_board)) ? battle_board.alpha_frame : 1;

    draw_set_color(color);
    draw_set_alpha(alpha);
    
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= sides; i++) {
        var angle = (i / sides) * 360;
        var dx = dcos(angle), dy = dsin(angle);
        
        // Draw from the radius to the outside
        var r_out = radius + thickness;
        var r_in = radius;
        
        draw_vertex(x + dx * r_out, y + dy * r_out);
        draw_vertex(x + dx * r_in, y + dy * r_in);
    }
    draw_primitive_end();
    
    draw_set_color(c_white);
    draw_set_alpha(1);
}
