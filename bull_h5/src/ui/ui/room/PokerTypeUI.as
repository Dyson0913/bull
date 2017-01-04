/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.PokerEffectUI;

	public class PokerTypeUI extends View {
		public var pokerType_0:PokerEffectUI;
		public var pokerType_1:PokerEffectUI;
		public var pokerType_2:PokerEffectUI;
		public var pokerType_3:PokerEffectUI;
		public var pokerType_4:PokerEffectUI;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"PokerEffect","props":{"y":501,"x":81,"visible":false,"var":"pokerType_0","runtime":"ui.ui.room.PokerEffectUI"}},{"type":"PokerEffect","props":{"y":504,"x":368,"visible":false,"var":"pokerType_1","runtime":"ui.ui.room.PokerEffectUI"}},{"type":"PokerEffect","props":{"y":506,"x":651,"visible":false,"var":"pokerType_2","runtime":"ui.ui.room.PokerEffectUI"}},{"type":"PokerEffect","props":{"y":505,"x":904,"visible":false,"var":"pokerType_3","runtime":"ui.ui.room.PokerEffectUI"}},{"type":"PokerEffect","props":{"y":126,"x":467,"visible":false,"var":"pokerType_4","runtime":"ui.ui.room.PokerEffectUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.PokerEffectUI",PokerEffectUI);
			super.createChildren();
			createView(uiView);
		}
	}
}