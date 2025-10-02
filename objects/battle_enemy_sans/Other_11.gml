///@desc Battle Start
//先制攻撃が有効な場合、戦闘開始直後に攻撃を開始する
if firstattack
{
	Battle_SetNextState(BATTLE_STATE.TURN_PREPARATION);
}