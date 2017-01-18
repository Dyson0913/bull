/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertCancelPanelUI extends Dialog {
		public var close_btn:Button;
		public var ok_btn:Button;
		public var cancel_btn:Button;
		public var txt_label:Label;

		public static var uiView:Object ={"type":"Dialog","props":{"width":445,"height":273},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_hint.png"}},{"type":"Button","props":{"y":-2,"x":406,"var":"close_btn","skin":"res/alert/btn_close.png","name":"close_btn"}},{"type":"Button","props":{"y":220,"x":58,"var":"ok_btn","skin":"assetsIn/Btn_bg.png","name":"ok_btn"}},{"type":"Button","props":{"y":220,"x":238,"var":"cancel_btn","skin":"assetsIn/Btn_bg.png","name":"cancel_btn"}},{"type":"Label","props":{"y":114,"x":20,"width":410,"var":"txt_label","text":"label","height":96,"color":"#f1ebea","align":"center"}},{"type":"Label","props":{"y":7,"x":194,"width":59,"text":"温馨提示","scaleY":1.5,"scaleX":1.5,"height":19,"color":"#f4e6e6"}},{"type":"Label","props":{"y":228,"x":104,"width":62,"text":"确 定","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}},{"type":"Label","props":{"y":228,"x":282,"width":62,"text":"取 消","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}