/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Bet_TotalUI extends View {
		public var bg_ani:Animation;
		public var title:Label;
		public var amount:Label;
		public var light:Image;

		public static var uiView:Object ={"type":"View","props":{"width":200,"height":40},"child":[{"type":"Animation","props":{"y":3,"x":2,"var":"bg_ani","source":"res/gameScene/黑桃底条.png,res/gameScene/红心底条.png,res/gameScene/梅花底条.png,res/gameScene/方片底条.png"}},{"type":"Label","props":{"y":10,"x":11,"width":31,"var":"title","text":"总计:","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7"}},{"type":"Label","props":{"y":11,"x":67,"width":59,"var":"amount","text":"1","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7","align":"center"}},{"type":"Image","props":{"y":-16,"x":-39,"var":"light","skin":"res/share/Light.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}