///@desc Use
var heal = 40
Player_Heal(heal);

Dialog_Add("{define `ITEM` `"+_name+"`}"+Lang_GetString("item.eat")+"&＊ こうげきりょくが  4あがった！"+Item_GetTextHeal(heal));
Dialog_Start();

Item_Remove(_item_slot);
if Player_IsInBattle() && Player_GetAtk()+Battle_GetPlayerTempAtk()<150
	Battle_SetPlayerTempAtk(min(Battle_GetPlayerTempAtk()+4,150))
snd_play(snd_item_swallow)
//if !Player_IsInBattle() || Battle_IsSerious()
	snd_play(snd_item_heal,,,20)
//else
//	snd_play(snd_hero,,,20)

event_inherited();