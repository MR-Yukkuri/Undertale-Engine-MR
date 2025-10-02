if state == 0 {
	surface_set_target(Battle_GetBoardSurface())
	if follow {
		matrix_set(matrix_world,matrix_build(follow_target.x,follow_target.y,0,0,0,f_a != undefined ? f_a%360 : (variable_instance_exists(follow_target,"angle") ? follow_target.angle : follow_target.image_angle),1,1,1))
		draw_rectangle_color(position[0,0]-follow_target.x,position[0,1]-follow_target.y,position[1,0]-follow_target.x,position[1,1]-follow_target.y,col,col,col,col,true)
		matrix_set(matrix_world,matrix_build_identity())
	}
	else {
		draw_rectangle_color(position[0,0],position[0,1],position[1,0],position[1,1],col,col,col,col,true)
	}
	surface_reset_target()

}