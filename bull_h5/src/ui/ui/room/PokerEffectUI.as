/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerEffectUI extends View {
		public var shine:Image;
		public var Type:Animation;
		public var multi:Image;
		public var odds:Label;

		public static var uiView:Object ={"type":"View","props":{"width":300,"visible":true,"height":50},"child":[{"type":"Image","props":{"y":3,"x":4,"skin":"res/gameScene/底板.png"}},{"type":"Image","props":{"y":-89,"x":-23,"var":"shine","skin":"res/gameScene/闪光.png"}},{"type":"Animation","props":{"y":1,"x":39,"var":"Type","source":"res/gameScene/五牛.png,res/gameScene/牛一.png,res/gameScene/牛二.png,res/gameScene/牛三.png,res/gameScene/牛四.png,res/gameScene/牛五.png,res/gameScene/牛六.png,res/gameScene/牛七.png,res/gameScene/牛八.png,res/gameScene/牛九.png,res/gameScene/牛牛.png,res/gameScene/五花牛.png,res/gameScene/四炸.png,res/gameScene/五小牛.png"}},{"type":"Image","props":{"y":11,"x":164,"var":"multi","skin":"res/gameScene/乘号.png"}},{"type":"Label","props":{"y":0,"x":207,"width":79,"var":"odds","text":"10","height":60,"font":"settleWin","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}