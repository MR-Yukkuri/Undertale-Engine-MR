function draw_outer(x,y,radius,alpha,col=c_black) {
	var seg = 64
	var dis = point_distance(x,y,x<320?640:0,y<240?480:0)
	draw_primitive_begin(pr_trianglefan)
	draw_vertex_color(x,y,col,0)
	for(var i=0;i<=seg;i++) {
		draw_vertex_color(x+lengthdir_x(radius,360/seg*i),y+lengthdir_y(radius,360/seg*i),col,alpha)
	}
	draw_primitive_end()
	draw_primitive_begin(pr_trianglestrip)
	for(var i=0;i<=seg;i++) {
		draw_vertex_color(x+lengthdir_x(radius,360/(seg)*i),y+lengthdir_y(radius,360/seg*i),col,alpha)
		draw_vertex_color(x+lengthdir_x(dis,360/seg*i),y+lengthdir_y(dis,360/seg*i),col,alpha)
		
	}
	draw_primitive_end()
}
