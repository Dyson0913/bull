/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BankerBoardUI extends View {
		public var Title:Label;
		public var BankerTimes:Label;
		public var deapply:Button;
		public var apply:Button;
		public var Money:Label;

		public static var uiView:Object ={"type":"View","props":{"width":723,"height":87},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/BankerBoard.png"}},{"type":"Label","props":{"y":34,"x":120,"width":50,"var":"Title","text":"吉胜游戏平台","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}},{"type":"Label","props":{"y":34,"x":427,"width":56,"var":"BankerTimes","text":"1/15次","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}},{"type":"Button","props":{"y":9,"x":527,"var":"deapply","stateNum":"3","skin":"res/gameScene/deBanker.png"}},{"type":"Button","props":{"y":8,"x":527,"var":"apply","stateNum":"3","skin":"res/gameScene/applyBanker.png"}},{"type":"Label","props":{"y":35,"x":277,"width":56,"var":"Money","text":"999999","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}