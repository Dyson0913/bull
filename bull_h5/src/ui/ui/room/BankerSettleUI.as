/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.XiaZhuangListRender;

	public class BankerSettleUI extends View {
		public var ok_btn:Button;
		public var total_txt:Label;
		public var close_btn:Button;
		public var xiazhuang_list:List;
		public var bg:Animation;
		public var player3_txt:Label;
		public var player2_txt:Label;
		public var player1_txt:Label;
		public var rundID_txt:Label;
		public var amount_txt:Label;
		public var player0_txt:Label;
		public var bankerType_txt:Label;
		public var index_txt:Label;

		public static var uiView:Object ={"type":"View","props":{"width":836,"height":453},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/下庄结算底板.png"}},{"type":"Button","props":{"y":396,"x":349,"var":"ok_btn","skin":"res/gameScene/Btn_bg.png"}},{"type":"Label","props":{"y":405,"x":390,"width":67,"text":"确  定","mouseEnabled":false,"height":32,"fontSize":25,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":4,"x":365,"width":107,"text":"下庄结算","mouseEnabled":false,"height":32,"fontSize":25,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":363,"x":13,"width":61,"text":"结算","mouseEnabled":false,"height":33,"fontSize":25,"color":"#ecec1a","bold":false}},{"type":"Label","props":{"y":359,"x":545,"width":119,"var":"total_txt","text":"99999999","mouseEnabled":false,"height":25,"fontSize":25,"color":"#ecec1a","bold":false,"align":"center"}},{"type":"Button","props":{"y":-1,"x":798,"var":"close_btn","skin":"res/gameScene/closeBtn.png"}},{"type":"List","props":{"y":87,"x":9,"width":816,"var":"xiazhuang_list","height":265},"child":[{"type":"Box","props":{"y":0,"x":0,"width":814,"runtime":"bull.view.room.XiaZhuangListRender","name":"render","height":28},"child":[{"type":"Animation","props":{"y":2,"x":-3,"var":"bg","source":"res/gameScene/下庄结算横条01.png,res/gameScene/下庄结算横条02.png","name":"bg"}},{"type":"Label","props":{"y":3,"x":457,"width":50,"var":"player3_txt","text":"牛一","name":"player3_txt","mouseEnabled":false,"height":26,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":3,"x":373,"width":52,"var":"player2_txt","text":"牛一","name":"player2_txt","mouseEnabled":false,"height":24,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":3,"x":287,"width":47,"var":"player1_txt","text":"牛一","name":"player1_txt","mouseEnabled":false,"height":23,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":0,"x":643,"width":158,"var":"rundID_txt","text":"5868acad101fa","name":"rundID_txt","mouseEnabled":false,"height":31,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":3,"x":513,"width":104,"var":"amount_txt","text":"9999999","name":"amount_txt","mouseEnabled":false,"height":31,"fontSize":22,"color":"#f6ebea","bold":false,"align":"center"}},{"type":"Label","props":{"y":2,"x":202,"width":50,"var":"player0_txt","text":"牛一","name":"player0_txt","mouseEnabled":false,"height":29,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":3,"x":97,"width":44,"var":"bankerType_txt","text":"牛一","name":"bankerType_txt","mouseEnabled":false,"height":27,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":3,"x":2,"width":54,"var":"index_txt","text":"第1局","name":"index_txt","mouseEnabled":false,"height":27,"fontSize":20,"color":"#f6ebea","bold":false}}]},{"type":"VScrollBar","props":{"y":2,"x":802,"width":17,"skin":"res/gameScene/vscroll.png","name":"scrollBar","height":266,"sizeGrid":"0,3,0,2"}}]}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.XiaZhuangListRender",XiaZhuangListRender);
			super.createChildren();
			createView(uiView);
		}
	}
}