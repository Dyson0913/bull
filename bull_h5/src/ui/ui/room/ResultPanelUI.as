/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class ResultPanelUI extends View {
		public var btnClose:Button;
		public var btnok:Button;
		public var rest_time:Label;
		public var banker_Money:Label;
		public var platform_name:Image;
		public var self_name:Label;
		public var self_money:Label;
		public var win_bitmap:Label;
		public var lost_bitmap:Label;
		public var mcHead:Image;
		public var isBanker:Image;
		public var Text_NoOne_bet:Label;
		public var Num_0:Animation;
		public var light_0:Image;
		public var headPic_0:Image;
		public var name_0:Label;
		public var Money_0:Label;
		public var Num_1:Animation;
		public var light_1:Image;
		public var headPic_1:Image;
		public var name_1:Label;
		public var Money_1:Label;
		public var Num_2:Animation;
		public var light_2:Image;
		public var headPic_2:Image;
		public var name_2:Label;
		public var Money_2:Label;

		public static var uiView:Object ={"type":"View","props":{"width":679,"height":416},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/结算中心底板.png"}},{"type":"Button","props":{"y":-1,"x":640,"var":"btnClose","skin":"res/gameScene/closeBtn.png","name":"btnClose"}},{"type":"Button","props":{"y":357,"x":265,"var":"btnok","skin":"res/gameScene/Btn_bg.png","name":"btnok"}},{"type":"Label","props":{"y":366,"x":308,"width":43,"text":"确  定","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":367,"x":415,"width":43,"text":"(倒计        后将关闭窗口)","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":365,"x":489,"width":11,"text":"S","scaleY":2.3,"scaleX":2.3,"mouseEnabled":false,"height":14,"color":"#e53829","bold":true}},{"type":"Label","props":{"y":362,"x":470,"width":10,"var":"rest_time","text":"8","scaleY":2.5,"scaleX":2.5,"mouseEnabled":false,"height":16,"color":"#e53829","bold":true}},{"type":"Label","props":{"y":324,"x":37,"width":83,"var":"banker_Money","text":"+9999999","scaleY":1.5,"scaleX":1.5,"mouseEnabled":false,"height":16,"color":"#9fb23c","bold":false,"align":"center"}},{"type":"Image","props":{"y":294,"x":41,"var":"platform_name","skin":"res/gameScene/吉胜游戏平台.png"}},{"type":"Label","props":{"y":86,"x":106,"width":93,"var":"self_name","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":119,"x":126,"width":93,"var":"self_money","text":"6666666","scaleY":1.8,"scaleX":1.8,"height":16,"color":"#f8f0ef","align":"left"}},{"type":"Label","props":{"y":87,"x":270,"width":389,"var":"win_bitmap","text":"+¥1234.56","height":60,"font":"settleWin","align":"center"}},{"type":"Label","props":{"y":37,"x":274,"width":389,"var":"lost_bitmap","text":"-¥1234.56","height":60,"font":"settlelost","align":"center"}},{"type":"Image","props":{"y":81,"x":24,"width":68,"var":"mcHead","skin":"res/gameScene/HeadIcon.jpg","height":67}},{"type":"Image","props":{"y":60,"x":6,"var":"isBanker","skin":"res/gameScene/庄家符号.png"}},{"type":"Label","props":{"y":249,"x":270,"width":175,"var":"Text_NoOne_bet","text":"本局无人赢钱","scaleY":1.8,"scaleX":1.8,"height":16,"color":"#f8f0ef","align":"center"}},{"type":"Animation","props":{"y":187,"x":201,"var":"Num_0","source":"res/gameScene/NO.1.png,res/gameScene/NO.2.png,res/gameScene/NO.3.png"}},{"type":"Image","props":{"y":194,"x":248,"var":"light_0","skin":"res/share/Light.png"}},{"type":"Image","props":{"y":196,"x":303,"var":"headPic_0","skin":"res/gameScene/结算玩家头像.png"}},{"type":"Label","props":{"y":203,"x":355,"width":93,"var":"name_0","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":204,"x":518,"width":80,"var":"Money_0","text":"+999999999","scaleY":1.8,"scaleX":1.8,"height":19,"color":"#c09528","align":"center"}},{"type":"Animation","props":{"y":244,"x":201,"var":"Num_1","source":"res/gameScene/NO.1.png,res/gameScene/NO.2.png,res/gameScene/NO.3.png"}},{"type":"Image","props":{"y":251,"x":248,"var":"light_1","skin":"res/share/Light.png"}},{"type":"Image","props":{"y":253,"x":303,"var":"headPic_1","skin":"res/gameScene/结算玩家头像.png"}},{"type":"Label","props":{"y":260,"x":355,"width":93,"var":"name_1","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":261,"x":518,"width":80,"var":"Money_1","text":"+999999999","scaleY":1.8,"scaleX":1.8,"height":19,"color":"#c09528","align":"center"}},{"type":"Animation","props":{"y":296,"x":201,"var":"Num_2","source":"res/gameScene/NO.1.png,res/gameScene/NO.2.png,res/gameScene/NO.3.png"}},{"type":"Image","props":{"y":303,"x":248,"var":"light_2","skin":"res/share/Light.png"}},{"type":"Image","props":{"y":305,"x":303,"var":"headPic_2","skin":"res/gameScene/结算玩家头像.png"}},{"type":"Label","props":{"y":312,"x":355,"width":93,"var":"name_2","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":21,"color":"#f8f0ef"}},{"type":"Label","props":{"y":313,"x":518,"width":80,"var":"Money_2","text":"+999999999","scaleY":1.8,"scaleX":1.8,"height":19,"color":"#c09528","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}