/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.hall {
	import laya.ui.*;
	import laya.display.*; 

	public class hallUI extends View {
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var Ginit:Image;
		public var GHigh:Image;
		public var GBtn:Button;
		public var MBtn:Button;
		public var GLowEnter:Button;
		public var GHighEnter:Button;
		public var Minit:Image;
		public var MHigh:Image;
		public var MLowEnter:Button;
		public var MHighEnter:Button;

		public static var uiView:Object ={"type":"View","props":{"width":1420,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/hall/bg.jpg","name":"bg"}},{"type":"Button","props":{"y":0,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Image","props":{"y":3,"x":605,"skin":"res/hall/logo.png","name":"logo"}},{"type":"Button","props":{"y":75,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":158,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":223,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Image","props":{"y":172,"x":158,"var":"Ginit","skin":"res/hall/img_Ginit.png"}},{"type":"Image","props":{"y":173,"x":771,"var":"GHigh","skin":"res/hall/img_GHigh.png"}},{"type":"Button","props":{"y":-1,"x":1046,"var":"GBtn","skin":"res/hall/GBtn.png"}},{"type":"Button","props":{"y":-2,"x":1232,"var":"MBtn","skin":"res/hall/MBtn.png"}},{"type":"Button","props":{"y":734,"x":328,"var":"GLowEnter","skin":"res/hall/GEnter.png"}},{"type":"Button","props":{"y":736,"x":956,"var":"GHighEnter","skin":"res/hall/GEnter.png"}},{"type":"Image","props":{"y":134,"x":377,"skin":"res/hall/borad_bg.png","name":"boardbg"}},{"type":"Image","props":{"y":137,"x":418,"skin":"res/hall/LP.png","name":"Lp"}},{"type":"Button","props":{"y":169,"x":156,"skin":"res/hall/fullState.png","name":"fullstate_low"}},{"type":"Button","props":{"y":171,"x":774,"skin":"res/hall/fullState.png","name":"fullstate_high"}},{"type":"Image","props":{"y":171,"x":156,"var":"Minit","skin":"res/hall/img_Minit.png"}},{"type":"Image","props":{"y":172,"x":772,"var":"MHigh","skin":"res/hall/img_MHigh.png"}},{"type":"Button","props":{"y":733,"x":326,"var":"MLowEnter","skin":"res/hall/MEnter.png","label":"label"}},{"type":"Button","props":{"y":737,"x":957,"var":"MHighEnter","skin":"res/hall/MEnter.png","label":"label"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}