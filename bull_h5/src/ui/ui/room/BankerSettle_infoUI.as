/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BankerSettle_infoUI extends View {

		public static var uiView:Object ={"type":"View","props":{"width":818,"height":27},"child":[{"type":"Animation","props":{"y":0,"x":0,"source":"res/gameScene/下庄结算横条01.png,res/gameScene/下庄结算横条02.png"}},{"type":"Label","props":{"y":1,"x":4,"width":41,"text":"第1局","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":99,"width":29,"text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":0,"x":204,"width":29,"text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":-2,"x":513,"width":74,"text":"9999999","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false,"align":"center"}},{"type":"Label","props":{"y":-2,"x":645,"width":87,"text":"5868acad101fa","scaleY":2,"scaleX":2,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":289,"width":29,"text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":375,"width":29,"text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}},{"type":"Label","props":{"y":1,"x":459,"width":29,"text":"牛一","scaleY":1.8,"scaleX":1.8,"mouseEnabled":false,"height":16,"color":"#f6ebea","bold":false}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}