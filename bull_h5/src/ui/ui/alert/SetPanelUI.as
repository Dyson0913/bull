/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class SetPanelUI extends Dialog {
		public var versionTxt:Label;
		public var chkMusic:CheckBox;
		public var btnClose:Button;
		public var chkVoice:CheckBox;

		public static var uiView:Object ={"type":"Dialog","props":{"width":274,"height":315},"child":[{"type":"Image","props":{"skin":"res/alert/img_seb_bg.png"}},{"type":"Label","props":{"y":67,"x":22,"width":27,"var":"versionTxt","text":"0.0.1","height":12,"color":"#eed6d6"}},{"type":"CheckBox","props":{"y":144,"x":28,"var":"chkMusic","stateNum":"3","skin":"res/alert/checkbox.png"}},{"type":"Button","props":{"y":-2,"x":242,"var":"btnClose","stateNum":"3","skin":"res/alert/btn_close.png"}},{"type":"CheckBox","props":{"y":145,"x":155,"var":"chkVoice","stateNum":"3","skin":"res/alert/checkbox.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}