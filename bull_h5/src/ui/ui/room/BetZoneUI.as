/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.Bet_TotalUI;
	import ui.ui.room.Bet_selfUI;
	import ui.ui.room.BetLImitUI;
	import ui.ui.room.RankPanelUI;

	public class BetZoneUI extends View {
		public var mcItem0:Image;
		public var zone_1:Image;
		public var mcItem2:Image;
		public var mcItem3:Image;
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
		public var _tips:Box;
		public var Tips_3:Image;
		public var Name_3:Label;
		public var Tips_2:Image;
		public var Name_2:Label;
		public var Tips_1:Image;
		public var Name_1:Label;
		public var Tips_0:Image;
		public var Name_0:Label;

		public static var uiView:Object ={"type":"View","props":{"width":1000,"height":200},"child":[{"type":"Image","props":{"y":3,"x":2,"var":"mcItem0","skin":"res/gameScene/闲家下注区4.png","name":"mcItem0"}},{"type":"Image","props":{"y":2,"x":252,"var":"zone_1","skin":"res/gameScene/闲家下注区3.png","name":"zone_1"}},{"type":"Image","props":{"y":3,"x":503,"var":"mcItem2","skin":"res/gameScene/闲家下注区2.png","name":"mcItem2"}},{"type":"Image","props":{"y":3,"x":747,"var":"mcItem3","skin":"res/gameScene/闲家下注区1.png","name":"mcItem3"}},{"type":"Bet_Total","props":{"y":4,"x":23,"var":"total_amount_0","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":3,"x":264,"var":"total_amount_1","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":4,"x":507,"var":"total_amount_2","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":6,"x":750,"var":"total_amount_3","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_self","props":{"y":157,"x":45,"var":"self_amount_0","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":297,"var":"self_amount_1","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":548,"var":"self_amount_2","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":806,"var":"self_amount_3","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"BetLImit","props":{"y":-117,"x":379,"visible":false,"var":"BetLimit","runtime":"ui.ui.room.BetLImitUI"}},{"type":"RankPanel","props":{"y":18,"x":161,"visible":false,"var":"Rankp_0","runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":17,"x":416,"visible":false,"var":"Rankp_1","runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":17,"x":659,"visible":false,"var":"Rankp_2","runtime":"ui.ui.room.RankPanelUI"}},{"type":"RankPanel","props":{"y":18,"x":904,"visible":false,"var":"Rankp_3","runtime":"ui.ui.room.RankPanelUI"}},{"type":"Image","props":{"y":232,"x":232,"var":"_arrows","skin":"res/gameScene/牛牛指向箭头.png"}},{"type":"Box","props":{"visible":false,"var":"_tips"},"child":[{"type":"Image","props":{"y":59,"x":624,"var":"Tips_3","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":148,"var":"Name_3","text":"天涯歌女爱与仇","height":21,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":59,"x":662,"var":"Tips_2","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":148,"var":"Name_2","text":"天涯歌女爱与仇","height":21,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":58,"x":415,"var":"Tips_1","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":148,"var":"Name_1","text":"天涯歌女爱与仇","height":21,"fontSize":22,"color":"#f8f0ef","align":"left"}}]},{"type":"Image","props":{"y":55,"x":163,"var":"Tips_0","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":17,"x":19,"width":155,"var":"Name_0","text":"天涯歌女爱与仇","height":32,"fontSize":22,"color":"#f8f0ef","align":"left"}}]}]}]};
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