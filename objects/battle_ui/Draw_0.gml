surface_set_target(sur)
draw_set_font(font_mars_needs_cunnilingus);
draw_set_color(c_white);
var yy = 0
var font = Lang_GetFont(Lang_GetString("font.playername.0"))
draw_set_font(font)
if (font==font_jf16){
	yy=3
}
var Name = Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.NAME)
var stw = string_width(Name)
draw_text(x,y+yy,Name)
draw_set_font(font_mars_needs_cunnilingus);
draw_text(x+stw,y,"   LV "+string(Player_GetLv()));

draw_sprite(spr_battle_ui_hp,0,x+214,y+5);

draw_sprite_ext(spr_pixel,0,x+245,y,Player_GetHpMax()*1.25,21,0,make_color_rgb(192,0,0),1);
draw_sprite_ext(spr_pixel,0,x+245,y,Player_GetHp()*1.25,21,0,make_color_rgb(255,255,0),1);
if global.kr {
	draw_sprite_ext(spr_pixel,0,x+245+Player_GetHp()*1.25,y,Player_GetKr()*1.25,21,0,make_color_rgb(255,40,255),1);


draw_sprite_ext(spr_battle_ui_kr,0,x+245+Player_GetHpMax()*1.25+8,y+5,1,1,0,c_white,1);

var colorkr=(Player_GetKr()<=0 ? c_white : make_color_rgb(255,40,255));
draw_set_color(colorkr);

draw_text(x+245+Player_GetHpMax()*1.25+14+32,y,string(Player_GetHp()+Player_GetKr())+" / "+string(Player_GetHpMax()));
}
else {
	draw_text(x+245+Player_GetHpMax()*1.25+14,y,(Player_GetHp() < 10 ? "0" : "") + string(Player_GetHp())+" / "+string(Player_GetHpMax()));
}
surface_reset_target()
if outline
	draw_surface_outline(sur,0,0,,2)
else
	draw_surface(sur,0,0)