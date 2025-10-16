///@desc 配列と構造体の要素に対応したAnim_Create()です。
///@arg {Any} target
///@arg {String} var_name
///@arg {Array} accessors イージングする要素までのインデックスとキーの配列です。
///                       var[2].key[1]をイージングする場合、accessorsは[2, "key", 1]とする必要があります。
///@arg {Real} tween
///@arg {Real} ease
///@arg {Real} start
///@arg {Real} change
///@arg {Real} duration
///@arg {Real} delay*
///@arg {Real} arg_0*
///@arg {Real} arg_1*
function Anim_CreateIter() {
	var TARGET=argument[0];
	var VAR_NAME=argument[1];
	var ACCESSORS=argument[2];
	var TWEEN=argument[3];
	var EASE=argument[4];
	var START=argument[5];
	var CHANGE=argument[6];
	var DURATION=argument[7];
	var DELAY=0;
	var ARG_0=0;
	var ARG_1=0;

	if(argument_count>=9){
		DELAY=argument[8];
	}
	if(argument_count>=10){
		ARG_0=argument[9];
	}
	if(argument_count>=11){
		ARG_1=argument[10];
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
						var map=ds_map_create();
						ds_map_add(global._gmu_anim_data,global._gmu_anim_id,map);
						ds_list_add(global._gmu_anim_list,global._gmu_anim_id);
						inst_result[proc_result]=global._gmu_anim_id;
						global._gmu_anim_id-=1;
					
						map[?ANIM_DATA.TARGET]=inst_find;
						map[?ANIM_DATA.VAR_NAME]=VAR_NAME;
						map[?ANIM_DATA.ACCESSORS]=ACCESSORS;
						map[?ANIM_DATA.TWEEN]=TWEEN;
						map[?ANIM_DATA.EASE]=EASE;
						map[?ANIM_DATA.START]=START;
						map[?ANIM_DATA.CHANGE]=CHANGE;
						map[?ANIM_DATA.DURATION]=DURATION;
						map[?ANIM_DATA.DELAY]=DELAY;
						map[?ANIM_DATA.ARG_0]=ARG_0;
						map[?ANIM_DATA.ARG_1]=ARG_1;
						map[?ANIM_DATA.TIME]=0;
					
						proc_result+=1;
					}
				}
				proc+=1;
			}
		}else if(TARGET==global){
			if(variable_global_exists(VAR_NAME)){
				var map=ds_map_create();
				ds_map_add(global._gmu_anim_data,global._gmu_anim_id,map);
				ds_list_add(global._gmu_anim_list,global._gmu_anim_id);
				inst_result[0]=global._gmu_anim_id;
				global._gmu_anim_id-=1;
			
				map[?ANIM_DATA.TARGET]=global;
				map[?ANIM_DATA.VAR_NAME]=VAR_NAME;
				map[?ANIM_DATA.ACCESSORS]=ACCESSORS;
				map[?ANIM_DATA.TWEEN]=TWEEN;
				map[?ANIM_DATA.EASE]=EASE;
				map[?ANIM_DATA.START]=START;
				map[?ANIM_DATA.CHANGE]=CHANGE;
				map[?ANIM_DATA.DURATION]=DURATION;
				map[?ANIM_DATA.DELAY]=DELAY;
				map[?ANIM_DATA.ARG_0]=ARG_0;
				map[?ANIM_DATA.ARG_1]=ARG_1;
				map[?ANIM_DATA.TIME]=0;
			}
		}else if(is_struct(TARGET)){
			if(struct_exists(TARGET,VAR_NAME)){
				var map=ds_map_create();
				ds_map_add(global._gmu_anim_data,global._gmu_anim_id,map);
				ds_list_add(global._gmu_anim_list,global._gmu_anim_id);
				inst_result[0]=global._gmu_anim_id;
				global._gmu_anim_id-=1;
			
				map[?ANIM_DATA.TARGET]=TARGET;
				map[?ANIM_DATA.VAR_NAME]=VAR_NAME;
				map[?ANIM_DATA.ACCESSORS]=ACCESSORS;
				map[?ANIM_DATA.TWEEN]=TWEEN;
				map[?ANIM_DATA.EASE]=EASE;
				map[?ANIM_DATA.START]=START;
				map[?ANIM_DATA.CHANGE]=CHANGE;
				map[?ANIM_DATA.DURATION]=DURATION;
				map[?ANIM_DATA.DELAY]=DELAY;
				map[?ANIM_DATA.ARG_0]=ARG_0;
				map[?ANIM_DATA.ARG_1]=ARG_1;
				map[?ANIM_DATA.TIME]=0;
			}
		}
	}
	return inst_result;


}
