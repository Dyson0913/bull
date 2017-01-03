/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.Bet_TotalUI;
	import ui.ui.room.Bet_selfUI;

	public class BetZoneUI extends View {
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

		public static var uiView:Object ={"type":"View","props":{"width":1000,"height":200},"child":[{"type":"Image","props":{"y":3,"x":2,"var":"zone_0","skin":"res/gameScene/闲家下注区4.png","name":"zone_0"}},{"type":"Image","props":{"y":2,"x":252,"var":"zone_1","skin":"res/gameScene/闲家下注区3.png","name":"zone_1"}},{"type":"Image","props":{"y":3,"x":503,"var":"zone_2","skin":"res/gameScene/闲家下注区2.png","name":"zone_2"}},{"type":"Image","props":{"y":3,"x":747,"var":"zone_3","skin":"res/gameScene/闲家下注区1.png","name":"zone_3"}},{"type":"Bet_Total","props":{"y":4,"x":23,"var":"total_amount_0","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":3,"x":264,"var":"total_amount_1","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":4,"x":507,"var":"total_amount_2","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":6,"x":750,"var":"total_amount_3","runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_self","props":{"y":157,"x":45,"var":"self_amount_0","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":297,"var":"self_amount_1","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":548,"var":"self_amount_2","runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":806,"var":"self_amount_3","runtime":"ui.ui.room.Bet_selfUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.Bet_TotalUI",Bet_TotalUI);
			View.regComponent("ui.ui.room.Bet_selfUI",Bet_selfUI);
			super.createChildren();
			createView(uiView);
		}
	}
}