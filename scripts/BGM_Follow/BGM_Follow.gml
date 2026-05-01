function BGM_Follow(bgm_slot,audio,time=undefined){
	if BGM_IsSlotValid(bgm_slot) && (!BGM_IsPlaying(bgm_slot) || BGM_GetAudio(bgm_slot)!=audio) {
		BGM_Play(bgm_slot,audio)
	}
	audio = BGM_GetID(bgm_slot)
	if time == undefined {
		if instance_exists(battle_turn) {
			time = battle_turn.time
		}
		else return true
	}
	var ada = time/60
	if (abs((audio_sound_get_track_position(audio)-ada)) >= 0.02)
		audio_sound_set_track_position(audio,ada)
}