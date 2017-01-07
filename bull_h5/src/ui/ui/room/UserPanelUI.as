/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.UserListInfoUI;

	public class UserPanelUI extends View {
		public var clostBtn:Button;
		public var total_txt:Label;

		public static var uiView:Object ={"type":"View","props":{"width":288,"height":670},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/桌内玩家列表底板.png"}},{"type":"Button","props":{"y":-3,"x":250,"var":"clostBtn","skin":"res/gameScene/PlayerListCloseBtn.png"}},{"type":"Label","props":{"y":646,"x":129,"var":"total_txt","text":"1/10","scaleY":1.5,"scaleX":1.5,"color":"#eee3e2"}},{"type":"List","props":{"y":34,"x":14,"width":266,"height":610},"child":[{"type":"Box","props":{"y":-9,"x":1,"name":"render"},"child":[{"type":"UserListInfo","props":{"y":2,"x":0,"runtime":"ui.ui.room.UserListInfoUI"}}]},{"type":"VScrollBar","props":{"y":0,"x":248,"skin":"comp/vscroll.png","name":"scrollBar"}}]}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.UserListInfoUI",UserListInfoUI);
			super.createChildren();
			createView(uiView);
		}
	}
}