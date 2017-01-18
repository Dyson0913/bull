/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.Bet_TotalUI;
	import ui.ui.room.Bet_selfUI;
	import ui.ui.room.BetLImitUI;
	import ui.ui.room.RankPanelUI;

	public class BetAreaViewUI extends View {
		public var zone_0:Image;
		public var zone_1:Image;
		public var zone_2:Image;
		public var zone_3:Image;
		public var total_amount_0:Bet_TotalUI;
		public var total_amount_1:Bet_TotalUI;
		public var total_amount_2:Bet_TotalUI;
		public var total_amount_3:Bet_TotalUI;
		public var self_amount_0:Bet_selfUI;
		public var self_amount_1:Bet_selfUI;
		public var self_amount_2:Bet_selfUI;
		public var self_amount_3:Bet_selfUI;
		public var BetLimit:BetLImitUI;
		public var Rankp_0:RankPanelUI;
		public var Rankp_1:RankPanelUI;
		public var Rankp_2:RankPanelUI;
		public var Rankp_3:RankPanelUI;
		public var _arrows:Image;
		public var Tips_3:Image;
		public var Name_3:Label;
		public var Tips_2:Image;
		public var Name_2:Label;
		public var Tips_1:Image;
		public var Name_1:Label;
		public var Tips_0:Image;
		public var Name_0:Label;
		public var Scene_0:Image;
		public var Scene_1:Image;
		public var Scene_2:Image;
		public var Scene_3:Image;

		public static var uiView:Object ={"type":"View","props":{"width":1000,"height":200},"child":[{"type":"Image","props":{"y":3,"x":2,"var":"zone_0","skin":"res/gameScene/闲家下注区4.png","name":"zone_0"}},{"type":"Image","props":{"y":2,"x":252,"var":"zone_1","skin":"res/gameScene/闲家下注区3.png","name":"zone_1"}},{"type":"Image","props":{"y":3,"x":503,"var":"zone_2","skin":"res/gameScene/闲家下注区2.png","name":"zone_2"}},{"type":"Image","props":{"y":3,"x":747,"var":"zone_3","skin":"res/gameScene/闲家下注区1.png","name":"zone_3"}},{"type":"Bet_Total","props":{"y":4,"x":23,"var":"total_amount_0","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":3,"x":264,"var":"total_amount_1","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":4,"x":507,"var":"total_amount_2","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":6,"x":750,"var":"total_amount_3","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_self","props":{"y":157,"x":45,"var":"self_amount_0","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":297,"var":"self_amount_1","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":548,"var":"self_amount_2","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":806,"var":"self_amount_3","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"BetLImit","props":{"y":-117,"x":379,"visible":false,"var":"BetLimit","runtime":"ui.ui.room.BetLImitUI"}},{"type":"RankPanel","props":{"y":23,"x":176,"visible":false,"var":"Rankp_0","name":"Rankp_0","mouseEnabled":false,"runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":27,"x":420,"visible":false,"var":"Rankp_1","name":"Rankp_1","mouseEnabled":false,"runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":22,"x":649,"visible":false,"var":"Rankp_2","name":"Rankp_2","mouseEnabled":false,"runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":15,"x":347,"visible":false,"var":"Rankp_3","name":"Rankp_3","mouseEnabled":false,"runtime":"ui.ui.room.RankPanelUI"}},{"type":"Image","props":{"y":232,"x":232,"var":"_arrows","skin":"res/gameScene/牛牛指向箭头.png"}},{"type":"Image","props":{"y":59.00000000000005,"x":624,"var":"Tips_3","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":327,"var":"Name_3","text":"天涯歌女爱与仇","height":31,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":59.00000000000005,"x":662,"var":"Tips_2","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":300,"var":"Name_2","text":"天涯歌女爱与仇","height":32,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":58.000000000000036,"x":415.00000000000006,"var":"Tips_1","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":316,"var":"Name_1","text":"天涯歌女爱与仇","height":29,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":55,"x":163,"width":115,"var":"Tips_0","skin":"res/gameScene/tips小底板.png","height":78,"sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":13,"width":293,"var":"Name_0","text":"涯歌女爱","height":32,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":6,"x":-2,"var":"Scene_0","skin":"res/gameScene/闲家下注区4.png","name":"Scene_0","alpha":0}},{"type":"Image","props":{"y":2,"x":255,"var":"Scene_1","skin":"res/gameScene/闲家下注区3.png","name":"Scene_1","alpha":0}},{"type":"Image","props":{"y":2,"x":501,"var":"Scene_2","skin":"res/gameScene/闲家下注区2.png","name":"Scene_2","alpha":0}},{"type":"Image","props":{"y":0,"x":747,"var":"Scene_3","skin":"res/gameScene/闲家下注区1.png","name":"Scene_3","alpha":0}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.Bet_TotalUI",Bet_TotalUI);
			View.regComponent("ui.ui.room.Bet_selfUI",Bet_selfUI);
			View.regComponent("ui.ui.room.BetLImitUI",BetLImitUI);
			View.regComponent("ui.ui.room.RankPanelUI",RankPanelUI);
			super.createChildren();
			createView(uiView);
		}
	}
}