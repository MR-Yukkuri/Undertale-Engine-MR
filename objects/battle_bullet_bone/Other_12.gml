var xx,yy,angle,R,length_result = length+(use_cos ? (cos(stime)*sinsize) : (sin(stime)*sinsize))
if sinsize > 0
stime+=siner
else
stime = 0
if origin == 1 {
	cx = length_result/2+(head_type==1 ? 0:6)+len
}
else if origin == 2 {
	cx = -length_result/2-(head_type==2 ? 0:6)+len
	
}
else {
	cx = len
}
if color == COLOR.WHITE
    image_blend = c_white
if color == COLOR.BLUE
    image_blend = make_color_rgb(20,196,255)
if color == COLOR.ORANGE
    image_blend = make_color_rgb(248,148,29)
if color == COLOR.GREEN
    image_blend = c_lime
R = RotateXY(cx,cy,0,0,image_angle)
xx = x+R[0]+lengthdir_x(length_result/2,image_angle+180)
yy = y+R[1]+lengthdir_y(length_result/2,image_angle+180)
angle = point_direction(xx,yy,x+R[0],y+R[1])+180
if head_type != 1 {
	draw_sprite_ext(spr_bone_head,0,xx,yy,-1,1,angle,image_blend,image_alpha)
}
draw_sprite_ext(spr_bone_body,0,x+R[0],y+R[1],length_result/2,1,image_angle,image_blend,image_alpha)
xx = x+R[0]+lengthdir_x(length_result/2,image_angle)
yy = y+R[1]+lengthdir_y(length_result/2,image_angle)
angle = point_direction(xx,yy,x+R[0],y+R[1])
if head_type != 2 {
	draw_sprite_ext(spr_bone_head,0,xx,yy,1,1,angle,image_blend,image_alpha)
}
//if array_length(collision) > 3 {
//draw_triangle_color(collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1],c_red,c_red,c_red,true)
//draw_triangle_color(collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1],c_red,c_red,c_red,true)
//}