///@desc Use
Player_Heal(45);

Dialog_Add("＊ ゆきだるまのかけらを&   たべた。");
Dialog_Start();

Item_Remove(_item_slot);

snd_play(snd_item_swallow)
snd_play(snd_item_heal,,,20)

event_inherited();