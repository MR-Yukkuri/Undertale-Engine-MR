///@desc Turn End
//ダイアログテキストを設定。増やしたい場合はコピペしてif _turn = 1の数字を増やせばいい

var txt = "* Error" //ゲーム上でこのテキストが表示された場合は設定できていない
if _turn == 0{
	txt = "* Test text1";
}
if _turn == 1{
	txt = "* Test text2";
}
//応用：3ターン目以降をランダムテキストに
if _turn >= 2{
	txt = choose("* Test text3","* Test text4","* Test text5");
	
}
///

Battle_SetMenuDialog(txt); //設定したテキストをダイアログに反映
_turn++ //ターンを進める