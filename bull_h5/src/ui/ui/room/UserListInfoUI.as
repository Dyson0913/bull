/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class UserListInfoUI extends View {
		public var Head:Image;
		public var Vip:Image;
		public var Level:Label;
		public var Name:Label;
		public var Money:Label;

		public static var uiView:Object ={"type":"View","props":{"width":267,"height":50},"child":[{"type":"Animation","props":{"source":"res/gameScene/玩家信息底板.png,res/gameScene/玩家信息底板02.png"}},{"type":"Image","props":{"y":3,"x":209,"skin":"res/share/Light.png"}},{"type":"Image","props":{"y":2,"x":1,"width":45,"var":"Head","skin":"res/gameScene/HeadIcon.jpg","height":45}},{"type":"Image","props":{"y":5,"x":48,"var":"Vip","skin":"res/gameScene/miniVIP底板.png"},"child":[{"type":"Image","props":{"y":2.000000000000023,"x":1.999999999999993,"skin":"res/gameScene/miniV.png"}},{"type":"Label","props":{"y":2,"x":7,"width":32,"var":"Level","text":"99","height":15,"font":"smallvip","align":"center"}}]},{"type":"Label","props":{"y":6,"x":85,"width":117,"var":"Name","text":"天涯歌女爱与仇","height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":27,"x":46,"width":80,"var":"Money","text":"+999999999","height":19,"color":"#e0e814","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}