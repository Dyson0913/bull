/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Bet_selfUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":130,"height":40},"child":[{"type":"Image","props":{"y":3,"x":3,"skin":"res/gameScene/人民币￥底板.png"}},{"type":"Label","props":{"y":5,"x":7,"width":59,"text":"100000","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}