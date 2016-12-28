/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertPanelUI extends Dialog {
		public var close_btn:Button;
		public var txt_label:Label;
		public var cancel_btn:Button;
		public var ok_btn:Button;

		public static var uiView:Object ={"type":"Dialog","props":{"width":318,"height":195},"child":[{"type":"Image","props":{"skin":"res/alert/img_hint.png"}},{"type":"Button","props":{"y":0,"x":405,"var":"close_btn","skin":"res/alert/btn_close.png"}},{"type":"Label","props":{"y":115,"x":20,"width":410,"var":"txt_label","text":"label","height":96,"color":"#f1ebea","align":"center"}},{"type":"Button","props":{"y":232,"x":283,"var":"cancel_btn","skin":"assetsIn/cancel.png"}},{"type":"Label","props":{"y":8,"x":190,"width":59,"text":"温馨提示","scaleY":1.5,"scaleX":1.5,"height":19,"color":"#f4e6e6"}},{"type":"Button","props":{"y":232,"x":87,"var":"ok_btn","skin":"assetsIn/ok.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}