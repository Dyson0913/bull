/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerTypeUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/1420X800-界面2.jpg"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}