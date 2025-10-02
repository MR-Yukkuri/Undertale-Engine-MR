///@arg x
///@arg y
///@arg {string} text セリフ
///@arg template 吹き出しのテンプレート
///@desc 敵のセリフを作成します。
function Battle_SetDialogEnemy(_x,_y,_text,_template=0){
	var txt = instance_create_depth(_x,_y,0,battle_dialog_enemy)
	txt.text = _text
	txt.template = _template
	return txt
}