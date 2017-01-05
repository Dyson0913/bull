/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerEffectUI extends View {
		public var Type:Animation;
		public var multi:Image;
		public var odds:Label;

		public static var uiView:Object ={"type":"View","props":{"width":250,"visible":true,"height":100},"child":[{"type":"Animation","props":{"var":"Type","source":"res/gameScene/5小牛.png,res/gameScene/牛九.png"}},{"type":"Image","props":{"y":36,"x":137,"var":"multi","skin":"res/gameScene/乘号.png"}},{"type":"Label","props":{"y":25,"x":174,"width":79,"var":"odds","text":"10","height":60,"font":"settleWin","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}