/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BetChipUI extends View {
		public var Coin_0:Animation;
		public var Coin_1:Animation;
		public var Coin_2:Animation;
		public var Coin_3:Animation;
		public var Coin_4:Animation;
		public var Coin_5:Animation;
		public var Coin_light:Image;
		public var Selcet_Arrow:Image;

		public static var uiView:Object ={"type":"View","props":{"width":540,"height":110},"child":[{"type":"Animation","props":{"y":7,"x":10,"var":"Coin_0","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Animation","props":{"y":22,"x":98,"var":"Coin_1","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Animation","props":{"y":24,"x":188,"var":"Coin_2","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Animation","props":{"y":24,"x":277,"var":"Coin_3","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Animation","props":{"y":24,"x":367,"var":"Coin_4","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Animation","props":{"y":25,"x":458,"var":"Coin_5","source":"res/gameScene/筹码1.png,res/gameScene/筹码10.png,res/gameScene/筹码100.png,res/gameScene/筹码100K.png,res/gameScene/筹码10M.png,res/gameScene/筹码10k.png,res/gameScene/筹码1M.png,res/gameScene/筹码1k.png,res/gameScene/筹码5.png,res/gameScene/筹码50.png,res/gameScene/筹码500.png,res/gameScene/筹码500K.png,res/gameScene/筹码50k.png,res/gameScene/筹码5M.png,res/gameScene/筹码5k.png,res/gameScene/筹码MAX.png"}},{"type":"Image","props":{"y":-6,"x":1,"var":"Coin_light","skin":"res/gameScene/筹码光.png"}},{"type":"Image","props":{"y":81,"x":35,"var":"Selcet_Arrow","skin":"res/gameScene/筹码指向.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}