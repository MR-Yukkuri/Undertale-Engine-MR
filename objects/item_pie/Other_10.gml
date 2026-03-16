///@desc Use
Player_Heal(Player_GetHpMax())

Dialog_Add("{define `ITEM` `"+_name+"`}"+Lang_GetString("item.eat")+"&＊ HPが  まんタンになった。");
Dialog_Start();

Item_Remove(_item_slot);

snd_play(snd_item_swallow)
snd_play(snd_item_heal,,,20)

event_inherited();