/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.Settle_InfoUI;

	public class SettleUI extends View {
		public var Btn_close:Button;
		public var info_0:Settle_InfoUI;
		public var info_1:Settle_InfoUI;
		public var info_2:Settle_InfoUI;
		public var Btn_ok:Button;
		public var banker_Money:Label;
		public var BankerName:Image;
		public var Name:Label;
		public var Curren_Money:Label;
		public var Isbanker:Image;
		public var Win_amount:Label;
		public var Lost_amount:Label;

		public static var uiView:Object ={"type":"View","props":{"width":679,"height":416},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/结算中心底板.png"}},{"type":"Button","props":{"y":-1,"x":640,"var":"Btn_close","skin":"res/gameScene/closeBtn.png","name":"Btn_close"}},{"type":"Settle_Info","props":{"y":189,"x":196,"var":"info_0","runtime":"ui.ui.room.Settle_InfoUI"}},{"type":"Settle_Info","props":{"y":244,"x":196,"var":"info_1","runtime":"ui.ui.room.Settle_InfoUI"}},{"type":"Settle_Info","props":{"y":296,"x":195,"var":"info_2","runtime":"ui.ui.room.Settle_InfoUI"}},{"type":"Button","props":{"y":357,"x":265,"var":"Btn_ok","skin":"res/gameScene/Btn_bg.png","name":"Btn_ok"}},{"type":"Label","props":{"y":366,"x":308,"width":43,"text":"确  定","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":367,"x":415,"width":43,"text":"(倒计        后将关闭窗口)","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":365,"x":489,"width":11,"text":"S","scaleY":2.3,"scaleX":2.3,"mouseEnabled":false,"height":14,"color":"#e53829","bold":true}},{"type":"Label","props":{"y":362,"x":470,"width":10,"text":"8","scaleY":2.5,"scaleX":2.5,"mouseEnabled":false,"height":16,"color":"#e53829","bold":true}},{"type":"Label","props":{"y":324,"x":37,"width":83,"var":"banker_Money","text":"+9999999","scaleY":1.5,"scaleX":1.5,"mouseEnabled":false,"height":16,"color":"#9fb23c","bold":false,"align":"center"}},{"type":"Image","props":{"y":294,"x":41,"var":"BankerName","skin":"res/gameScene/吉胜游戏平台.png"}},{"type":"Label","props":{"y":86,"x":106,"width":93,"var":"Name","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":119,"x":126,"width":93,"var":"Curren_Money","text":"6666666","scaleY":1.8,"scaleX":1.8,"height":16,"color":"#f8f0ef","align":"left"}},{"type":"Image","props":{"y":60,"x":6,"var":"Isbanker","skin":"res/gameScene/庄家符号.png"}},{"type":"Label","props":{"y":87,"x":270,"width":389,"var":"Win_amount","text":"+¥1234.56","height":60,"font":"settleWin","align":"center"}},{"type":"Label","props":{"y":37,"x":274,"width":389,"var":"Lost_amount","text":"-¥1234.56","height":60,"font":"settlelost","align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.Settle_InfoUI",Settle_InfoUI);
			super.createChildren();
			createView(uiView);
		}
	}
}