/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetChipUI extends View {
		public var Coin_light:Image;
		public var Selcet_Arrow:Image;
		public var Coin_0:Image;
		public var Coin_1:Image;
		public var Coin_2:Image;
		public var Coin_3:Image;
		public var Coin_4:Image;
		public var Coin_5:Image;

		public static var uiView:Object ={"type":"View","props":{"width":540,"height":110},"child":[{"type":"Image","props":{"y":-6,"x":1,"var":"Coin_light","skin":"res/gameScene/筹码光.png"}},{"type":"Image","props":{"y":79,"x":35,"width":26,"var":"Selcet_Arrow","skin":"res/gameScene/筹码指向.png","height":24}},{"type":"Image","props":{"y":7,"x":10,"var":"Coin_0","skin":"res/gameScene/chip_1.png","name":"Coin_0"}},{"type":"Image","props":{"y":24,"x":98,"var":"Coin_1","skin":"res/gameScene/chip_1.png","name":"Coin_1"}},{"type":"Image","props":{"y":24,"x":188,"var":"Coin_2","skin":"res/gameScene/chip_1.png","name":"Coin_2"}},{"type":"Image","props":{"y":24,"x":277,"var":"Coin_3","skin":"res/gameScene/chip_1.png","name":"Coin_3"}},{"type":"Image","props":{"y":24,"x":367,"var":"Coin_4","skin":"res/gameScene/chip_1.png","name":"Coin_4"}},{"type":"Image","props":{"y":24,"x":458,"var":"Coin_5","skin":"res/gameScene/chip_1.png","name":"Coin_5"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}