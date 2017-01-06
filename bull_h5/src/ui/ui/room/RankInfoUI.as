/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class RankInfoUI extends View {
		public var Light:Image;
		public var Vip:Image;
		public var Level:Label;
		public var Name:Label;
		public var Money:Label;

		public static var uiView:Object ={"type":"View","props":{"width":450,"height":50},"child":[{"type":"Image","props":{"y":2,"x":285,"var":"Light","skin":"res/share/Light.png"}},{"type":"Animation","props":{"y":13,"x":14,"source":"res/gameScene/数字No1.png,res/gameScene/数字No2.png,res/gameScene/数字No3.png"}},{"type":"Image","props":{"y":14,"x":43,"var":"Vip","skin":"res/gameScene/VIP底板.png"},"child":[{"type":"Image","props":{"y":1,"x":3,"skin":"res/gameScene/VIP.png"}},{"type":"Label","props":{"y":2,"x":30,"width":36,"var":"Level","text":"10","height":19,"font":"vipfont","align":"center"}}]},{"type":"Label","props":{"y":10,"x":116,"width":93,"var":"Name","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef","align":"center"}},{"type":"Label","props":{"y":12,"x":324,"width":84,"var":"Money","text":"+999999999","scaleY":1.5,"scaleX":1.5,"height":19,"color":"#c2d722","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}