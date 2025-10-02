///@arg {real} dir 叩きつける向き。90の倍数しか指定できない。
///@arg anim_target アニメーションを再生する敵
///@desc ソウルを指定した方向へ叩きつけます。
function Slam(dir,anim_target=battle_enemy){
	dir%=360
	if dir == DIR.DOWN {
		SlamDown(anim_target)
	}
	else if dir == DIR.UP {
		SlamUp(anim_target)
	}
	else if dir == DIR.LEFT {
		SlamLeft(anim_target)
	}
	else if dir == DIR.RIGHT {
		SlamRight(anim_target)
	}
}