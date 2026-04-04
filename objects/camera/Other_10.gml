///@desc Reset
x=0;
y=0;
width=640;
height=480;
scale_x=1;
scale_y=1;
angle=0;
halign=fa_left;
valign=fa_top;
is_aligned_position_zero=true; // halign, valignで指定した基準点を(0, 0)とするか
target=noone;

shake_x=0;
shake_y=0;
shake_speed_x=0;
shake_speed_y=0;
shake_random_x=false;
shake_random_y=false;
shake_decrease_x=-1;
shake_decrease_y=-1;
_shake_pos_x=0;
_shake_pos_y=0;
_shake_time_x=0;
_shake_time_y=0;
_shake_positive_x=true;
_shake_positive_y=true;

enable_limit=true; // カメラの移動範囲を制限するか
use_room_limit=true; // ルームのサイズをカメラの移動範囲として参照するか
limit_top=0;
limit_bottom=0;
limit_left=0;
limit_right=0;
is_target_always_center=true; // targetが設定されている場合、自動的にalignを中心にするか

// カメラビューの位置を求める
calculate_view_transform=function(){
	var topLeftX,topLeftY;
	topLeftX=x;
	topLeftY=y;
	var sizeX=width/scale_x;
	var sizeY=height/scale_y;
	var isTargetExists=instance_exists(target);

	// is_target_always_centerがtrueの場合、基準点を中心とする
	var hAlign,vAlign;
	if(isTargetExists and is_target_always_center){
		hAlign=fa_center;
		vAlign=fa_middle;
	}else{
		hAlign=halign;
		vAlign=valign;
	}

	var offsetFactorX,offsetFactorY;
	switch (hAlign){
		case fa_left:
		offsetFactorX=0;
		break;
		case fa_center:
		offsetFactorX=0.5;
		break;
		case fa_right:
		offsetFactorX=1;
		break;
	}
	switch (vAlign){
		case fa_top:
		offsetFactorY=0;
		break;
		case fa_middle:
		offsetFactorY=0.5;
		break;
		case fa_bottom:
		offsetFactorY=1;
		break;
	}
	
	// userX, userYに実際の座標を代入する
	var userX,userY;
	if(isTargetExists){
		userX=target.x;
		userY=target.y;
	}else{
		userX=x;
		userY=y;
		// is_aligned_position_zeroが0の場合、userX, userYを基準点へとズラす
		if(is_aligned_position_zero){
			userX+=width*offsetFactorX;
			userY+=height*offsetFactorY;
		}
	}
	
	// カメラの視野の端の座標を求める
	var leftEdgeX,rightEdgeX,topEdgeY,bottomEdgeY;
	leftEdgeX=userX-sizeX*offsetFactorX;
	rightEdgeX=userX+sizeX*(1-offsetFactorX);
	topEdgeY=userY-sizeY*offsetFactorY;
	bottomEdgeY=userY+sizeY*(1-offsetFactorY);
	
	// enable_limitがtrueの場合、カメラを可動範囲に合わせて調整する
	if(isTargetExists and enable_limit){
		var top=limit_top;
		var bottom=limit_bottom;
		var left=limit_left;
		var right=limit_right;
		if(use_room_limit){
			top=0;
			left=0;
			right=room_width;
			bottom=room_height;
		}
		if(right<rightEdgeX) leftEdgeX=right-sizeX;
		if(leftEdgeX<left) leftEdgeX=left;
		if(bottom<bottomEdgeY) topEdgeY=bottom-sizeY;
		if(topEdgeY<top) topEdgeY=top;
		
	}
	
	topLeftX=leftEdgeX;
	topLeftY=topEdgeY;
	return {
		"top_left_x": topLeftX,
		"top_left_y": topLeftY,
		"angle": angle,
		"size_x": sizeX,
		"size_y": sizeY
	}
};