/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class UserPanelUI extends View {
		public var Close:Button;

		public static var uiView:Object ={"type":"View","props":{"width":288,"height":670},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/桌内玩家列表底板.png"}},{"type":"Button","props":{"y":-3,"x":250,"var":"Close","skin":"res/gameScene/PlayerListCloseBtn.png"}},{"type":"Label","props":{"y":646,"x":129,"text":"1/10","scaleY":1.5,"scaleX":1.5,"color":"#eee3e2"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}