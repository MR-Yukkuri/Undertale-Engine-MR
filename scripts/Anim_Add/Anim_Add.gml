///@arg anim_id
///@arg tween
///@arg ease
///@arg change
///@arg duration
///@arg delay*
///@arg arg_0*
///@arg arg_1*
function Anim_Add() {
	var TARGET=argument[0];
	var TWEEN=argument[1];
	var EASE=argument[2];
	var CHANGE=argument[3];
	var DURATION=argument[4];
	var DELAY=0;
	var ARG_0=0;
	var ARG_1=0;

	if(argument_count>=6){
		DELAY=argument[5];
	}
	if(argument_count>=7){
		ARG_0=argument[6];
	}
	if(argument_count>=8){
		ARG_1=argument[7];
	}
	for(var i=0;i<array_length(TARGET);i++) {
		if ds_map_exists(global._gmu_anim_data,TARGET[i]) {
			var map=global._gmu_anim_data[?TARGET[i]];
			var n = array_length(map[?ANIM_DATA.TWEEN])
			map[?ANIM_DATA.TWEEN][n]=TWEEN;
			map[?ANIM_DATA.EASE][n]=EASE;
			map[?ANIM_DATA.CHANGE][n]=CHANGE;
			map[?ANIM_DATA.DURATION][n]=DURATION;
			map[?ANIM_DATA.DELAY][n]=DELAY;
			map[?ANIM_DATA.ARG_0][n]=ARG_0;
			map[?ANIM_DATA.ARG_1][n]=ARG_1;
			map[?ANIM_DATA.TIME][n]=0;
		}
	}
}
