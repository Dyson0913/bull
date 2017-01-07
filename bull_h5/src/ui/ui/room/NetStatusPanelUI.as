/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class NetStatusPanelUI extends View {
		public var State_0:Sprite;
		public var State_1:Sprite;
		public var State_2:Sprite;
		public var State_3:Sprite;
		public var Name:Label;
		public var Name:Label;

		public static var uiView:Object ={"type":"View","props":{"width":200,"height":100},"child":[{"type":"Sprite","props":{"y":2,"x":112,"var":"State_0"},"child":[{"type":"Image","props":{"y":0.9999999999999903,"x":32.99999999999992,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":21.99999999999995,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":10.999999999999975,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":0.9999999999999903,"skin":"res/gameScene/网络状态条绿.png"}}]},{"type":"Sprite","props":{"y":3,"x":113,"visible":false,"var":"State_1"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条黄.png"}},{"type":"Image","props":{"y":0,"x":11,"skin":"res/gameScene/网络状态条黄.png"}},{"type":"Image","props":{"y":0,"x":22,"skin":"res/gameScene/网络状态条黄.png"}}]},{"type":"Sprite","props":{"y":3,"x":113,"visible":false,"var":"State_2"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条橙.png"}},{"type":"Image","props":{"y":0,"x":11,"skin":"res/gameScene/网络状态条橙.png"}}]},{"type":"Sprite","props":{"y":4,"x":114,"visible":false,"var":"State_3"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条红.png"}}]},{"type":"Label","props":{"y":0,"x":0,"width":32,"var":"Name","text":"网路:","scaleY":1.8,"scaleX":1.8,"height":15,"color":"#f8f0ef"}},{"type":"Label","props":{"y":0,"x":54,"width":32,"var":"Name","text":"流暢","scaleY":1.8,"scaleX":1.8,"height":15,"color":"#49c11b"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}