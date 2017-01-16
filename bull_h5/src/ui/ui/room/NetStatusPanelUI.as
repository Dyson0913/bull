/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class NetStatusPanelUI extends View {
		public var Name:Label;
		public var tip_bg:Box;
		public var tip_board:Image;
		public var txt_Tip:Label;
		public var mcStatus:Box;
		public var State_0:Box;
		public var State_1:Box;
		public var State_2:Box;
		public var State_3:Image;

		public static var uiView:Object ={"type":"View","props":{"width":200,"height":100},"child":[{"type":"Label","props":{"y":0,"x":0,"width":50,"text":"网路:","height":22,"fontSize":20,"color":"#f8f0ef"}},{"type":"Label","props":{"y":0,"x":54,"width":45,"var":"Name","text":"流暢","height":26,"fontSize":20,"color":"#49c11b"}},{"type":"Box","props":{"y":29,"x":5,"var":"tip_bg"},"child":[{"type":"Image","props":{"y":0,"x":-5,"width":405,"var":"tip_board","skin":"res/gameScene/tips小底板.png","sizeGrid":"18,25,30,22","height":85}},{"type":"Label","props":{"y":12,"x":6,"width":384,"var":"txt_Tip","text":"当前延迟0.00ms, 网络状况普通","height":51,"fontSize":20,"color":"#f8f0ef","align":"center"}}]},{"type":"Box","props":{"y":2,"x":103,"var":"mcStatus"},"child":[{"type":"Box","props":{"y":1.7763568394002505e-15,"x":1.9999999999999858,"var":"State_0"},"child":[{"type":"Image","props":{"y":-7.105427357601002e-15,"x":-0.9999999999999716,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":-7.105427357601002e-15,"x":9.000000000000028,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":-7.105427357601002e-15,"x":19.00000000000003,"skin":"res/gameScene/网络状态条绿.png"}},{"type":"Image","props":{"y":-7.105427357601002e-15,"x":29.00000000000003,"skin":"res/gameScene/网络状态条绿.png"}}]},{"type":"Box","props":{"y":1.0000000000000027,"x":1.9999999999999858,"var":"State_1"},"child":[{"type":"Image","props":{"y":-1.021405182655144e-14,"x":-0.9999999999999432,"width":10,"skin":"res/gameScene/网络状态条黄.png","height":20}},{"type":"Image","props":{"y":-1.021405182655144e-14,"x":9.000000000000057,"skin":"res/gameScene/网络状态条黄.png"}},{"type":"Image","props":{"y":-1.021405182655144e-14,"x":19.000000000000057,"skin":"res/gameScene/网络状态条黄.png"}}]},{"type":"Box","props":{"y":1.0000000000000027,"x":1.9999999999999858,"var":"State_2"},"child":[{"type":"Image","props":{"y":-1.0000000000000102,"x":9.000000000000114,"skin":"res/gameScene/网络状态条橙.png"}},{"type":"Image","props":{"y":-1.0000000000000102,"x":-0.9999999999998863,"skin":"res/gameScene/网络状态条橙.png"}}]},{"type":"Image","props":{"y":1.7763568394002505e-15,"x":1,"var":"State_3","skin":"res/gameScene/网络状态条红.png"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}