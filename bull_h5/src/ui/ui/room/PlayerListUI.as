/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.PlayerListRender;

	public class PlayerListUI extends View {
		public var total_txt:Label;
		public var list:List;
		public var bg:Animation;
		public var light:Image;
		public var Head:Image;
		public var Vip:Image;
		public var Level:Label;
		public var Name:Label;
		public var Money:Label;
		public var clostBtn:Button;

		public static var uiView:Object ={"type":"View","props":{"width":288,"height":670},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/桌内玩家列表底板.png"}},{"type":"Label","props":{"y":646,"x":129,"var":"total_txt","text":"1/10","scaleY":1.5,"scaleX":1.5,"color":"#eee3e2"}},{"type":"List","props":{"y":36,"x":12,"width":266,"var":"list","height":610},"child":[{"type":"Box","props":{"y":-1,"x":1,"runtime":"bull.view.room.PlayerListRender","name":"render"},"child":[{"type":"Animation","props":{"y":1,"x":-2,"visible":true,"var":"bg","source":"res/gameScene/玩家信息底板.png,res/gameScene/玩家信息底板02.png","name":"bg"}},{"type":"Image","props":{"y":4,"x":207,"visible":true,"var":"light","skin":"res/share/Light.png","name":"light"}},{"type":"Image","props":{"y":3,"x":-1,"width":45,"visible":true,"var":"Head","skin":"res/gameScene/HeadIcon.jpg","name":"Head","height":45}},{"type":"Image","props":{"y":6,"x":46,"visible":true,"var":"Vip","skin":"res/gameScene/miniVIP底板.png","name":"Vip"},"child":[{"type":"Image","props":{"y":2.000000000000023,"x":1.999999999999993,"visible":true,"skin":"res/gameScene/miniV.png"}},{"type":"Label","props":{"y":2,"x":7,"width":32,"var":"Level","text":"99","height":15,"font":"smallvip","align":"center"}}]},{"type":"Label","props":{"y":7,"x":49,"width":155,"visible":true,"var":"Name","text":"天涯歌女爱与仇","name":"Name","height":21,"fontSize":18,"color":"#f8f0ef","align":"left"}},{"type":"Label","props":{"y":30,"x":46,"width":95,"visible":true,"var":"Money","text":"+999999999","name":"Money","height":19,"fontSize":15,"color":"#f3ebea","align":"left"}}]},{"type":"VScrollBar","props":{"y":0,"x":248,"width":17,"skin":"res/gameScene/vscroll.png","name":"scrollBar","height":610}}]},{"type":"Button","props":{"y":-3,"x":250,"var":"clostBtn","skin":"res/gameScene/PlayerListCloseBtn.png"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.PlayerListRender",PlayerListRender);
			super.createChildren();
			createView(uiView);
		}
	}
}