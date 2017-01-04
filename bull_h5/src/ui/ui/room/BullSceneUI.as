/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.HistoryRecord;
	import bull.view.room.PokerTypeBoard;
	import bull.view.room.bankerBoard;
	import ui.ui.room.UserPanelUI;
	import bull.view.room.Settle;
	import bull.view.room.InfoBoard;
	import bull.view.room.BetZone;
	import bull.view.room.poker;
	import bull.view.room.Timer;
	import bull.view.room.CoinSelect;
	import ui.ui.room.BankerSettleUI;

	public class BullSceneUI extends View {
		public var btnBg:Image;
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var PlayerListBtn:Button;
		public var CarryInBtn:Button;
		public var HistoryBoard:HistoryRecord;
		public var InfoPanel:InfoBoard;
		public var bankerPanel:bankerBoard;
		public var UserBoard:UserPanelUI;
		public var SettleBoard:Settle;
		public var BankerSettleBoard:BankerSettleUI;
		public var BetZoneBoard:BetZone;
		public var PokerSet:poker;
		public var TimerPanel:Timer;
		public var BetChip:CoinSelect;
		public var PokerTypePanel:PokerTypeBoard;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/bg.jpg"}},{"type":"Image","props":{"y":40,"x":1344,"width":71,"var":"btnBg","skin":"res/share/btn_bg.png","height":315,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":-1,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Button","props":{"y":1,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":84,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":149,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Button","props":{"y":281,"x":1345,"var":"PlayerListBtn","skin":"res/gameScene/PlayerListBtn.png"}},{"type":"Button","props":{"y":216,"x":1344,"var":"CarryInBtn","skin":"res/gameScene/CarryInBtn.png"}},{"type":"HistoryRecord","props":{"y":87,"x":-173,"var":"HistoryBoard","runtime":"bull.view.room.HistoryRecord"}},{"type":"InfoBoard","props":{"y":800,"x":92,"var":"InfoPanel","runtime":"bull.view.room.InfoBoard"}},{"type":"BankerBoard","props":{"y":-81,"x":347,"var":"bankerPanel","runtime":"bull.view.room.bankerBoard"}},{"type":"UserPanel","props":{"y":2.000000000000016,"x":1132,"visible":false,"var":"UserBoard","runtime":"ui.ui.room.UserPanelUI"}},{"type":"Settle","props":{"y":170,"x":357,"visible":false,"var":"SettleBoard","runtime":"bull.view.room.Settle"}},{"type":"BankerSettle","props":{"y":161,"x":274,"visible":false,"var":"BankerSettleBoard","runtime":"ui.ui.room.BankerSettleUI"}},{"type":"BetZone","props":{"y":237,"x":223,"visible":false,"var":"BetZoneBoard","runtime":"bull.view.room.BetZone"}},{"type":"Poker","props":{"y":0,"x":0,"visible":false,"var":"PokerSet","runtime":"bull.view.room.poker"}},{"type":"Timer","props":{"y":474,"x":645,"visible":false,"var":"TimerPanel","runtime":"bull.view.room.Timer"}},{"type":"BetChip","props":{"y":802.9999999999999,"x":426.00000000000006,"var":"BetChip","runtime":"bull.view.room.CoinSelect"}},{"type":"PokerType","props":{"y":0,"x":0,"var":"PokerTypePanel","runtime":"bull.view.room.PokerTypeBoard"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.HistoryRecord",HistoryRecord);
			View.regComponent("bull.view.room.PokerTypeBoard",PokerTypeBoard);
			View.regComponent("bull.view.room.bankerBoard",bankerBoard);
			View.regComponent("ui.ui.room.UserPanelUI",UserPanelUI);
			View.regComponent("bull.view.room.Settle",Settle);
			View.regComponent("bull.view.room.InfoBoard",InfoBoard);
			View.regComponent("bull.view.room.BetZone",BetZone);
			View.regComponent("bull.view.room.poker",poker);
			View.regComponent("bull.view.room.Timer",Timer);
			View.regComponent("bull.view.room.CoinSelect",CoinSelect);
			View.regComponent("ui.ui.room.BankerSettleUI",BankerSettleUI);
			super.createChildren();
			createView(uiView);
		}
	}
}