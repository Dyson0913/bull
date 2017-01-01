/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Bet_TotalUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":200,"height":40},"child":[{"type":"Animation","props":{"y":3,"x":2,"source":"res/gameScene/黑桃底条.png,res/gameScene/红心底条.png,res/gameScene/梅花底条.png,res/gameScene/方片底条.png"}},{"type":"Label","props":{"y":6,"x":11,"width":31,"text":"总计:","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7"}},{"type":"Label","props":{"y":6,"x":71,"width":59,"text":"100000","scaleY":2,"scaleX":2,"height":18,"color":"#ece7e7","align":"center"}},{"type":"Image","props":{"y":-16,"x":-39,"skin":"res/share/明灯.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}