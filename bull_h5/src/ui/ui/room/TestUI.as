/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class TestUI extends View {
		public var btn_0:Button;
		public var btn_1:Button;
		public var btn_2:Button;
		public var btn_3:Button;
		public var btn_4:Button;
		public var btn_5:Button;

		public static var uiView:Object ={"type":"View","props":{"width":600,"height":80},"child":[{"type":"Button","props":{"y":0,"x":0,"width":80,"var":"btn_0","skin":"res/gameScene/CarryIn.png","name":"btn_0","label":"Start","height":66}},{"type":"Button","props":{"y":1,"x":74,"width":80,"var":"btn_1","skin":"res/gameScene/CarryIn.png","name":"btn_1","label":"Banker","height":66}},{"type":"Button","props":{"y":0,"x":146,"width":80,"var":"btn_2","skin":"res/gameScene/CarryIn.png","name":"btn_2","label":"Bet","height":66}},{"type":"Button","props":{"y":0,"x":214,"width":80,"var":"btn_3","skin":"res/gameScene/CarryIn.png","name":"btn_3","label":"BetCheck","height":66}},{"type":"Button","props":{"y":-2,"x":292,"width":80,"var":"btn_4","skin":"res/gameScene/CarryIn.png","name":"btn_4","label":"Deal","height":66}},{"type":"Button","props":{"y":0,"x":363,"width":80,"var":"btn_5","skin":"res/gameScene/CarryIn.png","name":"btn_5","label":"End","height":66}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}