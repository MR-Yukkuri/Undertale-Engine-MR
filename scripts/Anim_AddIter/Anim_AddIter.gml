///@arg target
///@arg var_name
///@arg accessors
///@arg tween
///@arg ease
///@arg change
///@arg duration
///@arg delay*
///@arg arg_0*
///@arg arg_1*
function Anim_AddIter() {
	var TARGET=argument[0];
	var VAR_NAME=argument[1];
	var ACCESSORS=argument[2];
	var TWEEN=argument[3];
	var EASE=argument[4];
	var CHANGE=argument[5];
	var DURATION=argument[6];
	var DELAY=0;
	var ARG_0=0;
	var ARG_1=0;

	if(argument_count>=8){
		DELAY=argument[7];
	}
	if(argument_count>=9){
		ARG_0=argument[8];
	}
	if(argument_count>=10){
		ARG_1=argument[9];
	}

	var inst_result=-1;

	if(DURATION>=0){
		if(instance_exists(TARGET) || TARGET==global || is_struct(TARGET)){
			var proc=0;
			var proc_result=0;
			var inst_list = [];
			if (instance_exists(TARGET) && TARGET != global) {
				for (var i = 0; i < instance_number(TARGET); i++) {
					array_push(inst_list, instance_find(TARGET, i));
				}
			} else {
				array_push(inst_list, TARGET);
			}

			for (var p = 0; p < array_length(inst_list); p++) {
				var inst_find = inst_list[p];
				var exists = false;
				if (TARGET == global) exists = variable_global_exists(VAR_NAME);
				else if (is_struct(inst_find)) exists = struct_exists(inst_find, VAR_NAME);
				else exists = variable_instance_exists(inst_find, VAR_NAME);

				if (exists) {
					var found = false;
					for (var i = ds_list_size(global._gmu_anim_list) - 1; i >= 0; i--) {
						var key = global._gmu_anim_list[|i];
						var map = global._gmu_anim_data[?key];
						if (map[?ANIM_DATA.TARGET] == inst_find && map[?ANIM_DATA.VAR_NAME] == VAR_NAME) {
							var map_accessors = (ds_map_exists(map, ANIM_DATA.ACCESSORS) ? map[?ANIM_DATA.ACCESSORS] : []);
							if (array_equals(map_accessors, ACCESSORS)) {
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
					}
					
					if (!found) {
						var val;
						if (inst_find == global) val = variable_global_get(VAR_NAME);
						else if (is_struct(inst_find)) val = inst_find[$ VAR_NAME];
						else val = variable_instance_get(inst_find, VAR_NAME);

						for (var i = 0; i < array_length(ACCESSORS); i++) {
							if (is_array(val)) val = val[ACCESSORS[i]];
							else if (is_struct(val)) val = val[$ ACCESSORS[i]];
						}
						
						var res = Anim_CreateIter(inst_find, VAR_NAME, ACCESSORS, TWEEN, EASE, val, CHANGE, DURATION, DELAY, ARG_0, ARG_1);
						if (is_array(res)) {
							inst_result[proc_result] = res[0];
							proc_result++;
						}
					}
				}
			}
		}
	}
	return inst_result;
}