///@arg lang_id/name
function Lang_LoadString() {
	var LANG=argument[0];
	ds_map_clear(global._gmu_lang_string)
	switch LANG {
		#region English
		case LANGUAGE.ENGLISH:
			#region font
				ds_map_add(global._gmu_lang_string,"font.dialog.0",font_dt_mono);
				ds_map_add(global._gmu_lang_string,"font.dialog.0.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.dialog.0.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.dialog.0.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.dialog.1",font_dt_mono);
				ds_map_add(global._gmu_lang_string,"font.dialog.1.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.dialog.1.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.dialog.1.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.dialog.space.y","0");
				
				ds_map_add(global._gmu_lang_string,"font.menu.0",font_dt_sans);
				ds_map_add(global._gmu_lang_string,"font.menu.0.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.menu.0.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.menu.0.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.menu.1",font_dt_sans);
				ds_map_add(global._gmu_lang_string,"font.menu.1.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.menu.1.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.menu.1.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.menu.space.y","0");
				
				ds_map_add(global._gmu_lang_string,"font.battle.0",font_dotumche);
				ds_map_add(global._gmu_lang_string,"font.battle.0.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.battle.0.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.battle.0.space.x","1");
				ds_map_add(global._gmu_lang_string,"font.battle.1",font_dotumche);
				ds_map_add(global._gmu_lang_string,"font.battle.1.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.battle.1.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.battle.1.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.battle.space.y","5");
				
				ds_map_add(global._gmu_lang_string,"font.playername.0",font_mars_needs_cunnilingus);
				ds_map_add(global._gmu_lang_string,"font.playername.0.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.playername.0.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.playername.0.space.x","0");
				ds_map_add(global._gmu_lang_string,"font.playername.1",font_mars_needs_cunnilingus);
				ds_map_add(global._gmu_lang_string,"font.playername.1.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.playername.1.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.playername.1.space.x","0");
				
				ds_map_add(global._gmu_lang_string,"font.sans.0",font_comicsans);
				ds_map_add(global._gmu_lang_string,"font.sans.0.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.sans.0.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.sans.0.space.x","1");
				ds_map_add(global._gmu_lang_string,"font.sans.1",font_comicsans);
				ds_map_add(global._gmu_lang_string,"font.sans.1.scale.x","1");
				ds_map_add(global._gmu_lang_string,"font.sans.1.scale.y","1");
				ds_map_add(global._gmu_lang_string,"font.sans.1.space.x","1");
				ds_map_add(global._gmu_lang_string,"font.sans.space.y","-2");
				
				#endregion
			#region text
				ds_map_add(global._gmu_lang_string,"battle.menu.mercy.spare","* Spare");
				ds_map_add(global._gmu_lang_string,"battle.menu.mercy.flee","* Flee");
				ds_map_add(global._gmu_lang_string,"battle.result.won","* You WON!&* You earned {insert EXP} EXP and {insert GOLD} GOLD.");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.0","* Escaped...");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.1","* I'm outta here.");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.2","* I've got better to do.");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.3","* Don't slow me down.");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.reward","* Ran away with {insert EXP} EXP&  and {insert GOLD} GOLD.");
				ds_map_add(global._gmu_lang_string,"battle.result.lv_up","* Your LOVE increased.");
				ds_map_add(global._gmu_lang_string,"item.eat","* You ate the {insert ITEM}.");
				ds_map_add(global._gmu_lang_string,"item.equip","* You equiped the {insert ITEM}.");
				ds_map_add(global._gmu_lang_string,"item.heal.part","* You recovered {insert HP} HP!");
				ds_map_add(global._gmu_lang_string,"item.heal.all","* Your HP was maxed out.");
				ds_map_add(global._gmu_lang_string,"item.drop.0","* The {insert ITEM} was&  thrown away.");
				ds_map_add(global._gmu_lang_string,"item.drop.1","* You bid a quiet farewell&  to the {insert ITEM}.");
				ds_map_add(global._gmu_lang_string,"item.drop.2","* You put the {insert ITEM}&  on the ground and gave it a&  little pat.");
				ds_map_add(global._gmu_lang_string,"item.drop.3","* You threw the {insert ITEM}&  on the ground like the piece&  of trash it is.");
				ds_map_add(global._gmu_lang_string,"item.drop.4","* You abandoned the &  {insert ITEM}.");
				ds_map_add(global._gmu_lang_string,"item.stick.name","Stick");
				ds_map_add(global._gmu_lang_string,"item.stick.info","* Stick - Weapon AT 0&* Its bark is worse than&  its bite.");
				ds_map_add(global._gmu_lang_string,"item.stick.use","* You threw the stick away.{sleep 20}&* Then picked it back up.");
				ds_map_add(global._gmu_lang_string,"item.bandage.name","Bandage");
				ds_map_add(global._gmu_lang_string,"item.bandage.info","* Bandage - Heals 10 HP&* It has already been used&  several times.");
				ds_map_add(global._gmu_lang_string,"item.bandage.use.0","* You re-applied the bandage.");
				ds_map_add(global._gmu_lang_string,"item.bandage.use.1","* Still kind of gooey.");
				ds_map_add(global._gmu_lang_string,"item.toy_knife.name","Toy Knife");
				ds_map_add(global._gmu_lang_string,"item.toy_knife.info","* Toy Knife - Weapon AT 3&* Made of plastic.&* A rarity nowadays.");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.name","Faded Ribbon");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.name.short","Ribbon");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.info","* Faded Ribbon - Armor DF 3&* If you're cuter,{sleep 20} monsters&  won't hit you as hard.");
				ds_map_add(global._gmu_lang_string,"menu.begin","Begin Game");
				ds_map_add(global._gmu_lang_string,"menu.settings","Settings");
				ds_map_add(global._gmu_lang_string,"menu.continue","Continue");
				ds_map_add(global._gmu_lang_string,"menu.reset","Reset");
				ds_map_add(global._gmu_lang_string,"menu.reset.true","True Reset");
				ds_map_add(global._gmu_lang_string,"menu.naming.title","Name the fallen human.");
				ds_map_add(global._gmu_lang_string,"menu.naming.quit","Quit");
				ds_map_add(global._gmu_lang_string,"menu.naming.backspace","Backspace");
				ds_map_add(global._gmu_lang_string,"menu.naming.done","Done");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title","Is this name correct?");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.reset","A name has already&been chosen.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.aaaaaa","Not very creative...?");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.alphys","D-don't do that.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.alphy","Uh.... OK?");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.asgore","You cannot.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.toriel","I think you should&think of your own&name, my child.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.asriel","...");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.flowey","I already CHOSE&that name.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.sans","nope.");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.papyru","I'LL ALLOW IT!!!!");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.undyne","Get your OWN name!");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.mtt","OOOOH!!! ARE YOU&PROMOTING MY BRAND?");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.chara","The true name.");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.0","Buy");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.1","Sell");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.2","Talk");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.3","Exit");
				ds_map_add(global._gmu_lang_string,"shop.menu.exit","Exit");
				ds_map_add(global._gmu_lang_string,"shop.menu.buy","Wanna buy&anything?");
				ds_map_add(global._gmu_lang_string,"shop.menu.buy.confirm","Buy it for&{insert PRICE}G?&  {choice 0}  Yes&  {choice 1}  No{choice `CHOICE`}{pause}");
				ds_map_add(global._gmu_lang_string,"shop.menu.sell.confirm","&            Sell {insert ITEM} for {insert PRICE}G?&&                   {choice 0}  Yes                           {choice 1}  No{choice `CHOICE`}{pause}");
				ds_map_add(global._gmu_lang_string,"shop.menu.talk","Wanna talk&anything?");
				ds_map_add(global._gmu_lang_string,"shop.menu.page","PAGE {insert PAGE}");
				ds_map_add(global._gmu_lang_string,"ui.menu.item","ITEM");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.use","USE");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.info","INFO");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.drop","DROP");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat","STAT");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.0","\"{insert NAME}\"{space_y -1}&&{space_y 0}LV  {insert LV}&HP  {insert HP} / {insert HP_MAX}&&AT  {insert ATK} ({insert ATK_ITEM})&DF  {insert DEF} ({insert DEF_ITEM}){space_y -1}&&{space_y 0}WEAPON: {insert WEAPON}&ARMOR: {insert ARMOR}{space_y 4}&{space_y 0}GOLD: {insert GOLD}");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.1","EXP: {insert EXP}&NEXT: {insert EXP_NEXT}");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.2","{space_y -1}&&{space_y 0}&{space_y 4}&{space_y 0}KILLS: {insert KILLS}");
				ds_map_add(global._gmu_lang_string,"ui.menu.phone","CELL");
				ds_map_add(global._gmu_lang_string,"ui.save.name.empty","EMPTY");
				ds_map_add(global._gmu_lang_string,"ui.save.save","Save");
				ds_map_add(global._gmu_lang_string,"ui.save.return","Return");
				ds_map_add(global._gmu_lang_string,"ui.save.saved","File Saved.");
				ds_map_add(global._gmu_lang_string,"ui.box.inventory","INVENTORY");
				ds_map_add(global._gmu_lang_string,"ui.box.box","BOX");
				ds_map_add(global._gmu_lang_string,"ui.box.finish","Press [X] to finish");
				ds_map_add(global._gmu_lang_string,"ui.buy.space","SPACE");
				#endregion
			break
			#endregion
		#region Japanese
		case LANGUAGE.JAPANESE:
			#region font
				ds_map_add(global._gmu_lang_string,"font.dialog.0",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.dialog.0.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.dialog.0.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.dialog.0.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.dialog.1",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.dialog.1.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.dialog.1.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.dialog.1.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.dialog.space.y",2);
				
				ds_map_add(global._gmu_lang_string,"font.menu.0",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.menu.0.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.menu.0.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.menu.0.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.menu.1",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.menu.1.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.menu.1.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.menu.1.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.menu.space.y",2);
				
				ds_map_add(global._gmu_lang_string,"font.battle.0",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.battle.0.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.battle.0.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.battle.0.space.x",1);
				ds_map_add(global._gmu_lang_string,"font.battle.1",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.battle.1.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.battle.1.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.battle.1.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.battle.space.y",2);
				
				ds_map_add(global._gmu_lang_string,"font.playername.0",font_jf16);
				ds_map_add(global._gmu_lang_string,"font.playername.0.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.playername.0.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.playername.0.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.playername.1",font_jf16);
				ds_map_add(global._gmu_lang_string,"font.playername.1.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.playername.1.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.playername.1.space.x",0);
				
				ds_map_add(global._gmu_lang_string,"font.sans.0",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.sans.0.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.sans.0.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.sans.0.space.x",1);
				ds_map_add(global._gmu_lang_string,"font.sans.1",font_jf14);
				ds_map_add(global._gmu_lang_string,"font.sans.1.scale.x",1);
				ds_map_add(global._gmu_lang_string,"font.sans.1.scale.y",1);
				ds_map_add(global._gmu_lang_string,"font.sans.1.space.x",0);
				ds_map_add(global._gmu_lang_string,"font.sans.space.y",2);
				
				#endregion
			#region text
				ds_map_add(global._gmu_lang_string,"battle.menu.mercy.spare","＊ にがす");
				ds_map_add(global._gmu_lang_string,"battle.menu.mercy.flee","＊ にげる");
				ds_map_add(global._gmu_lang_string,"battle.result.won","＊ You WON!&＊ {insert EXP}EXPと{insert GOLD}ゴールドを  かくとく！");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.0","＊ バトルからにげた…");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.1","* ＊ さようなら。");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.2","＊ こんなことを  している&   ばあいじゃない。");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.3","＊ とめないで。");
				ds_map_add(global._gmu_lang_string,"battle.result.fled.reward","＊ バトルからにげた。&   {insert EXP}EXPと  {insert GOLD}G  てにいれた。");
				ds_map_add(global._gmu_lang_string,"battle.result.lv_up","＊ LOVEが  あがった。");
				ds_map_add(global._gmu_lang_string,"item.eat","＊ {insert ITEM}を  たべた。");
				ds_map_add(global._gmu_lang_string,"item.equip","＊ {insert ITEM}を  そうびした。");
				ds_map_add(global._gmu_lang_string,"item.heal.part","＊ HPが  {insert HP}かいふくした！");
				ds_map_add(global._gmu_lang_string,"item.heal.all","＊ HPが  まんたんに　なった。");
				ds_map_add(global._gmu_lang_string,"item.drop.0","＊ {insert ITEM}を  すてた。");
				ds_map_add(global._gmu_lang_string,"item.drop.1","＊ {insert ITEM}に  そっと&  わかれを  つげた。");
				ds_map_add(global._gmu_lang_string,"item.drop.2","＊ {insert ITEM}をじめんに&   おいて  「おつかれさま」と&   なでてあげた。");
				ds_map_add(global._gmu_lang_string,"item.drop.3","＊ {insert ITEM}を  ゴミのように&   なげすてた。");
				ds_map_add(global._gmu_lang_string,"item.drop.4","*＊ {insert ITEM}を  みすてた。");
				ds_map_add(global._gmu_lang_string,"item.stick.name","ぼうきれ");
				ds_map_add(global._gmu_lang_string,"item.stick.info","＊ ぼうきれ - ぶきAT0&＊ さんぽちゅうの  いぬが  よく&   ぶつかる。");
				ds_map_add(global._gmu_lang_string,"item.stick.use","＊ ぼうきれを  とおくへ  なげすてた。{sleep 20}&＊ そして  ひろいあげた。");
				ds_map_add(global._gmu_lang_string,"item.bandage.name","ほうたい");
				ds_map_add(global._gmu_lang_string,"item.bandage.info","＊ ほうたい - 10HPかいふく&＊ なんどか  しようされた  けいせきが&   ある。");
				ds_map_add(global._gmu_lang_string,"item.bandage.use.0","＊ ほうたいを　まきなおした。");
				ds_map_add(global._gmu_lang_string,"item.bandage.use.1","＊ まだ  ちょっと  ユルユルだ。");
				ds_map_add(global._gmu_lang_string,"item.toy_knife.name","おもちゃのナイフ");
				ds_map_add(global._gmu_lang_string,"item.toy_knife.info","＊ おもちゃのナイフ - ぶきAT3&＊ プラスチックせい。&   さいきんは  レアもの。");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.name","いろあせたリボン");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.name.short","リボン");
				ds_map_add(global._gmu_lang_string,"item.faded_ribbon.info","＊ いろあせたリボン - アーマーDF3&＊ かわいく  きかざれば  {sleep 20}てきも&   つい  てかげん  するはず。");
				ds_map_add(global._gmu_lang_string,"menu.begin","ゲームをはじめる");
				ds_map_add(global._gmu_lang_string,"menu.settings","せってい");
				ds_map_add(global._gmu_lang_string,"menu.continue","コンティニュー");
				ds_map_add(global._gmu_lang_string,"menu.reset","リセット");
				ds_map_add(global._gmu_lang_string,"menu.reset.true","本当のリセット");
				ds_map_add(global._gmu_lang_string,"menu.naming.title","おちたニンゲンに  なまえをつけてください");
				ds_map_add(global._gmu_lang_string,"menu.naming.quit","やめる");
				ds_map_add(global._gmu_lang_string,"menu.naming.backspace","さくじょ");
				ds_map_add(global._gmu_lang_string,"menu.naming.done","かくてい");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title","このなまえで&よろしいですか？");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.reset","すでに  なまえが&つけられています。");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.aaaaaa","ほんとに&これでいいの…？");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.alphys","ダ…  ダメだよっ！");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.alphy","う…  うん&いいよ…");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.asgore","そのなまえは  ダメだ。");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.toriel","ちゃんと  なまえを&かんがえるのよ。");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.asriel","…");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.flowey","そのなまえは&ボクだけのもの。");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.sans","ダメだぜ。");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.papyru","オレさまは&べつに&いいよッ！");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.undyne","ひとの  なまえを#パクるな！");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.mtt","おお！！キミ！！&せんでん  してくれるのかい？");
				ds_map_add(global._gmu_lang_string,"menu.confirm.title.chara","ほんとうのなまえ。");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.0","かう");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.1","うる");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.2","はなす");
				ds_map_add(global._gmu_lang_string,"shop.menu.choice.3","でる");
				ds_map_add(global._gmu_lang_string,"shop.menu.exit","もどる");
				ds_map_add(global._gmu_lang_string,"shop.menu.buy","なにか  かいたいものある？");
				ds_map_add(global._gmu_lang_string,"shop.menu.buy.confirm","{insert PRICE}Gでかう？&  {choice 0}  はい&  {choice 1}  いいえ{choice `CHOICE`}{pause}");
				ds_map_add(global._gmu_lang_string,"shop.menu.sell.confirm","&            {insert ITEM}を{insert PRICE}Gでうる？&&                   {choice 0}  はい                           {choice 1}  いいえ{choice `CHOICE`}{pause}");
				ds_map_add(global._gmu_lang_string,"shop.menu.talk","なにについてはなす？");
				ds_map_add(global._gmu_lang_string,"shop.menu.page","ページ{insert PAGE}");
				ds_map_add(global._gmu_lang_string,"ui.menu.item","ITEM");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.use","USE");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.info","INFO");
				ds_map_add(global._gmu_lang_string,"ui.menu.item.drop","DROP");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat","STAT");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.0","\"{insert NAME}\"{space_y -1}&&{space_y 0}LV  {insert LV}&HP  {insert HP} / {insert HP_MAX}&&AT  {insert ATK} ({insert ATK_ITEM})&DF  {insert DEF} ({insert DEF_ITEM}){space_y -1}&&{space_y 0}WEAPON: {insert WEAPON}&ARMOR: {insert ARMOR}{space_y 4}&{space_y 0}GOLD: {insert GOLD}");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.1","EXP: {insert EXP}&NEXT: {insert EXP_NEXT}");
				ds_map_add(global._gmu_lang_string,"ui.menu.stat.2","{space_y -1}&&{space_y 0}&{space_y 4}&{space_y 0}KILLS: {insert KILLS}");
				ds_map_add(global._gmu_lang_string,"ui.menu.phone","セーブ");
				ds_map_add(global._gmu_lang_string,"ui.save.name.empty","データなし");
				ds_map_add(global._gmu_lang_string,"ui.save.save","セーブ");
				ds_map_add(global._gmu_lang_string,"ui.save.return","もどる");
				ds_map_add(global._gmu_lang_string,"ui.save.saved","セーブしました。");
				ds_map_add(global._gmu_lang_string,"ui.box.inventory","もちもの");
				ds_map_add(global._gmu_lang_string,"ui.box.box","ボックス");
				ds_map_add(global._gmu_lang_string,"ui.box.finish","Xで  しゅうりょう");
				ds_map_add(global._gmu_lang_string,"ui.buy.space","ITEM");
				#endregion
		break
		#endregion
}
	return true;


}