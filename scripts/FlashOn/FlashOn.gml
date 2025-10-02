///@arg snd_pause 音を一時停止するか
///@arg bullet_destroy 弾幕を削除するか
///@arg color 画面の色
///@desc 画面を暗転させます。
function FlashOn(snd_pause=true,bullet_destroy=true,color=c_black){
	Anim_Destroy(fader,"alpha")
	fader.color = color
	fader.bm = bm_normal
	fader.alpha = 1
	if bullet_destroy
			instance_destroy(battle_bullet)
	if snd_pause
		audio_pause_all()
	snd_play(snd_noise)
}
///@desc 画面の暗転を解除します。
function FlashOff(){
	Anim_Destroy(fader,"alpha")
	fader.alpha = 0
	audio_resume_all()
	snd_play(snd_noise)
}