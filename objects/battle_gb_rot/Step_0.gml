if time%inv==0 {
	var sx = x+lengthdir_x(room_width,angle)
	var sy = y+lengthdir_y(room_width,angle)
	var tx = x+lengthdir_x(len,angle)
	var ty = y+lengthdir_y(len,angle)
	var Angle = point_direction(tx,ty,x,y)
	MakeGB(sx,sy,tx,ty,Angle,Angle,xscale,yscale,color,movetime,pause,duration,fade,follow,follow_target)
	angle+=spd
}
if time >= rot_dur {
	instance_destroy()
}
time++