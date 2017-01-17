/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class SetPanelUI extends Dialog {
		public var txtName:Label;
		public var musicButton:CheckBox;
		public var btnClose:Button;
		public var soundButton:CheckBox;
		public var txtName:Label;

		public static var uiView:Object ={"type":"Dialog","props":{"width":384,"height":267},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_seb_bg.png"}},{"type":"Label","props":{"y":92,"x":28,"width":108,"var":"txtName","text":"0.0.1","height":28,"fontSize":22,"color":"#eed6d6"}},{"type":"CheckBox","props":{"y":205,"x":46,"var":"musicButton","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Button","props":{"y":0,"x":343,"var":"btnClose","stateNum":"3","skin":"res/alert/btn_close.png"}},{"type":"CheckBox","props":{"y":205,"x":222,"var":"soundButton","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Label","props":{"y":9,"x":181,"width":36,"text":"设置","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#eed6d6"}},{"type":"Label","props":{"y":206,"x":82,"width":80,"text":"开启音乐","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#c8d75a"}},{"type":"Label","props":{"y":207,"x":256,"width":57,"text":"开启音效","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#c8d75a"}},{"type":"Label","props":{"y":47,"x":24,"width":108,"var":"txtName","text":"版本号","height":28,"fontSize":22,"color":"#eed6d6"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}