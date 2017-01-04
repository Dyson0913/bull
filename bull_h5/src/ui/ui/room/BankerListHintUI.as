/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class BankerListHintUI extends View {
		public var bg:Image;
		public var BankerLimit:Label;
		public var title:Label;
		public var NextPoint:Image;
		public var NoPlayer:Label;
		public var Page:Label;
		public var player_0:Label;
		public var player_1:Label;
		public var player_2:Label;
		public var player_3:Label;
		public var player_4:Label;
		public var player_5:Label;
		public var player_6:Label;
		public var player_7:Label;
		public var player_8:Label;
		public var player_9:Label;

		public static var uiView:Object ={"type":"View","props":{"width":310,"height":400},"child":[{"type":"Image","props":{"y":0,"x":0,"width":310,"var":"bg","skin":"res/gameScene/特殊tips底板.png","height":392,"sizeGrid":"44,22,51,20"}},{"type":"Label","props":{"y":6,"x":82,"width":80,"text":"等待坐庄队列","scaleY":2,"scaleX":2,"height":15,"color":"#b6c325","bold":true}},{"type":"Label","props":{"y":40,"x":116,"width":57,"var":"BankerLimit","text":"9999","scaleY":1.7,"scaleX":1.7,"height":15,"color":"#b6c325","bold":true,"align":"center"}},{"type":"Label","props":{"y":41,"x":202,"width":58,"text":" 可申请]","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Label","props":{"y":41,"x":21,"width":58,"var":"title","text":"[现金达到","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Image","props":{"y":69,"x":15,"var":"NextPoint","skin":"res/gameScene/next.png"}},{"type":"Label","props":{"y":80,"x":43,"width":141,"var":"NoPlayer","text":"暂时没有等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"center"}},{"type":"Label","props":{"y":347,"x":108,"width":58,"var":"Page","text":"1/10","scaleY":1.8,"scaleX":1.8,"height":15,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Label","props":{"y":68,"x":90,"width":127,"var":"player_0","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":93,"x":90,"width":127,"var":"player_1","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":122,"x":89,"width":127,"var":"player_2","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":150,"x":89,"width":127,"var":"player_3","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":179,"x":90,"width":127,"var":"player_4","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":206,"x":90,"width":127,"var":"player_5","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":232,"x":90,"width":127,"var":"player_6","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":260,"x":90,"width":127,"var":"player_7","text":"1 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":289,"x":90,"width":127,"var":"player_8","text":"9 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":317,"x":79,"width":128,"var":"player_9","text":"10 等待上庄的玩家","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#7d7d7a","bold":true,"align":"left"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}