if auto_mix {
	var Col = battle_soul_green.shield_color[target_shield[0],0]
	for(var i=1;i<array_length(target_shield);i++) {
		Col = merge_color(Col,battle_soul_green.shield_color[target_shield[i],0],0.5)
	}
	if mode {
		draw_sprite_ext(spr_arrow_yellow_color,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
		draw_sprite_ext(spr_arrow_yellow_color,1,x,y,image_xscale,image_yscale,image_angle,Col,image_alpha)
	}
	else {
		draw_sprite_ext(spr_arrow_color,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
		draw_sprite_ext(spr_arrow_color,1,x,y,image_xscale,image_yscale,image_angle,Col,image_alpha)
	}
}
else {
	draw_self()
}