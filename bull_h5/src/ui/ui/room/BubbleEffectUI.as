/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BubbleEffectUI extends View {
		public var Win_0:Label;
		public var Win_1:Label;
		public var Win_2:Label;
		public var Win_3:Label;
		public var Lost_0:Label;
		public var Lost_1:Label;
		public var Lost_2:Label;
		public var Lost_3:Label;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"child":[{"type":"Label","props":{"y":233,"x":248,"width":205,"var":"Win_0","text":"+¥1234.56","height":37,"font":"bubbleWin","align":"center"}},{"type":"Label","props":{"y":234,"x":489,"width":204,"var":"Win_1","text":"+¥1234.56","height":37,"font":"bubbleWin","align":"center"}},{"type":"Label","props":{"y":237,"x":729,"width":204,"var":"Win_2","text":"-¥1234.56","height":37,"font":"bubbleWin","align":"center"}},{"type":"Label","props":{"y":236,"x":968,"width":204,"var":"Win_3","text":"-¥1234.56","height":37,"font":"bubbleWin","align":"center"}},{"type":"Label","props":{"y":233,"x":248,"width":204,"var":"Lost_0","text":"-¥1234.56","height":37,"font":"bubbleLost","align":"center"}},{"type":"Label","props":{"y":233,"x":489,"width":204,"var":"Lost_1","text":"-¥1234.56","height":37,"font":"bubbleLost","align":"center"}},{"type":"Label","props":{"y":233,"x":716,"width":204,"var":"Lost_2","text":"-¥1234.56","height":37,"font":"bubbleLost","align":"center"}},{"type":"Label","props":{"y":233,"x":955,"width":204,"var":"Lost_3","text":"-¥1234.56","height":37,"font":"bubbleLost","align":"center"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}