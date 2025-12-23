var head_total_w = (head_type == 0 ? 12 : 6)
var sin_part = (use_cos ? (cos(stime)*sinsize) : (sin(stime)*sinsize))
var total_len_raw = abs(length)+sin_part
var subtracted_w = (adjusted_length ? head_total_w : 0)
var length_result = max(0,total_len_raw-subtracted_w)
var dw_left = 6
var dw_right = 6
var anchor_left_to_tip = false
var anchor_right_to_tip = false
if adjusted_length {
	if head_type == 0 {
		if total_len_raw <= 12 {
			dw_left = clamp(total_len_raw/2,0,6)
			dw_right = clamp(total_len_raw/2,0,6)
		} else if origin == 1 {
			dw_left = clamp(total_len_raw-6,0,6)
			dw_right = clamp(total_len_raw,0,6)
			anchor_left_to_tip = true
			anchor_right_to_tip = false
		} else if origin == 2 {
			dw_left = clamp(total_len_raw,0,6)
			dw_right = clamp(total_len_raw-6,0,6)
			anchor_left_to_tip = false
			anchor_right_to_tip = true
		} else {
			dw_left = clamp(total_len_raw/2,0,6)
			dw_right = clamp(total_len_raw/2,0,6)
			anchor_left_to_tip = false
			anchor_right_to_tip = false
		}
	} else {
		dw_left = clamp(total_len_raw,0,6)
		dw_right = clamp(total_len_raw,0,6)
		anchor_left_to_tip = false
		anchor_right_to_tip = false
	}
}

var xx,yy,angle,R
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
if length_result > 0 {
	draw_sprite_ext(spr_bone_body,0,x+R[0],y+R[1],length_result/2,1,image_angle,image_blend,image_alpha)
}
	var dist_left,dist_right
	if origin == 1 {
		dist_left = len
		dist_right = len+total_len_raw
	} else if origin == 2 {
		dist_left = len-total_len_raw
		dist_right = len
	} else { // Center
		dist_left = len-total_len_raw/2
		dist_right = len+total_len_raw/2
	}
	if head_type != 1 && dw_left > 0 {
		var ang = image_angle+180
		var TL = RotateXY(dist_left,5,0,0,image_angle)
		draw_sprite_general(spr_bone_head,0,0,0,dw_left,10,x+TL[0],y+TL[1],-1,1,ang,image_blend,image_blend,image_blend,image_blend,image_alpha)
	}
	if head_type != 2 && dw_right > 0 {
		var ang = image_angle
		var TL = RotateXY(dist_right,-5,0,0,image_angle)
		draw_sprite_general(spr_bone_head,0,0,0,dw_right,10,x+TL[0],y+TL[1],-1,1,ang,image_blend,image_blend,image_blend,image_blend,image_alpha)
	}
//if array_length(collision) > 3 {
//draw_triangle_color(collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1],c_red,c_red,c_red,true)
//draw_triangle_color(collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1],c_red,c_red,c_red,true)
//}