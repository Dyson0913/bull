/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class AlertPanelUI extends Dialog {
		public var close_btn:Button;
		public var ok_btn:Button;

		public static var uiView:Object ={"type":"Dialog","props":{"width":318,"height":195},"child":[{"type":"Image","props":{"skin":"res/alert/img_hint.png"}},{"type":"Button","props":{"y":-3,"x":287,"var":"close_btn","skin":"res/alert/btn_close.png"}},{"type":"Button","props":{"y":161,"x":120,"var":"ok_btn","skin":"assetsIn/ok.png"}},{"type":"TextArea","props":{"y":76,"x":13,"width":291,"text":"TextArea","height":69,"color":"#e8dede","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}