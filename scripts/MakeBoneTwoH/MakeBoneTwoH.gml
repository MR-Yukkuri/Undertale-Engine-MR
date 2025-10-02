///@arg x 安全地帯の中心位置
///@arg y ここから骨が出る
///@arg range 安全地帯のサイズ
///@arg vspeed 移動速度
///@arg color 色
///@arg head 頭を描画するか
///@arg sin_size 長さの振れ幅
///@arg sin_speed 長さが変化する速度
///@arg use_cos cosを使うか
///@arg sin_offset 長さの初期位置
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 左右から生えた骨を作成します。
function MakeBoneTwoH(x,y,range=40,vspeed=0,color=COLOR.WHITE,head=true,sin_size=0,sin_speed=0.1,use_cos=false,sin_offset=0,follow=false,follow_target=battle_board){
	var Len = [x-(battle_board.x-battle_board.left),x-(battle_board.x+battle_board.right)],b=[]
	b[0] = MakeBoneLeft(y,max(abs(Len[0])-range/2,1),0,vspeed,color,,,head,,,sin_size,sin_speed,use_cos,sin_offset,follow,follow_target)
	b[1] = MakeBoneRight(y,max(abs(Len[1])-range/2,1),0,vspeed,color,,,head,,,sin_size,sin_speed,use_cos,sin_offset+pi,follow,follow_target)
	return b
}