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
		public var carry_tips:Image;

		public static var uiView:Object ={"type":"View","props":{"width":300,"height":100},"child":[{"type":"Image","props":{"y":-16,"x":-21,"skin":"res/gameScene/InfoBoard.png"}},{"type":"Button","props":{"y":33,"x":246,"var":"btnAdd","skin":"res/gameScene/CarryIn.png"}},{"type":"Label","props":{"y":6,"x":124,"width":149,"var":"txtName","text":"Name","height":28,"fontSize":20,"color":"#f8f0ef"}},{"type":"Label","props":{"y":39,"x":123,"width":119,"var":"txtMoney","text":"money","height":26,"fontSize":20,"color":"#f8f0ef"}},{"type":"Image","props":{"y":3,"x":1,"width":68,"var":"mcHead","skin":"res/gameScene/HeadIcon.jpg","height":67}},{"type":"Image","props":{"y":3,"x":11,"var":"mcVip","skin":"res/gameScene/miniVIP底板.png"},"child":[{"type":"Image","props":{"y":2.000000000000023,"x":1.999999999999993,"skin":"res/gameScene/miniV.png"}},{"type":"Label","props":{"y":2,"x":7,"width":32,"var":"bp_vip","text":"99","height":15,"font":"smallvip","align":"center"}}]},{"type":"Image","props":{"y":38,"x":89,"var":"mcMoneyIcon","skin":"res/gameScene/底板人民币.png"}},{"type":"Image","props":{"y":25,"x":283,"width":120,"visible":false,"var":"carry_tips","skin":"res/gameScene/tips小底板.png","height":64,"sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":12,"x":17,"width":91,"text":"补充资金","height":30,"fontSize":20,"color":"#e8dfdf","bold":true}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}