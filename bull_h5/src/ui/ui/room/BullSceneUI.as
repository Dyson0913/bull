/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.XiaZhuangPanel;
	import bull.view.room.bankerBoard;
	import bull.view.room.Poker;
	import bull.view.room.BetTimePanel;
	import bull.view.room.PokerTypeBoard;
	import bull.view.room.RecordPanel;
	import bull.view.room.WinLostEffect;
	import bull.view.room.BetAreaView;
	import bull.view.room.NetConnectView;
	import bull.view.room.BetBtnGroup;
	import bull.view.room.HeadView;
	import bull.view.room.SelectClipView;
	import bull.view.room.PlayerListPanel;
	import bull.view.room.ResultPanel;

	public class BullSceneUI extends View {
		public var btnBg:Image;
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var PlayerListBtn:Button;
		public var CarryInBtn:Button;
		public var bankerResultPanel:XiaZhuangPanel;
		public var viewArea:BetAreaView;
		public var viewPoker:Poker;
		public var viewBetTime:BetTimePanel;
		public var PokerTypePanel:PokerTypeBoard;
		public var viewRecord:RecordPanel;
		public var ViewWinLostEffect:WinLostEffect;
		public var viewResult:ResultPanel;
		public var viewNetConnect:NetConnectView;
		public var ViewBetGroup:BetBtnGroup;
		public var viewHead:HeadView;
		public var Hint:Label;
		public var viewSelectClip:SelectClipView;
		public var ViewPlayerList:PlayerListPanel;
		public var viewBankerPanel:bankerBoard;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/bg.jpg"}},{"type":"Image","props":{"y":40,"x":1344,"width":71,"var":"btnBg","skin":"res/share/btn_bg.png","height":315,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":-1,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Button","props":{"y":1,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":84,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":149,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Button","props":{"y":281,"x":1345,"var":"PlayerListBtn","skin":"res/gameScene/PlayerListBtn.png"}},{"type":"Button","props":{"y":216,"x":1344,"var":"CarryInBtn","skin":"res/gameScene/CarryInBtn.png"}},{"type":"BankerSettle","props":{"y":161,"x":274,"visible":false,"var":"bankerResultPanel","runtime":"bull.view.room.XiaZhuangPanel"}},{"type":"BetAreaView","props":{"y":237,"x":223,"visible":false,"var":"viewArea","runtime":"bull.view.room.BetAreaView"}},{"type":"Poker","props":{"y":0,"x":0,"visible":false,"var":"viewPoker","runtime":"bull.view.room.Poker"}},{"type":"BetTimePanel","props":{"y":474,"x":645,"visible":false,"var":"viewBetTime","runtime":"bull.view.room.BetTimePanel"}},{"type":"PokerType","props":{"y":0,"x":0,"visible":true,"var":"PokerTypePanel","runtime":"bull.view.room.PokerTypeBoard"}},{"type":"RecordPanel","props":{"y":87,"x":-173,"var":"viewRecord","runtime":"bull.view.room.RecordPanel"}},{"type":"WinLostEffect","props":{"y":0,"x":0,"var":"ViewWinLostEffect","runtime":"bull.view.room.WinLostEffect"}},{"type":"ResultPanel","props":{"y":170,"x":357,"visible":false,"var":"viewResult","runtime":"bull.view.room.ResultPanel"}},{"type":"NetConnectView","props":{"y":0,"x":0,"visible":false,"var":"viewNetConnect","runtime":"bull.view.room.NetConnectView"}},{"type":"BetBtnGroup","props":{"y":805,"x":987.0000000000002,"var":"ViewBetGroup","runtime":"bull.view.room.BetBtnGroup"}},{"type":"HeadView","props":{"y":816,"x":117,"var":"viewHead","runtime":"bull.view.room.HeadView"},"child":[{"type":"Label","props":{"y":14.000000000000114,"x":873.0000000000002,"width":322,"var":"Hint","height":29,"fontSize":22,"color":"#f8f0ef","align":"center"}}]},{"type":"SelectClipView","props":{"y":803,"x":426,"var":"viewSelectClip","runtime":"bull.view.room.SelectClipView"}},{"type":"PlayerList","props":{"y":2.000000000000016,"x":1132,"visible":false,"var":"ViewPlayerList","runtime":"bull.view.room.PlayerListPanel"}},{"type":"BankerPanel","props":{"y":-81,"x":347,"var":"viewBankerPanel","runtime":"bull.view.room.bankerBoard"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.XiaZhuangPanel",XiaZhuangPanel);
			View.regComponent("bull.view.room.bankerBoard",bankerBoard);
			View.regComponent("bull.view.room.Poker",Poker);
			View.regComponent("bull.view.room.BetTimePanel",BetTimePanel);
			View.regComponent("bull.view.room.PokerTypeBoard",PokerTypeBoard);
			View.regComponent("bull.view.room.RecordPanel",RecordPanel);
			View.regComponent("bull.view.room.WinLostEffect",WinLostEffect);
			View.regComponent("bull.view.room.BetAreaView",BetAreaView);
			View.regComponent("bull.view.room.NetConnectView",NetConnectView);
			View.regComponent("bull.view.room.BetBtnGroup",BetBtnGroup);
			View.regComponent("bull.view.room.HeadView",HeadView);
			View.regComponent("bull.view.room.SelectClipView",SelectClipView);
			View.regComponent("bull.view.room.PlayerListPanel",PlayerListPanel);
			View.regComponent("bull.view.room.ResultPanel",ResultPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}