///@desc Use
Player_Heal(60);

Dialog_Add("{define `ITEM` `"+_name+"`}"+Lang_GetString("item.eat")+Item_GetTextHeal(60));
Dialog_Start();

Item_Remove(_item_slot);

snd_play(snd_item_swallow)
snd_play(snd_item_heal,,,20)

event_inherited();