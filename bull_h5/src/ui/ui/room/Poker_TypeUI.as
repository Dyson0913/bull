/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Poker_TypeUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800}};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}