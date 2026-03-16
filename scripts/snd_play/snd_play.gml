///@arg {asset.GMSound} snd 再生する音
///@arg gain 音量(0から1)
///@arg pitch 音の高さ
///@arg delay 何フレーム後に再生するか
///@desc 音の重複を回避できるaudio_play_soundです。
function snd_play(snd,gain=1,pitch=1,delay=0){
	if delay > 0 {
		time_source_start(time_source_create(time_source_game,delay,time_source_units_frames,snd_play,[snd,gain,pitch,0]))
		return true
	}
	else {
		audio_stop_sound(snd)
		var s = audio_play_sound(snd,0,0)
		return s
	}
}