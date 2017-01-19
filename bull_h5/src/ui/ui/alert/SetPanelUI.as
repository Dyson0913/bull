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
		public var txt_RoundID:Label;

		public static var uiView:Object ={"type":"Dialog","props":{"width":384,"height":267},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_seb_bg.png"}},{"type":"Label","props":{"y":92,"x":28,"width":108,"var":"txtName","text":"0.2.0","height":28,"fontSize":22,"color":"#eed6d6"}},{"type":"CheckBox","props":{"y":205,"x":46,"var":"musicButton","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Button","props":{"y":0,"x":343,"var":"btnClose","stateNum":"3","skin":"res/alert/btn_close.png"}},{"type":"CheckBox","props":{"y":205,"x":222,"var":"soundButton","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Label","props":{"y":4,"x":162,"width":62,"text":"设置","height":31,"fontSize":25,"color":"#eed6d6","bold":true}},{"type":"Label","props":{"y":202,"x":82,"width":105,"text":"开启音乐","height":33,"fontSize":25,"color":"#c8d75a"}},{"type":"Label","props":{"y":202,"x":256,"width":104,"text":"开启音效","height":33,"fontSize":25,"color":"#c8d75a"}},{"type":"Label","props":{"y":47,"x":24,"width":108,"var":"txtName","text":"版本号","height":28,"fontSize":22,"color":"#eed6d6"}},{"type":"Label","props":{"y":150,"x":81,"width":172,"var":"txt_RoundID","text":"5868acad101fa","mouseEnabled":false,"height":29,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":150,"x":24,"width":58,"text":"局ID:","mouseEnabled":false,"height":30,"fontSize":22,"color":"#f6ebea","bold":false}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}