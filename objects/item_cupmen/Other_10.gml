///@desc Use
var heal = 90
Player_Heal(heal);

Dialog_Add("＊ そのまま  たべたほうが&   おいしい。"+Item_GetTextHeal(heal));
Dialog_Start();

Item_Remove(_item_slot);

snd_play(snd_item_swallow)
snd_play(snd_item_heal,,,20)

event_inherited();