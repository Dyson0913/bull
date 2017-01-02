/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class TimerUI extends View {
		public var LeftTime:Label;

		public static var uiView:Object ={"type":"View","props":{"width":123,"height":123},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/倒计时03.png"}},{"type":"Image","props":{"y":1,"x":4,"skin":"res/gameScene/倒计时02.png"}},{"type":"Image","props":{"y":10,"x":10,"skin":"res/gameScene/倒计时01.png"}},{"type":"Label","props":{"y":47,"x":43,"width":20,"var":"LeftTime","text":"10","scaleY":2,"scaleX":2,"height":15,"color":"#ece7e7","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}