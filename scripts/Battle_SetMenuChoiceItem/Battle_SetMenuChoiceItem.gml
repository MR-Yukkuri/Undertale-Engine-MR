///@arg item_choice
///@arg call_event*
function Battle_SetMenuChoiceItem() {
	var SLOT=argument[0];
	var CALL=true;
	if(argument_count>=2){
		CALL=argument[1];
	}

	if(SLOT<Item_GetNumber()){
		battle._menu_choice_item=SLOT;
		if global.item_type == 0 {
			while(SLOT>=battle._menu_choice_item_first+3){
				battle._menu_choice_item_first+=1;
			}
			while(SLOT<battle._menu_choice_item_first){
				battle._menu_choice_item_first-=1;
			}
		}
	
		//更新文字
		var text="";
		var text2 = ""
		var proc=battle._menu_choice_item_first;
		if global.item_type == 0 {
			repeat(3){
				if(Item_IsValid(Item_Get(proc))){
					text+=(global.lang==LANGUAGE.JAPANESE?"＊ " : "* ")+Item_GetName(Item_Get(proc))+"&";
					proc+=1;
				}
			}
		}
		else if global.item_type == 1 {
			proc = (SLOT div 4)*4
			for(var i=0;i<4;i++){
				if(Item_IsValid(Item_Get(proc))){
					if i%2==0
						text+=(global.lang==LANGUAGE.JAPANESE?"＊ " : "* ")+Item_GetName(Item_Get(proc))+"&";
					else
						text2+=(global.lang==LANGUAGE.JAPANESE?"＊ " : "* ")+Item_GetName(Item_Get(proc))+"&"+(i==3?"   "+Lang_GetString("battle.menu.item.page")+" "+string(((proc)div 4)+1):"");
					proc+=1;
				}
			}
			Battle_SetDialog(text2,true,true);
		}
		Battle_SetDialog(text,true);
		
				
		if(CALL){
			Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_CHOICE_SWITCH);
		}
	
		return true;
	}else{
		return false;
	}


}
