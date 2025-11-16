var STATE=Battle_GetState();
var MENU=Battle_GetMenu();
if(STATE==BATTLE_STATE.IN_TURN || STATE==BATTLE_STATE.TURN_PREPARATION || (STATE==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.FIGHT_AIM && MENU!=BATTLE_MENU.FIGHT_ANIM && MENU!=BATTLE_MENU.FIGHT_DAMAGE)){
	draw_self()
	draw_set_circle_precision(12)
	draw_circle_color(x-1,y-1,30,c_green,c_green,1);
	for(var i=0;i<shield_amount;i++) {
		draw_sprite_ext(spr_battle_shield,1,x,y,1,1,s_dir[i],shield_color[i,s_hit[i]?1:0],1)
		draw_sprite_ext(spr_battle_shield,0,x,y,1,1,s_dir[i],shield_color[i,0],1)
		s_dir[i] += angle_difference(dir[i],s_dir[i])*0.3
		if s_hit[i] > 0
			s_hit[i]--
	}
	
}