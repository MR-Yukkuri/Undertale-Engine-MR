///@arg target
///@arg var_name
///@arg tween
///@arg ease
///@arg change
///@arg duration
///@arg delay*
///@arg arg_0*
///@arg arg_1*
function Anim_Add() {
	var TARGET=argument[0];
	var VAR_NAME=argument[1];
	var TWEEN=argument[2];
	var EASE=argument[3];
	var CHANGE=argument[4];
	var DURATION=argument[5];
	var DELAY=0;
	var ARG_0=0;
	var ARG_1=0;

	if(argument_count>=7){
		DELAY=argument[6];
	}
	if(argument_count>=8){
		ARG_0=argument[7];
	}
	if(argument_count>=9){
		ARG_1=argument[8];
	}

	var inst_result=-1;

	if(DURATION>=0){
		if(instance_exists(TARGET)){
			var proc=0;
			var proc_result=0;
			var inst_find=noone;
		
			repeat(instance_number(TARGET)){
				inst_find=instance_find(TARGET,proc);
				if(instance_exists(inst_find)){
					if(variable_instance_exists(inst_find,VAR_NAME)){
						var found=false;
						for (var i = ds_list_size(global._gmu_anim_list) - 1; i >= 0; i--) {
							var key = global._gmu_anim_list[|i];
							var map = global._gmu_anim_data[?key];
							if (map[?ANIM_DATA.TARGET] == inst_find && map[?ANIM_DATA.VAR_NAME] == VAR_NAME) {
								var n = array_length(map[?ANIM_DATA.TWEEN]);
								map[?ANIM_DATA.TWEEN][n] = TWEEN;
								map[?ANIM_DATA.EASE][n] = EASE;
								map[?ANIM_DATA.CHANGE][n] = CHANGE;
								map[?ANIM_DATA.DURATION][n] = DURATION;
								map[?ANIM_DATA.DELAY][n] = DELAY;
								map[?ANIM_DATA.ARG_0][n] = ARG_0;
								map[?ANIM_DATA.ARG_1][n] = ARG_1;
								map[?ANIM_DATA.TIME][n] = 0;
								inst_result[proc_result] = key;
								proc_result++;
								found = true;
								break;
							}
						}
						if (!found) {
							var START = variable_instance_get(inst_find, VAR_NAME);
							var res = Anim_Create(inst_find, VAR_NAME, TWEEN, EASE, START, CHANGE, DURATION, DELAY, ARG_0, ARG_1);
							if (is_array(res)) {
								inst_result[proc_result] = res[0];
								proc_result++;
							}
						}
					}
				}
				proc+=1;
			}
		}else if(TARGET==global){
			if(variable_global_exists(VAR_NAME)){
				var found=false;
				for (var i = ds_list_size(global._gmu_anim_list) - 1; i >= 0; i--) {
					var key = global._gmu_anim_list[|i];
					var map = global._gmu_anim_data[?key];
					if (map[?ANIM_DATA.TARGET] == global && map[?ANIM_DATA.VAR_NAME] == VAR_NAME) {
						var n = array_length(map[?ANIM_DATA.TWEEN]);
						map[?ANIM_DATA.TWEEN][n] = TWEEN;
						map[?ANIM_DATA.EASE][n] = EASE;
						map[?ANIM_DATA.CHANGE][n] = CHANGE;
						map[?ANIM_DATA.DURATION][n] = DURATION;
						map[?ANIM_DATA.DELAY][n] = DELAY;
						map[?ANIM_DATA.ARG_0][n] = ARG_0;
						map[?ANIM_DATA.ARG_1][n] = ARG_1;
						map[?ANIM_DATA.TIME][n] = 0;
						inst_result[0] = key;
						found = true;
						break;
					}
				}
				if (!found) {
					var START = variable_global_get(VAR_NAME);
					var res = Anim_Create(global, VAR_NAME, TWEEN, EASE, START, CHANGE, DURATION, DELAY, ARG_0, ARG_1);
					if (is_array(res)) inst_result[0] = res[0];
				}
			}
		}else if(is_struct(TARGET)){
			if(struct_exists(TARGET,VAR_NAME)){
				var found=false;
				for (var i = ds_list_size(global._gmu_anim_list) - 1; i >= 0; i--) {
					var key = global._gmu_anim_list[|i];
					var map = global._gmu_anim_data[?key];
					if (map[?ANIM_DATA.TARGET] == TARGET && map[?ANIM_DATA.VAR_NAME] == VAR_NAME) {
						var n = array_length(map[?ANIM_DATA.TWEEN]);
						map[?ANIM_DATA.TWEEN][n] = TWEEN;
						map[?ANIM_DATA.EASE][n] = EASE;
						map[?ANIM_DATA.CHANGE][n] = CHANGE;
						map[?ANIM_DATA.DURATION][n] = DURATION;
						map[?ANIM_DATA.DELAY][n] = DELAY;
						map[?ANIM_DATA.ARG_0][n] = ARG_0;
						map[?ANIM_DATA.ARG_1][n] = ARG_1;
						map[?ANIM_DATA.TIME][n] = 0;
						inst_result[0] = key;
						found = true;
						break;
					}
				}
				if (!found) {
					var START = TARGET[$ VAR_NAME];
					var res = Anim_Create(TARGET, VAR_NAME, TWEEN, EASE, START, CHANGE, DURATION, DELAY, ARG_0, ARG_1);
					if (is_array(res)) inst_result[0] = res[0];
				}
			}
		}
	}
	return inst_result;
}
