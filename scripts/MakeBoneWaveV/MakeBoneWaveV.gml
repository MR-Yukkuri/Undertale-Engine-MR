///@arg x ここから骨が出る
///@arg y 安全地帯の中心位置
///@arg {real} hspeed 移動速度
///@arg size 骨の数
///@arg center_space 安全地帯のサイズ
///@arg wave_size ウェーブの振り幅
///@arg wave_cycle ウェーブの周期
///@arg wave_offset ウェーブの初期位置
///@arg use_cos cosを使うか
///@arg color 色
///@arg head 頭を描画するか
///@arg bone_space 骨同士の間隔
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 縦向きの骨のウェーブを作成します。
function MakeBoneWaveV(x,y,_hspeed,_size=50,_center_space=40,_wave_size=20,_space_cycle=0.3,_wave_offset=0,_use_cos=false,_color=COLOR.WHITE,_head=false,_space=12,_follow=false,_follow_target=battle_board){
	var wave = instance_create_depth(x,y,0,battle_bone_wave)
	with(wave) {
		size = _size
		space = _space
		dir = 0
		hspd = _hspeed
		center_space = _center_space
		space_size = _wave_size
		space_cycle = _space_cycle
		count = _wave_offset
		use_cos = _use_cos
		color = _color
		head = _head
		follow = _follow
		follow_target = _follow_target
	}
	return wave
}