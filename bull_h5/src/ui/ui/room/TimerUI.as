/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class TimerUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":100,"height":100},"child":[{"type":"Image","props":{"y":0,"x":-1,"skin":"res/gameScene/底板.png"}},{"type":"Label","props":{"y":30,"x":-18,"width":59,"text":"10","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}