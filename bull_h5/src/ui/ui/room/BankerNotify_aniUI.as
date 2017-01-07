/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BankerNotify_aniUI extends View {
		public var Name:Label;

		public static var uiView:Object ={"type":"View","props":{"width":318,"height":260},"child":[{"type":"Image","props":{"y":71,"x":82,"skin":"res/gameScene/轮庄提示大头像.png"}},{"type":"Image","props":{"y":231,"x":88,"skin":"res/gameScene/轮庄大头像名字底板.png"}},{"type":"Image","props":{"y":5,"x":0,"skin":"res/gameScene/轮庄提示彩带.png"}},{"type":"Label","props":{"y":233,"x":91,"width":146,"var":"Name","height":21,"fontSize":18,"color":"#f6eeee","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}