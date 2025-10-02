use_menu = false
l_x = 320
l_y = 240
_hint=false;
if use_menu {
	instance_create_depth(0,0,0,startmenu)
	l_y = 120
}
else {
	alarm[0]=200;
	alarm[1]=1200;
}
audio_play_sound(snd_logo,0,false);
