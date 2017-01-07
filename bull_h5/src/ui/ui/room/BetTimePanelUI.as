/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetTimePanelUI extends View {
		public var mcbg:Image;
		public var bt_txt:Label;

		public static var uiView:Object ={"type":"View","props":{"width":123,"height":123},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/倒计时03.png"}},{"type":"Image","props":{"y":1,"x":4,"var":"mcbg","skin":"res/gameScene/倒计时02.png"}},{"type":"Image","props":{"y":10,"x":10,"skin":"res/gameScene/倒计时01.png"}},{"type":"Label","props":{"y":46,"x":38,"width":48,"var":"bt_txt","text":"10","height":24,"fontSize":22,"color":"#ece7e7","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}