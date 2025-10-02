///@arg target_x
///@arg target_y
///@arg center_x
///@arg center_y
///@arg angle
function RotateXY(){
	var TARGET_X = argument[0];
	var TARGET_Y = argument[1];
	var CENTER_X = argument[2];
	var CENTER_Y = argument[3];
	var ANGLE = -argument[4];
	
	var RESULT_X=(TARGET_X-CENTER_X)*dcos(ANGLE)-(TARGET_Y-CENTER_Y)*dsin(ANGLE)+CENTER_X;
	var RESULT_Y=(TARGET_Y-CENTER_Y)*dcos(ANGLE)+(TARGET_X-CENTER_X)*dsin(ANGLE)+CENTER_Y;
	
	return [RESULT_X,RESULT_Y];
}
///@desc 追従後の位置を自動計算します。Bullet専用です。
///@arg {id.instance} instance 適応するオブジェクト
function RotateBullet(instance=undefined) {
	if instance==undefined
		instance = id
	with(instance) {
		if follow {
			if !f_temp {
				f_temp = true
				follow_x = x
				follow_y = y	
				follow_angle = image_angle
				follow_hspeed = hspeed
				follow_vspeed = vspeed
			}
			var F_a = variable_instance_exists(follow_target,"angle") ? follow_target.angle : follow_target.image_angle
			var F = RotateXY(follow_x,follow_y,follow_target.x,follow_target.y,F_a)
			x = F[0]
			y = F[1]
			image_angle = follow_angle+F_a
			follow_x+=follow_hspeed
			follow_y+=follow_vspeed
		}
		else {
			f_temp = false
		}
	}
}