///@desc Turn Preparation Start
//攻撃用オブジェクトを作成
var turnnum,turn
if attack_prog && Battle_GetMenuFightDamage() <= 0 && Battle_GetMenuChoiceEnemy() == Battle_ConvertEnemySlotToMenuChoiceEnemy(_enemy_slot) {
	turnnum = irandom_range(atk_rand_min,atk_rand_max)
	turn = asset_get_index(("battle_turn_test_rand" + string(turnnum))) //攻撃用オブジェクトの名前を取得する
}
else {
	turnnum = random_turn ? irandom_range(rand_min,rand_max) : _turn
	turn = asset_get_index(("battle_turn_test" + string(turnnum))) //攻撃用オブジェクトの名前を取得する
}
if object_exists(turn) //取得した名前のオブジェクトが存在している場合作成する
	instance_create_depth(0, 0, 0, turn)