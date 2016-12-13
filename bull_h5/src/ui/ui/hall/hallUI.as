/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.hall {
	import laya.ui.*;
	import laya.display.*; 

	public class hallUI extends View {
		public var gbtn:Button;
		public var mbtn:Button;
		public var GHightenter:Button;
		public var GLowEnter:Button;

		public static var uiView:Object ={"type":"View","props":{"width":920,"height":610},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/hall/bg.jpg"}},{"type":"Image","props":{"y":0,"x":0,"skin":"res/hall/demo.jpg"}},{"type":"Image","props":{"y":1,"x":4,"skin":"res/hall/logo.png"}},{"type":"Button","props":{"y":2,"x":645,"var":"gbtn","skin":"res/hall/GBtn.png"}},{"type":"Button","props":{"y":1,"x":780,"var":"mbtn","skin":"res/hall/MBtn.png"}},{"type":"Image","props":{"y":122,"x":63,"skin":"res/hall/img_Ginit.png"}},{"type":"Image","props":{"y":123,"x":494,"skin":"res/hall/img_GHigh.png"}},{"type":"Button","props":{"y":542,"x":630,"var":"GHightenter","skin":"res/hall/GEnter.png"}},{"type":"Button","props":{"y":542,"x":181,"var":"GLowEnter","skin":"res/hall/GEnter.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}