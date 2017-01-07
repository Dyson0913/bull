/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.BankerNotify_aniUI;
	import ui.ui.room.BankerListHintUI;

	public class BankerBoardUI extends View {
		public var txtname:Label;
		public var BankerTimes:Label;
		public var btndeBanker:Button;
		public var btnBanker:Button;
		public var Point:Label;
		public var Banker_ani:BankerNotify_aniUI;
		public var Head:Image;
		public var mcHintBoard:BankerListHintUI;

		public static var uiView:Object ={"type":"View","props":{"width":723,"renderType":"mask","height":87},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/BankerBoard.png"}},{"type":"Label","props":{"y":34,"x":120,"width":50,"var":"txtname","text":"吉胜游戏平台","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}},{"type":"Label","props":{"y":34,"x":427,"width":56,"var":"BankerTimes","text":"1/15次","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}},{"type":"Button","props":{"y":9,"x":527,"var":"btndeBanker","stateNum":"3","skin":"res/gameScene/deBanker.png"}},{"type":"Button","props":{"y":8,"x":527,"var":"btnBanker","stateNum":"3","skin":"res/gameScene/applyBanker.png"}},{"type":"Label","props":{"y":35,"x":277,"width":56,"var":"Point","text":"999999","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eee7e7"}},{"type":"BankerNotify_ani","props":{"y":5,"x":563,"visible":false,"var":"Banker_ani","scaleY":0.3,"scaleX":0.3,"runtime":"ui.ui.room.BankerNotify_aniUI"}},{"type":"Image","props":{"y":11,"x":44,"width":60,"var":"Head","skin":"res/gameScene/HeadIcon.jpg","height":60},"child":[{"type":"Sprite","props":{"y":-2,"x":-6,"renderType":"mask"},"child":[{"type":"Circle","props":{"y":33,"x":37,"radius":30,"lineWidth":1,"fillColor":"#ff0000"}}]}]},{"type":"BankerListHint","props":{"y":84,"x":473,"var":"mcHintBoard","runtime":"ui.ui.room.BankerListHintUI"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.BankerNotify_aniUI",BankerNotify_aniUI);
			View.regComponent("ui.ui.room.BankerListHintUI",BankerListHintUI);
			super.createChildren();
			createView(uiView);
		}
	}
}