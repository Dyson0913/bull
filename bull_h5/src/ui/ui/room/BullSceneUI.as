/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.HistoryRecord;
	import ui.ui.room.InfoBoardUI;
	import ui.ui.room.BankerBoardUI;
	import ui.ui.room.BetChipUI;
	import bull.view.room.TestBoard;

	public class BullSceneUI extends View {
		public var btnBg:Image;
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var PlayerListBtn:Button;
		public var CarryInBtn:Button;
		public var HistoryBoard:HistoryRecord;
		public var InfoBoard:InfoBoardUI;
		public var bankerBoard:BankerBoardUI;
		public var BetChip:BetChipUI;
		public var TestPanel:TestBoard;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/bg.jpg"}},{"type":"Image","props":{"y":40,"x":1344,"width":71,"var":"btnBg","skin":"res/share/btn_bg.png","height":315,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":-1,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Button","props":{"y":1,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":84,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":149,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Button","props":{"y":281,"x":1345,"var":"PlayerListBtn","skin":"res/gameScene/PlayerListBtn.png"}},{"type":"Button","props":{"y":216,"x":1344,"var":"CarryInBtn","skin":"res/gameScene/CarryInBtn.png"}},{"type":"HistoryRecord","props":{"y":87,"x":-173,"var":"HistoryBoard","runtime":"bull.view.room.HistoryRecord"}},{"type":"InfoBoard","props":{"y":800,"x":92,"var":"InfoBoard","runtime":"ui.ui.room.InfoBoardUI"}},{"type":"BankerBoard","props":{"y":-81,"x":347,"var":"bankerBoard","runtime":"ui.ui.room.BankerBoardUI"}},{"type":"BetChip","props":{"y":803,"x":426,"var":"BetChip","runtime":"ui.ui.room.BetChipUI"}},{"type":"Test","props":{"y":533,"x":3,"var":"TestPanel","runtime":"bull.view.room.TestBoard"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.HistoryRecord",HistoryRecord);
			View.regComponent("ui.ui.room.InfoBoardUI",InfoBoardUI);
			View.regComponent("ui.ui.room.BankerBoardUI",BankerBoardUI);
			View.regComponent("ui.ui.room.BetChipUI",BetChipUI);
			View.regComponent("bull.view.room.TestBoard",TestBoard);
			super.createChildren();
			createView(uiView);
		}
	}
}