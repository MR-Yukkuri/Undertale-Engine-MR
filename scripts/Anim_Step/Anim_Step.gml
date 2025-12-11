function Anim_Step() {
	var proc=0;
	repeat(ds_list_size(global._gmu_anim_list)){
		var key=global._gmu_anim_list[|proc];
		var map=global._gmu_anim_data[?key];
		var L = array_length(map[?ANIM_DATA.TIME])
		var Destroy = true
		var N = false
		if(instance_exists(map[?ANIM_DATA.TARGET]) || map[?ANIM_DATA.TARGET]==global || is_struct(map[?ANIM_DATA.TARGET])){
			var value=map[?ANIM_DATA.START];
			for(var i=0;i<L;i++) {
				if(map[?ANIM_DATA.DELAY][i]<=0){
					N = true
					var accessors=[];
					if(ds_map_exists(map,ANIM_DATA.ACCESSORS)){
						accessors=map[?ANIM_DATA.ACCESSORS];
					}
					if(map[?ANIM_DATA.TIME][i] < map[?ANIM_DATA.DURATION][i]){
						map[?ANIM_DATA.TIME][i]+=1;
						value+=map[?ANIM_DATA.CHANGE][i]*Anim_GetValue(map[?ANIM_DATA.TWEEN][i],map[?ANIM_DATA.EASE][i],map[?ANIM_DATA.TIME][i]/map[?ANIM_DATA.DURATION][i],map[?ANIM_DATA.ARG_0][i],map[?ANIM_DATA.ARG_1][i]);
						_set_anim_map_value(map[?ANIM_DATA.TARGET],map[?ANIM_DATA.VAR_NAME],value,accessors);
						Destroy = false
					}
					else {
						value+=map[?ANIM_DATA.CHANGE][i];	
					}
				}else{
					Destroy = false
					map[?ANIM_DATA.DELAY][i]-=1;
				}
			}
			if N {
				_set_anim_map_value(map[?ANIM_DATA.TARGET],map[?ANIM_DATA.VAR_NAME],value,accessors);
				if Destroy {
					ds_map_destroy(map);
					ds_map_delete(global._gmu_anim_data,key);
					ds_list_delete(global._gmu_anim_list,proc);
					proc-=1;
				}
			}
		}else{
			ds_map_destroy(map);
			ds_map_delete(global._gmu_anim_data,key);
			ds_list_delete(global._gmu_anim_list,proc);
			proc-=1;
		}
		proc+=1;
	}

	return true;


}

function _set_anim_map_value(target,var_name,value,accessors=[]) {
	function _get_last_ref(target,var_name,accessors) {
		if(array_length(accessors)>0){
			if(target==global){
				target=variable_global_get(var_name);
			}else{
				target=variable_instance_get(target,var_name);
			}
		}
		for(var i=0;i<array_length(accessors)-1;i++){
			if(is_array(target)){
				if(is_real(accessors[i])){
					target=target[@ accessors[i]];
				}
			}else if(is_struct(target)){
				if(is_string(accessors[i])){
					target=target[$ accessors[i]];
				}
			}
		}
		return target;
	}
	
	var last_target=_get_last_ref(target,var_name,accessors);
	var last_accessor=array_length(accessors)==0?var_name:array_last(accessors);
	if(last_target==global){
		variable_global_set(last_accessor,value);
	}else if(instance_exists(last_target)){
		variable_instance_set(last_target,last_accessor,value);
	}else if(is_array(last_target)){
		last_target[@ last_accessor] = value;
	}else if(is_struct(last_target)){
		last_target[$ last_accessor] = value;
	}
	
	return true;
}
