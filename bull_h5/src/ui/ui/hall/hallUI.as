/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.hall {
	import laya.ui.*;
	import laya.display.*; 

	public class hallUI extends View {
		public var backLobby:Button;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var GBtn:Button;
		public var MBtn:Button;

		public static var uiView:Object ={"type":"View","props":{"width":1420,"height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/hall/bg.png","name":"bg"}},{"type":"Button","props":{"y":0,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Image","props":{"y":3,"x":605,"skin":"res/hall/logo.png","name":"logo"}},{"type":"Button","props":{"y":75,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":158,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":223,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Image","props":{"y":168,"x":158,"skin":"res/hall/img_Ginit.png","name":"Ginit"}},{"type":"Image","props":{"y":174,"x":771,"skin":"res/hall/img_GHigh.png","name":"GHigh"}},{"type":"Button","props":{"y":-1,"x":1046,"var":"GBtn","skin":"res/hall/GBtn.png"}},{"type":"Button","props":{"y":-2,"x":1232,"var":"MBtn","skin":"res/hall/MBtn.png"}},{"type":"Button","props":{"y":739,"x":358,"skin":"res/hall/GEnter.png","name":"GEnter"}},{"type":"Button","props":{"y":748,"x":973,"skin":"res/hall/GEnter.png","name":"GHighEnter"}},{"type":"Image","props":{"y":142,"x":346,"skin":"res/hall/borad_bg.png","name":"boardbg"}},{"type":"Image","props":{"y":142,"x":426,"skin":"res/hall/LP.png","name":"Lp"}},{"type":"Button","props":{"y":169,"x":156,"skin":"res/hall/fullState.png","name":"fullstate_low"}},{"type":"Button","props":{"y":171,"x":774,"skin":"res/hall/fullState.png","name":"fullstate_high"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}