/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetLImitUI extends View {
		public var Hint:Image;
		public var BetBar:Animation;
		public var Lost_amount:Label;

		public static var uiView:Object ={"type":"View","props":{"width":263,"height":55},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/限红底板.png"}},{"type":"Image","props":{"y":13,"x":100,"var":"Hint","skin":"res/gameScene/限红闪红.png"}},{"type":"Image","props":{"y":17,"x":12,"skin":"res/gameScene/本桌限红.png"}},{"type":"Animation","props":{"y":14,"x":101,"var":"BetBar","source":"res/gameScene/限红进度绿色.png,res/gameScene/限红进度红色.png"}},{"type":"Label","props":{"y":17,"x":101,"width":143,"var":"Lost_amount","text":"-¥1234.56","height":20,"font":"limitFont","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}