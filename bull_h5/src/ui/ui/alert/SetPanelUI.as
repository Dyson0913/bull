/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class SetPanelUI extends Dialog {
		public var versionTxt:Label;
		public var chkMusic:CheckBox;
		public var btnClose:Button;
		public var chkVoice:CheckBox;

		public static var uiView:Object ={"type":"Dialog","props":{"width":384,"height":267},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_seb_bg.png"}},{"type":"Label","props":{"y":92,"x":28,"width":108,"var":"versionTxt","text":"0.0.1","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eed6d6"}},{"type":"CheckBox","props":{"y":205,"x":46,"var":"chkMusic","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Button","props":{"y":0,"x":343,"var":"btnClose","stateNum":"3","skin":"res/alert/btn_close.png"}},{"type":"CheckBox","props":{"y":205,"x":222,"var":"chkVoice","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Label","props":{"y":9,"x":181,"width":36,"text":"设置","scaleY":1.5,"scaleX":1.5,"height":17,"color":"#eed6d6"}},{"type":"Label","props":{"y":50,"x":24,"width":108,"text":"版本号","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#eed6d6"}},{"type":"Label","props":{"y":206,"x":82,"width":80,"text":"开启音乐","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#c8d75a"}},{"type":"Label","props":{"y":207,"x":256,"width":57,"text":"开启音效","scaleY":1.5,"scaleX":1.5,"height":18,"color":"#c8d75a"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}