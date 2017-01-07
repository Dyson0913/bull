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

		public static var uiView:Object ={"type":"View","props":{"width":818,"height":27},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"bg_1","skin":"res/gameScene/下庄结算横条02.png"}},{"type":"Image","props":{"y":0,"x":0,"var":"bg_0","skin":"res/gameScene/下庄结算横条01.png"}},{"type":"Label","props":{"y":1,"x":4,"width":54,"var":"index_txt","text":"第1局","mouseEnabled":false,"height":27,"fontSize":20,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":99,"width":44,"var":"bankerType_txt","text":"牛一","mouseEnabled":false,"height":27,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":0,"x":204,"width":50,"var":"player0_txt","text":"牛一","mouseEnabled":false,"height":29,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":515,"width":104,"var":"amount_txt","text":"9999999","mouseEnabled":false,"height":31,"fontSize":22,"color":"#f6ebea","bold":false,"align":"center"}},{"type":"Label","props":{"y":-2,"x":645,"width":158,"var":"rundID_txt","text":"5868acad101fa","mouseEnabled":false,"height":31,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":289,"width":47,"var":"player1_txt","text":"牛一","mouseEnabled":false,"height":23,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":375,"width":52,"var":"player2_txt","text":"牛一","mouseEnabled":false,"height":24,"fontSize":22,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":459,"width":50,"var":"player3_txt","text":"牛一","mouseEnabled":false,"height":26,"fontSize":22,"color":"#f6ebea","bold":false}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}