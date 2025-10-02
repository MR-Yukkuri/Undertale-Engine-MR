///@arg {asset.GMSound} snd 再生する音
///@desc 音の重複を回避できるaudio_play_soundです。
function snd_play(snd){
	audio_stop_sound(snd)
	var s = audio_play_sound(snd,0,0)
	return s
}