/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.BankerNotify_aniUI;
	import ui.ui.room.BankerListHintUI;

	public class BankerPanelUI extends View {
		public var txtname:Label;
		public var BankerTimes:Label;
		public var btndeBanker:Button;
		public var btnBanker:Button;
		public var Point:Label;
		public var mc_bankerAni:BankerNotify_aniUI;
		public var Head:Image;
		public var mcHintBoard:BankerListHintUI;
		public var textFix_text_0:Label;

		public static var uiView:Object ={"type":"View","props":{"width":723,"renderType":"mask","height":87},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/BankerBoard.png"}},{"type":"Label","props":{"y":34,"x":120,"width":125,"var":"txtname","text":"吉胜游戏平台","height":32,"fontSize":20,"color":"#eee7e7"}},{"type":"Label","props":{"y":34,"x":433,"width":68,"var":"BankerTimes","text":"1/15次","height":24,"fontSize":20,"color":"#eee7e7","align":"center"}},{"type":"Button","props":{"y":9,"x":527,"var":"btndeBanker","stateNum":"3","skin":"res/gameScene/deBanker.png","name":"btndeBanker"}},{"type":"Button","props":{"y":8,"x":527,"var":"btnBanker","stateNum":"3","skin":"res/gameScene/applyBanker.png","name":"btnBanker"}},{"type":"Label","props":{"y":35,"x":277,"width":56,"var":"Point","text":"999999","height":18,"fontSize":20,"color":"#eee7e7"}},{"type":"BankerNotify_ani","props":{"y":5,"x":563,"visible":false,"var":"mc_bankerAni","scaleY":0.3,"scaleX":0.3,"runtime":"ui.ui.room.BankerNotify_aniUI"}},{"type":"Image","props":{"y":11,"x":44,"width":60,"var":"Head","skin":"res/gameScene/HeadIcon.jpg","height":60},"child":[{"type":"Sprite","props":{"y":-2,"x":-6,"renderType":"mask"},"child":[{"type":"Circle","props":{"y":33,"x":37,"radius":30,"lineWidth":1,"fillColor":"#ff0000"}}]}]},{"type":"BankerListHint","props":{"y":84,"x":473,"var":"mcHintBoard","runtime":"ui.ui.room.BankerListHintUI"}},{"type":"Label","props":{"y":34,"x":375,"width":48,"var":"textFix_text_0","text":"坐庄:","height":21,"fontSize":20,"color":"#98d10c"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.BankerNotify_aniUI",BankerNotify_aniUI);
			View.regComponent("ui.ui.room.BankerListHintUI",BankerListHintUI);
			super.createChildren();
			createView(uiView);
		}
	}
}