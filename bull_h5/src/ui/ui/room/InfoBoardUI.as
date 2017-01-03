/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class InfoBoardUI extends View {
		public var CarryIn:Button;
		public var Name:Label;
		public var Money:Label;
		public var Btn_CancelBet:Button;
		public var Btn_SameBet:Button;

		public static var uiView:Object ={"type":"View","props":{"width":1238,"height":104},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/InfoBoard.png"}},{"type":"Button","props":{"y":48,"x":267,"var":"CarryIn","skin":"res/gameScene/CarryIn.png"}},{"type":"Label","props":{"y":23,"x":145,"width":102,"var":"Name","text":"Name","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#f8f0ef"}},{"type":"Label","props":{"y":55,"x":144,"width":83,"var":"Money","text":"money","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#f8f0ef"}},{"type":"Button","props":{"y":9,"x":1056,"var":"Btn_CancelBet","skin":"res/gameScene/CancelBet.png","name":"Btn_CancelBet"}},{"type":"Button","props":{"y":9,"x":894,"var":"Btn_SameBet","skin":"res/gameScene/SameBetBtn.png","name":"Btn_SameBet"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}