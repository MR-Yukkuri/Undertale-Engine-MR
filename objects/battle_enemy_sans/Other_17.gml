///@desc Dialog End
if attack_prog && !atk_rturn && Battle_GetMenuFightDamage() <= 0 && Battle_GetMenuChoiceEnemy() == Battle_ConvertEnemySlotToMenuChoiceEnemy(_enemy_slot) {
	Battle_SetNextState(BATTLE_STATE.MENU)
}