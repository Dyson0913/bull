/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class HeadViewUI extends View {
		public var btnAdd:Button;
		public var txtName:Label;
		public var txtMoney:Label;
		public var mcHead:Image;
		public var mcVip:Image;
		public var bp_vip:Label;
		public var mcMoneyIcon:Image;

		public static var uiView:Object ={"type":"View","props":{"width":300,"height":100},"child":[{"type":"Image","props":{"y":-16,"x":-21,"skin":"res/gameScene/InfoBoard.png"}},{"type":"Button","props":{"y":33,"x":246,"var":"btnAdd","skin":"res/gameScene/CarryIn.png"}},{"type":"Label","props":{"y":8,"x":124,"width":102,"var":"txtName","text":"Name","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#f8f0ef"}},{"type":"Label","props":{"y":40,"x":123,"width":83,"var":"txtMoney","text":"money","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#f8f0ef"}},{"type":"Image","props":{"y":3,"x":1,"width":68,"var":"mcHead","skin":"res/gameScene/HeadIcon.jpg","height":67}},{"type":"Image","props":{"y":3,"x":11,"var":"mcVip","skin":"res/gameScene/miniVIP底板.png"},"child":[{"type":"Image","props":{"y":2.000000000000023,"x":1.999999999999993,"skin":"res/gameScene/miniV.png"}},{"type":"Label","props":{"y":2,"x":7,"width":32,"var":"bp_vip","text":"99","height":15,"font":"smallvip","align":"center"}}]},{"type":"Image","props":{"y":41,"x":86,"var":"mcMoneyIcon","skin":"res/gameScene/底板人民币.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}