surface_set_target(_surface3)
draw_surface(application_surface,0,0)
surface_reset_target()
surface_set_target(_surface3)
gpu_set_alphatestenable(0)
gpu_set_blendmode(bm_normal)
gpu_set_blendenable(false)
gpu_set_colorwriteenable(0, 0, 0, 1)
draw_set_alpha(1)
draw_surface(_surface1, 0, 0)
draw_set_alpha(1)
gpu_set_blendenable(true)
gpu_set_colorwriteenable(1, 1, 1, 1)
surface_reset_target()

surface_set_target(_surface4)
draw_surface(_surface,0,0);
surface_reset_target();

surface_set_target(_surface)
	draw_clear_alpha(color_bg,0);
surface_reset_target();

surface_set_target(_surface);

// カメラの位置から背景を描画する座標を求める
var view_transform = camera.calculate_view_transform();
var appsurf_x, appsurf_y, appsurf_angle;
appsurf_angle = -view_transform[$"angle"];
appsurf_x = view_transform[$"top_left_x"] + view_transform[$"size_x"] / 2;
appsurf_y = view_transform[$"top_left_y"] + view_transform[$"size_y"] / 2;
appsurf_x += lengthdir_x(view_transform[$"size_x"] / 2, appsurf_angle + 180) + lengthdir_x(view_transform[$"size_y"] / 2, appsurf_angle + 90)
appsurf_y += lengthdir_y(view_transform[$"size_x"] / 2, appsurf_angle + 180) + lengthdir_y(view_transform[$"size_y"] / 2, appsurf_angle + 90)

// _surfaceに背景を描画する
draw_surface_ext(application_surface,appsurf_x+camera._shake_pos_x,appsurf_y+camera._shake_pos_y,1/camera.scale_x,1/camera.scale_y,appsurf_angle,c_white,1-alpha_bg);
draw_surface(_surface4,0,0);

surface_reset_target();


for(var i = 0; i < global.borderCount; i++){
	bb = ds_list_find_value(global.borders_list,i);
	if(instance_exists(bb)){
		bb.replaceSurfaceAlpha(_surface, 0, 0, i == 0);
	}
}
surface_set_target(sur)
for(var i = 0; i < global.borderCount; i++){
	bb = ds_list_find_value(global.borders_list,i);
	if(instance_exists(bb)){
		with(bb){
			drawBorder();
		}
	}
}
gpu_set_blendmode(bm_subtract);
for(var i = 0; i < global.borderCount; i++){
	bb = ds_list_find_value(global.borders_list,i);
	if(instance_exists(bb)){
		with(bb){
			drawFill();
		}
	}
}
gpu_set_blendmode(bm_normal);
surface_reset_target()
draw_surface_outline(sur,0,0,,2)
draw_surface(_surface,0,0);
draw_surface(_surface3,0,0);
