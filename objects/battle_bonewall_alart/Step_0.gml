f_a = variable_instance_exists(follow_target,"angle") ? follow_target.angle : follow_target.image_angle
if !follow {
	fx = follow_target.x
	fy = follow_target.y
}
else {
	if follow_target == battle_board {
		fx = Battle_GetTurnInfo(BATTLE_TURN.BOARD_X,BATTLE_BOARD.X)
		fy = Battle_GetTurnInfo(BATTLE_TURN.BOARD_Y,BATTLE_BOARD.Y)
	}
	else {
		fx = follow_target.xstart
		fy = follow_target.ystart
	}
}
var X = follow_target.x
var Y = follow_target.y
switch dir {
		case DIR.DOWN: 
			position = [
				[X-follow_target.left+1,Y+follow_target.down-length+1],
				[X+follow_target.right-2,Y+follow_target.down-2]
			]
		break
		case DIR.UP: 
			position = [
				[X-follow_target.left+1,Y-follow_target.up+1],
				[X+follow_target.right-2,Y-follow_target.up+length-2]
			]
		break
		case DIR.LEFT: 
			position = [
				[X-follow_target.left+1,Y-follow_target.up+1],
				[X-follow_target.left+length-2,Y+follow_target.down-2]
			]
		break
		case DIR.RIGHT: 
			position = [
				[X+follow_target.right-length+1,Y-follow_target.up+1],
				[X+follow_target.right-2,Y+follow_target.down-2]
			]
		break
	}