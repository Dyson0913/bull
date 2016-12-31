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
		public var btn_6:Button;
		public var btn_7:Button;
		public var btn_8:Button;
		public var btn_9:Button;
		public var btn_10:Button;
		public var btn_11:Button;
		public var btn_12:Button;
		public var btn_13:Button;
		public var btn_14:Button;

		public static var uiView:Object ={"type":"View","props":{"width":600,"height":200},"child":[{"type":"Button","props":{"y":0,"x":0,"width":80,"var":"btn_0","skin":"res/gameScene/CarryIn.png","name":"btn_0","label":"Start","height":66}},{"type":"Button","props":{"y":1,"x":74,"width":80,"var":"btn_1","skin":"res/gameScene/CarryIn.png","name":"btn_1","label":"Banker","height":66}},{"type":"Button","props":{"y":0,"x":146,"width":80,"var":"btn_2","skin":"res/gameScene/CarryIn.png","name":"btn_2","label":"Bet","height":66}},{"type":"Button","props":{"y":0,"x":214,"width":80,"var":"btn_3","skin":"res/gameScene/CarryIn.png","name":"btn_3","label":"BetCheck","height":66}},{"type":"Button","props":{"y":-2,"x":292,"width":80,"var":"btn_4","skin":"res/gameScene/CarryIn.png","name":"btn_4","label":"Deal","height":66}},{"type":"Button","props":{"y":0,"x":363,"width":80,"var":"btn_5","skin":"res/gameScene/CarryIn.png","name":"btn_5","label":"End","height":66}},{"type":"Button","props":{"y":60,"x":2,"width":80,"var":"btn_6","skin":"res/gameScene/CarryIn.png","name":"btn_6","label":"hisotryNotify","height":66}},{"type":"Button","props":{"y":61,"x":76,"width":80,"var":"btn_7","skin":"res/gameScene/CarryIn.png","name":"btn_7","label":"AlluserNotify","height":66}},{"type":"Button","props":{"y":60,"x":158,"width":80,"var":"btn_8","skin":"res/gameScene/CarryIn.png","name":"btn_8","label":"OneuserNotify","height":66}},{"type":"Button","props":{"y":58,"x":241,"width":80,"var":"btn_9","skin":"res/gameScene/CarryIn.png","name":"btn_9","label":"BetNotify","height":66}},{"type":"Button","props":{"y":60,"x":320,"width":80,"var":"btn_10","skin":"res/gameScene/CarryIn.png","name":"btn_10","label":"cardnotify","height":66}},{"type":"Button","props":{"y":59,"x":402,"width":80,"var":"btn_11","skin":"res/gameScene/CarryIn.png","name":"btn_11","label":"Calulatnotify","height":66}},{"type":"Button","props":{"y":132,"x":11,"width":80,"var":"btn_12","skin":"res/gameScene/CarryIn.png","name":"btn_12","label":"BankerListNotify","height":66}},{"type":"Button","props":{"y":131,"x":102,"width":80,"var":"btn_13","skin":"res/gameScene/CarryIn.png","name":"btn_13","label":"BankerNotify","height":66}},{"type":"Button","props":{"y":129,"x":197,"width":80,"var":"btn_14","skin":"res/gameScene/CarryIn.png","name":"btn_14","label":"Banker_caludat_Notify","height":66}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}