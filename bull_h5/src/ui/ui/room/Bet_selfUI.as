/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Bet_selfUI extends View {
		public var amount:Label;

		public static var uiView:Object ={"type":"View","props":{"width":130,"height":40},"child":[{"type":"Image","props":{"y":3,"x":3,"skin":"res/gameScene/人民币￥底板.png"}},{"type":"Label","props":{"y":6,"x":3,"width":125,"var":"amount","text":"¥1234.56","height":30,"font":"tableFont","color":"#ece7e7","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}