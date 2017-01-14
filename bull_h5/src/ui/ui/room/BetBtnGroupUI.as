/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.BetBtnGroup;

	public class BetBtnGroupUI extends View {
		public var betBtn_cancel:Button;
		public var betBtn_same:Button;

		public static var uiView:Object ={"type":"View","props":{"width":320,"runtime":"bull.view.room.BetBtnGroup","height":80},"child":[{"type":"Image","props":{"y":-2,"x":-890,"skin":"res/gameScene/InfoBoard.png"}},{"type":"Button","props":{"y":6,"x":163,"var":"betBtn_cancel","skin":"res/gameScene/CancelBet.png","name":"betBtn_cancel"}},{"type":"Button","props":{"y":6,"x":2,"var":"betBtn_same","skin":"res/gameScene/SameBetBtn.png","name":"betBtn_same"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.BetBtnGroup",BetBtnGroup);
			super.createChildren();
			createView(uiView);
		}
	}
}