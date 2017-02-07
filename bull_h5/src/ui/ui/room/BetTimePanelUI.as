/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetTimePanelUI extends View {
		public var mcbg:Image;
		public var bt_txt:Label;
		public var light:Animation;

		public static var uiView:Object ={"type":"View","props":{"width":123,"height":123},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/倒计时03.png"}},{"type":"Image","props":{"y":2,"x":4,"var":"mcbg","skin":"res/gameScene/倒计时02.png"}},{"type":"Image","props":{"y":11,"x":8,"skin":"res/gameScene/倒计时01.png"}},{"type":"Label","props":{"y":43,"x":38,"width":48,"var":"bt_txt","text":"10","height":24,"fontSize":22,"color":"#ece7e7","align":"center"}},{"type":"Animation","props":{"y":59,"x":60,"width":1,"var":"light","source":"res/gameScene/光01.png,res/gameScene/光02.png,res/gameScene/光03.png,res/gameScene/光04.png,res/gameScene/光05.png","rotation":-90,"pivotY":33,"pivotX":-30,"height":1}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}