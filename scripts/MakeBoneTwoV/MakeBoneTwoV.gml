///@arg x ここから骨が出る
///@arg y 安全地帯の中心位置
///@arg range 安全地帯のサイズ
///@arg hspeed 移動速度
///@arg color 色
///@arg head 頭を描画するか
///@arg sin_size 長さの振れ幅
///@arg sin_speed 長さが変化する速度
///@arg use_cos cosを使うか
///@arg sin_offset 長さの初期位置
///@arg follow ターゲットに追従するか
///@arg follow_target 追従するターゲット
///@desc 上下から生えた骨を作成します。
function MakeBoneTwoV(x,y,range=40,hspeed=0,color=COLOR.WHITE,head=true,sin_size=0,sin_speed=0.1,use_cos=false,sin_offset=0,follow=false,follow_target=battle_board){
	var Len = [y-(battle_board.y-battle_board.up),y-(battle_board.y+battle_board.down)],b=[]
	b[0] = MakeBoneTop(x,max(abs(Len[0])-range/2,1),hspeed,0,color,,,head,,,sin_size,sin_speed,use_cos,sin_offset,follow,follow_target)
	b[1] = MakeBoneBottom(x,max(abs(Len[1])-range/2,1),hspeed,0,color,,,head,,,sin_size,sin_speed,use_cos,sin_offset+pi,follow,follow_target)
	return b
}