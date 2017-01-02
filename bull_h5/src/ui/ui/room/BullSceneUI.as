/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.HistoryRecord;
	import ui.ui.room.InfoBoardUI;
	import ui.ui.room.BankerBoardUI;
	import ui.ui.room.BetChipUI;
	import ui.ui.room.UserPanelUI;
	import ui.ui.room.SettleUI;
	import ui.ui.room.BankerSettleUI;
	import ui.ui.room.BetZoneUI;
	import bull.view.room.poker;
	import bull.view.room.Timer;

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
		public var UserBoard:UserPanelUI;
		public var SellteBoard:SettleUI;
		public var BankerSettleBoard:BankerSettleUI;
		public var BetZoneBoard:BetZoneUI;
		public var PokerSet:poker;
		public var TimerPanel:Timer;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/bg.jpg"}},{"type":"Image","props":{"y":40,"x":1344,"width":71,"var":"btnBg","skin":"res/share/btn_bg.png","height":315,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":-1,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Button","props":{"y":1,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":84,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":149,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Button","props":{"y":281,"x":1345,"var":"PlayerListBtn","skin":"res/gameScene/PlayerListBtn.png"}},{"type":"Button","props":{"y":216,"x":1344,"var":"CarryInBtn","skin":"res/gameScene/CarryInBtn.png"}},{"type":"HistoryRecord","props":{"y":87,"x":-173,"var":"HistoryBoard","runtime":"bull.view.room.HistoryRecord"}},{"type":"InfoBoard","props":{"y":800,"x":92,"var":"InfoBoard","runtime":"ui.ui.room.InfoBoardUI"}},{"type":"BankerBoard","props":{"y":-81,"x":347,"var":"bankerBoard","runtime":"ui.ui.room.BankerBoardUI"}},{"type":"BetChip","props":{"y":803,"x":426,"var":"BetChip","runtime":"ui.ui.room.BetChipUI"}},{"type":"UserPanel","props":{"y":2.000000000000016,"x":1132,"visible":false,"var":"UserBoard","runtime":"ui.ui.room.UserPanelUI"}},{"type":"Settle","props":{"y":170,"x":357,"visible":false,"var":"SellteBoard","runtime":"ui.ui.room.SettleUI"}},{"type":"BankerSettle","props":{"y":161,"x":274,"visible":false,"var":"BankerSettleBoard","runtime":"ui.ui.room.BankerSettleUI"}},{"type":"BetZone","props":{"y":237,"x":223,"visible":false,"var":"BetZoneBoard","runtime":"ui.ui.room.BetZoneUI"}},{"type":"Poker","props":{"y":0,"x":0,"visible":false,"var":"PokerSet","runtime":"bull.view.room.poker"}},{"type":"Timer","props":{"y":474,"x":645,"visible":false,"var":"TimerPanel","runtime":"bull.view.room.Timer"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.HistoryRecord",HistoryRecord);
			View.regComponent("ui.ui.room.InfoBoardUI",InfoBoardUI);
			View.regComponent("ui.ui.room.BankerBoardUI",BankerBoardUI);
			View.regComponent("ui.ui.room.BetChipUI",BetChipUI);
			View.regComponent("ui.ui.room.UserPanelUI",UserPanelUI);
			View.regComponent("ui.ui.room.SettleUI",SettleUI);
			View.regComponent("ui.ui.room.BankerSettleUI",BankerSettleUI);
			View.regComponent("ui.ui.room.BetZoneUI",BetZoneUI);
			View.regComponent("bull.view.room.poker",poker);
			View.regComponent("bull.view.room.Timer",Timer);
			super.createChildren();
			createView(uiView);
		}
	}
}