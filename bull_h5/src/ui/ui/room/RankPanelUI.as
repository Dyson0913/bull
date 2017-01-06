/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.RankInfoUI;

	public class RankPanelUI extends View {
		public var rank_info_0:RankInfoUI;
		public var rank_info_1:RankInfoUI;
		public var rank_info_2:RankInfoUI;

		public static var uiView:Object ={"type":"View","props":{"width":460,"height":160},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/前三名.png"}},{"type":"RankInfo","props":{"y":7,"x":5,"var":"rank_info_0","runtime":"ui.ui.room.RankInfoUI"}},{"type":"RankInfo","props":{"y":57,"x":6,"var":"rank_info_1","runtime":"ui.ui.room.RankInfoUI"}},{"type":"RankInfo","props":{"y":104,"x":6,"var":"rank_info_2","runtime":"ui.ui.room.RankInfoUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.RankInfoUI",RankInfoUI);
			super.createChildren();
			createView(uiView);
		}
	}
}