depth = out ? DEPTH_BATTLE.BULLET_OUTSIDE_LOW : DEPTH_BATTLE.BULLET
var head_total_w = (head_type == 0 ? 12 : 6)
var sin_part = (use_cos ? (cos(stime)*sinsize) : (sin(stime)*sinsize))
var total_len_raw = abs(length)+sin_part
var subtracted_w = (adjusted_length ? head_total_w : 0)
var length_result = max(0,total_len_raw-subtracted_w)

if length_result > 0 {
	var R = RotateXY(cx,cy,0,0,image_angle)
	var collision = [RotateXY(-length_result/2-col_wid+(head_type==1 ? 6:0),-col_hei,0,0,image_angle),RotateXY(length_result/2+col_wid-(head_type==2 ? 6:0),-col_hei,0,0,image_angle),RotateXY(-length_result/2-col_wid+(head_type==1 ? 6:0),col_hei,0,0,image_angle),RotateXY(length_result/2+col_wid-(head_type==2 ? 6:0),col_hei,0,0,image_angle)]
	for(var i=0;i<array_length(collision);i++) {
		collision[i,0]+=x+R[0]
		collision[i,1]+=y+R[1]
	}
	if point_in_triangle(battle_soul.x,battle_soul.y,collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1]) || point_in_triangle(battle_soul.x,battle_soul.y,collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1])&&image_alpha>0.6&&hit{
		Battle_CallSoulEventBulletCollision()
	}
	if instance_exists(battle_soul_yellow_bullet)&&can_break {
		with(battle_soul_yellow_bullet) {
			var _chk_hit = false;
			var _dist = point_distance(xprevious,yprevious,x,y);
			var _steps = max(1,ceil(_dist/5))
			
			for(var k=0; k<=_steps; k++){
				var _chk_x = lerp(xprevious,x,k/_steps);
				var _chk_y = lerp(yprevious,y,k/_steps);
				if (point_in_triangle(_chk_x,_chk_y,collision[0,0],collision[0,1],collision[1,0],collision[1,1],collision[2,0],collision[2,1]) || point_in_triangle(_chk_x,_chk_y,collision[2,0],collision[2,1],collision[3,0],collision[3,1],collision[1,0],collision[1,1])) {
					_chk_hit = true
					break
				}
			}
			if (_chk_hit) {
				instance_destroy()
				snd_play(snd_mtt_burst)
				with(other)
					event_user(3)
			}
		}
		
	}
}
image_angle+=rotate