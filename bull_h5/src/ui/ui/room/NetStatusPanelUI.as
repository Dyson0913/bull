/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class NetStatusPanelUI extends View {
		public var Name:Label;
		public var tip_bg:Box;
		public var txt_Tip:Label;
		public var mcStatus:Box;
		public var State_0:Sprite;
		public var State_1:Sprite;
		public var State_2:Sprite;
		public var State_3:Sprite;

		public static var uiView:Object ={"type":"View","props":{"width":200,"height":100},"child":[{"type":"Label","props":{"y":0,"x":0,"width":50,"text":"网路:","height":22,"fontSize":20,"color":"#f8f0ef"}},{"type":"Label","props":{"y":0,"x":54,"width":32,"var":"Name","text":"流暢","height":15,"fontSize":20,"color":"#49c11b"}},{"type":"Box","props":{"y":29,"x":5,"var":"tip_bg"},"child":[{"type":"Image","props":{"y":0,"x":-5,"width":256,"skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22","height":78}},{"type":"Label","props":{"y":18,"x":11,"width":226,"var":"txt_Tip","text":"网路:","height":31,"fontSize":20,"color":"#f8f0ef","align":"center"}}]},{"type":"Box","props":{"y":2,"x":112,"var":"mcStatus"},"child":[{"type":"Sprite","props":{"var":"State_0"},"child":[{"type":"Image","props":{"y":0.9999999999999903,"x":32.99999999999992,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":21.99999999999995,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":10.999999999999975,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":0.9999999999999903,"x":0.9999999999999903,"skin":"res/gameScene/网络状态条绿.png"}}]},{"type":"Sprite","props":{"y":1,"x":1,"visible":false,"var":"State_1"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条黄.png"}},{"type":"Image","props":{"y":0,"x":11,"skin":"res/gameScene/网络状态条黄.png"}},{"type":"Image","props":{"y":0,"x":22,"skin":"res/gameScene/网络状态条黄.png"}}]},{"type":"Sprite","props":{"y":1,"x":1,"visible":false,"var":"State_2"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条橙.png"}},{"type":"Image","props":{"y":0,"x":11,"skin":"res/gameScene/网络状态条橙.png"}}]},{"type":"Sprite","props":{"y":2,"x":2,"visible":false,"var":"State_3"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/网络状态条红.png"}}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}