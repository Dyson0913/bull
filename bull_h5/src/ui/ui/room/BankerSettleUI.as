/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.XZItemCell;

	public class BankerSettleUI extends View {
		public var total_txt:Label;
		public var ok_btn:Button;
		public var xiazhuang_list:List;

		public static var uiView:Object ={"type":"View","props":{"width":836,"height":453},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/下庄结算底板.png"}},{"type":"Button","props":{"y":396,"x":349,"skin":"res/gameScene/Btn_bg.png"}},{"type":"Label","props":{"y":405,"x":390,"width":43,"text":"确  定","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":4,"x":365,"width":58,"text":"下庄结算","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":363,"x":13,"width":30,"text":"结算","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#ecec1a","bold":false}},{"type":"Label","props":{"y":359,"x":545,"width":72,"var":"total_txt","text":"99999999","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#ecec1a","bold":false,"align":"center"}},{"type":"Button","props":{"y":-1,"x":798,"var":"ok_btn","skin":"res/gameScene/closeBtn.png"}},{"type":"List","props":{"y":87,"x":9,"width":816,"var":"xiazhuang_list","height":265},"child":[{"type":"BankerSettle_info","props":{"y":6,"x":1,"runtime":"bull.view.room.XZItemCell","name":"render"}},{"type":"VScrollBar","props":{"y":2,"x":802,"width":17,"skin":"comp/vscroll.png","name":"scrollBar","height":266}}]}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.XZItemCell",XZItemCell);
			super.createChildren();
			createView(uiView);
		}
	}
}