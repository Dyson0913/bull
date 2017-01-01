/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import ui.ui.room.BankerSettle_infoUI;

	public class BankerSettleUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":836,"height":453},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/下庄结算底板.png"}},{"type":"Button","props":{"y":396,"x":349,"skin":"res/gameScene/Btn_bg.png"}},{"type":"Label","props":{"y":405,"x":390,"width":43,"text":"确  定","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":4,"x":365,"width":58,"text":"下庄结算","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":true}},{"type":"Label","props":{"y":363,"x":13,"width":30,"text":"结算","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#ecec1a","bold":false}},{"type":"Label","props":{"y":359,"x":545,"width":72,"text":"99999999","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#ecec1a","bold":false,"align":"center"}},{"type":"BankerSettle_info","props":{"y":90,"x":10,"runtime":"ui.ui.room.BankerSettle_infoUI"}},{"type":"Button","props":{"y":-1,"x":798,"skin":"res/gameScene/closeBtn.png"}}]};
		override protected function createChildren():void {
			View.regComponent("ui.ui.room.BankerSettle_infoUI",BankerSettle_infoUI);
			super.createChildren();
			createView(uiView);
		}
	}
}