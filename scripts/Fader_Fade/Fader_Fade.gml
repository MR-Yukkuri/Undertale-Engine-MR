///@arg start
///@arg target
///@arg time
///@arg delay*
///@arg tween*
///@arg ease*
///@arg color*
///@arg blendmode*
function Fader_Fade() {
	var START=argument[0];
	var TARGET=argument[1];
	var TIME=argument[2];
	var DELAY=0;
	var TWEEN = 0
	var EASE = 0
	var COLOR = fader.color
	var BM = fader.bm
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
		COLOR=argument[6];
	}
	if(argument_count>=8){
		BM=argument[7];
	}
	if(START==-1){
		START=fader.alpha;
	}
	fader.color = COLOR
	fader.bm = BM
	Anim_Destroy(fader,"alpha");
	Anim_Create(fader,"alpha",TWEEN,EASE,START,TARGET-START,TIME,DELAY);

	return true;


}
