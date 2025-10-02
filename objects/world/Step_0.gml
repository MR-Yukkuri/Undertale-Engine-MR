Anim_Step();
BGM_Step();

if(_time>=60){
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.TIME,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.TIME)+1);
	_time=0;
}else{
	_time+=1;
}

if(Game_GetFrameSkip()>0){
	if(_frame_skip>=Game_GetFrameSkip()){
		draw_enable_drawevent(true);
		_frame_skip=0;
	}else{
		_frame_skip+=1;
		draw_enable_drawevent(false);
	}
}else{
	draw_enable_drawevent(true);
}

if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(keyboard_check_pressed(192)){
	Console_SetVisible(!Console_IsVisible());
}

Console_SetStatusText(0,"FPS: "+string(fps));
Console_SetStatusText(1,"Room: "+string(room)+"("+room_get_name(room)+")");
Console_SetStatusText(2,"InstC: "+string(instance_count));

Console_Step();

if(keyboard_check_pressed(vk_f4)&&!keyboard_check(vk_alt)&&!keyboard_check(vk_control)&&!keyboard_check(vk_shift)){
	window_set_fullscreen(!window_get_fullscreen());
	//display_set_gui_maximize();
}

//if(keyboard_check_pressed(vk_f3)){
//	if(game_get_speed(gamespeed_fps) = 60){
//		game_set_speed(10,gamespeed_fps);
//	}
//	else if(game_get_speed(gamespeed_fps) = 10){
//		game_set_speed(3,gamespeed_fps);
//	}
//	else if(game_get_speed(gamespeed_fps) = 3){
//		game_set_speed(60,gamespeed_fps);
//	}
//}
if global.debug {
	if !instance_exists(DEBUG_TOOL)
		instance_create_depth(0,0,0,DEBUG_TOOL)
}
if global.infhp {
	Player_SetHp(Player_GetHpMax())
	Player_SetKr(0)
}
if Player_GetKrTimer() > 0 {
	Player_SetKrTimer(Player_GetKrTimer()-1)
}
else if Player_GetKrTimer() == 0 {
	Player_SetKr(Player_GetKr()-1)
	if Player_GetKr() > 0 {
		Player_SetKrTimer(40-Player_GetKr())
	}
	else {
		Player_SetKrTimer(-1)
	}
}
if prel != global.lang {
	Lang_LoadString(global.lang);
	Lang_LoadSprite(global.lang);
	prel = global.lang
}
if global.overlay && !is_debug_overlay_open(){
	show_debug_overlay(true)
}
else if !global.overlay && is_debug_overlay_open() {
	show_debug_overlay(false)
}