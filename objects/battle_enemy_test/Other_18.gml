///@desc Turn Preparation Start
//攻撃用オブジェクトを作成
var turn = asset_get_index(("battle_turn_test" + string(_turn))) //攻撃用オブジェクトの名前を取得する
if object_exists(turn) //取得した名前のオブジェクトが存在している場合作成する
 instance_create_depth(0, 0, 0, turn)
