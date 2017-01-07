/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BankerSettle_infoUI extends View {
		public var bg_1:Image;
		public var bg_0:Image;
		public var index_txt:Label;
		public var bankerType_txt:Label;
		public var player0_txt:Label;
		public var amount_txt:Label;
		public var rundID_txt:Label;
		public var player1_txt:Label;
		public var player2_txt:Label;
		public var player3_txt:Label;

		public static var uiView:Object ={"type":"View","props":{"width":818,"height":27},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"bg_1","skin":"res/gameScene/下庄结算横条02.png"}},{"type":"Image","props":{"y":0,"x":0,"var":"bg_0","skin":"res/gameScene/下庄结算横条01.png"}},{"type":"Label","props":{"y":1,"x":4,"width":41,"var":"index_txt","text":"第1局","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":99,"width":29,"var":"bankerType_txt","text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":0,"x":204,"width":29,"var":"player0_txt","text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":-2,"x":513,"width":74,"var":"amount_txt","text":"9999999","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false,"align":"center"}},{"type":"Label","props":{"y":-2,"x":645,"width":87,"var":"rundID_txt","text":"5868acad101fa","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":289,"width":29,"var":"player1_txt","text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":375,"width":29,"var":"player2_txt","text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":459,"width":29,"var":"player3_txt","text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}