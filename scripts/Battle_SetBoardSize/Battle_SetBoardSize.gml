///@arg up
///@arg down
///@arg left
///@arg right
///@arg time*
///@arg tween*
///@arg ease*
function Battle_SetBoardSize() {
	var U=argument[0];
	var D=argument[1];
	var L=argument[2];
	var R=argument[3];
	var TIME=25;
	var TWEEN = 0
	var EASE = 0
	if(argument_count>=5){
		TIME=argument[4];
	}
	if(argument_count>=6){
		TWEEN=argument[5];
	}
	if(argument_count>=7){
		EASE=argument[6];
	}
    if (battle_board.is_polygon) {
        var rect = [[-L, -U], [R, -U], [R, D], [-L, D]];
        Battle_SetBoardPolygonCustom(rect, TIME, TWEEN, EASE, true);
        battle_board.up = U;
        battle_board.down = D;
        battle_board.left = L;
        battle_board.right = R;
        return true;
    }

	battle_board.is_polygon = false;
	if(is_real(U)){
		if(TIME==0){
			battle_board.up=U;
		}else{
			Anim_Create(battle_board,"up",TWEEN,EASE,battle_board.up,U-battle_board.up,TIME);
		}
	}
	if(is_real(D)){
		if(TIME==0){
			battle_board.down=D;
		}else{
			Anim_Create(battle_board,"down",TWEEN,EASE,battle_board.down,D-battle_board.down,TIME);
		}
	}
	if(is_real(L)){
		if(TIME==0){
			battle_board.left=L;
		}else{
			Anim_Create(battle_board,"left",TWEEN,EASE,battle_board.left,L-battle_board.left,TIME);
		}
	}
	if(is_real(R)){
		if(TIME==0){
			battle_board.right=R;
		}else{
			Anim_Create(battle_board,"right",TWEEN,EASE,battle_board.right,R-battle_board.right,TIME);
		}
	}

	return true;
}
