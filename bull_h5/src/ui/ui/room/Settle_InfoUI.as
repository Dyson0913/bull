/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class Settle_InfoUI extends View {
		public var Rank:Animation;
		public var Light:Image;
		public var Head:Image;

		public static var uiView:Object ={"type":"View","props":{"width":470,"height":50},"child":[{"type":"Animation","props":{"y":-3,"x":6,"var":"Rank","source":"res/gameScene/NO.1.png,res/gameScene/NO.2.png,res/gameScene/NO.3.png"}},{"type":"Image","props":{"y":4,"x":53,"var":"Light","skin":"res/share/明灯.png"}},{"type":"Image","props":{"y":6,"x":108,"var":"Head","skin":"res/gameScene/结算玩家头像.png"}},{"type":"Label","props":{"y":13,"x":160,"width":93,"text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":14,"x":323,"width":80,"text":"+999999999","scaleY":1.8,"scaleX":1.8,"height":19,"color":"#c09528","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}