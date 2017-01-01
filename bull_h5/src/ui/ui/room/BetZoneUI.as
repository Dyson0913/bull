/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.Bet_TotalUI;
	import ui.ui.room.Bet_selfUI;

	public class BetZoneUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":1000,"height":200},"child":[{"type":"Image","props":{"y":3,"x":2,"skin":"res/gameScene/闲家下注区4.png"}},{"type":"Image","props":{"y":2,"x":252,"skin":"res/gameScene/闲家下注区3.png"}},{"type":"Image","props":{"y":3,"x":503,"skin":"res/gameScene/闲家下注区2.png"}},{"type":"Image","props":{"y":3,"x":747,"skin":"res/gameScene/闲家下注区1.png"}},{"type":"Bet_Total","props":{"y":4,"x":23,"runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":3,"x":265,"runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":4,"x":506,"runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_Total","props":{"y":6,"x":751,"runtime":"ui.ui.room.Bet_TotalUI"}},{"type":"Bet_self","props":{"y":157,"x":45,"runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":297,"runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":548,"runtime":"ui.ui.room.Bet_selfUI"}},{"type":"Bet_self","props":{"y":157,"x":806,"runtime":"ui.ui.room.Bet_selfUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.Bet_TotalUI",Bet_TotalUI);
			View.regComponent("ui.ui.room.Bet_selfUI",Bet_selfUI);
			super.createChildren();
			createView(uiView);
		}
	}
}