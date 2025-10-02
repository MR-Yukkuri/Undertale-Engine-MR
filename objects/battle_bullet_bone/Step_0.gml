var length_result = length+(use_cos ? (cos(stime)*sinsize) : (sin(stime)*sinsize))
var R = RotateXY(cx,cy,0,0,image_angle)
var collision = [RotateXY(-length_result/2-col_wid+(head_type==1 ? 6:0),-col_hei,0,0,image_angle),RotateXY(length_result/2+col_wid-(head_type==2 ? 6:0),-col_hei,0,0,image_angle),RotateXY(-length_result/2-col_wid+(head_type==1 ? 6:0),col_hei,0,0,image_angle),RotateXY(length_result/2+col_wid-(head_type==2 ? 6:0),col_hei,0,0,image_angle)]
for(var i=0;i<array_length(collision);i++) {
	collision[i,0]+=x+R[0]
	collision[i,1]+=y+R[1]
}
if point_in_triangle(battle_soul.x,battle_soul.y,collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1]) || point_in_triangle(battle_soul.x,battle_soul.y,collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1])&&image_alpha>0.6&&hit{
	Battle_CallSoulEventBulletCollision();
}
if instance_exists(battle_soul_yellow_bullet) && ((point_in_triangle(battle_soul_yellow_bullet.x,battle_soul_yellow_bullet.y,collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1]) || point_in_triangle(battle_soul_yellow_bullet.x,battle_soul_yellow_bullet.y,collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1]))&&can_break){
	with(battle_soul_yellow_bullet) {
		if (point_in_triangle(x,y,collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1]) || point_in_triangle(battle_soul_yellow_bullet.x,battle_soul_yellow_bullet.y,collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1])) {
			instance_destroy()
		}
	}
	event_user(3)
	snd_play(snd_mtt_burst)
}
image_angle+=rotate