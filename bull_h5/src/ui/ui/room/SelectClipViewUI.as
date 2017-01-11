/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class SelectClipViewUI extends View {
		public var Coin_light:Image;
		public var mcArrow:Image;
		public var mcSelect_0:Image;
		public var mcSelect_1:Image;
		public var mcSelect_2:Image;
		public var mcSelect_3:Image;
		public var mcSelect_4:Image;
		public var mcSelect_5:Image;

		public static var uiView:Object ={"type":"View","props":{"width":540,"height":110},"child":[{"type":"Image","props":{"y":-6,"x":1,"var":"Coin_light","skin":"res/gameScene/筹码光.png"}},{"type":"Image","props":{"y":79,"x":35,"width":26,"var":"mcArrow","skin":"res/gameScene/筹码指向.png","height":24}},{"type":"Image","props":{"y":7,"x":10,"var":"mcSelect_0","skin":"res/gameScene/chip_1.png","name":"mcSelect_0"}},{"type":"Image","props":{"y":24,"x":98,"var":"mcSelect_1","skin":"res/gameScene/chip_1.png","name":"mcSelect_1"}},{"type":"Image","props":{"y":24,"x":188,"var":"mcSelect_2","skin":"res/gameScene/chip_1.png","name":"mcSelect_2"}},{"type":"Image","props":{"y":24,"x":277,"var":"mcSelect_3","skin":"res/gameScene/chip_1.png","name":"mcSelect_3"}},{"type":"Image","props":{"y":24,"x":367,"var":"mcSelect_4","skin":"res/gameScene/chip_1.png","name":"mcSelect_4"}},{"type":"Image","props":{"y":24,"x":458,"var":"mcSelect_5","skin":"res/gameScene/chip_max.png","name":"mcSelect_5"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}