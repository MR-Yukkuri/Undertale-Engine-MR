///@arg start
///@arg target
///@arg time
///@arg delay*
///@arg tween*
///@arg ease*
///@arg blendmode*
function Fader_Fade() {
	var START=argument[0];
	var TARGET=argument[1];
	var TIME=argument[2];
	var DELAY=0;
	var TWEEN = 0
	var EASE = 0
	var BM = bm_normal
	if(argument_count>=4){
		DELAY=argument[3];
	}
	if(argument_count>=5){
		TWEEN=argument[4];
	}
	if(argument_count>=6){
		EASE=argument[5];
	}
	if(argument_count>=7){
		BM=argument[6];
	}
	if(START==-1){
		START=fader.alpha;
	}
	fader.bm = BM
	Anim_Destroy(fader,"alpha");
	Anim_Create(fader,"alpha",TWEEN,EASE,START,TARGET-START,TIME,DELAY);

	return true;


}
