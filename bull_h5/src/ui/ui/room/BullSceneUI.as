/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BullSceneUI extends View {
		public var btnBg:Image;
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var PlayerListBtn:Button;
		public var CarryInBtn:Button;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/bg.jpg"}},{"type":"Image","props":{"y":40,"x":1344,"width":71,"var":"btnBg","skin":"res/share/btn_bg.png","height":315,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":-1,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Button","props":{"y":1,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":84,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":149,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Button","props":{"y":281,"x":1345,"var":"PlayerListBtn","skin":"res/gameScene/PlayerListBtn.png"}},{"type":"Button","props":{"y":216,"x":1344,"var":"CarryInBtn","skin":"res/gameScene/CarryInBtn.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}