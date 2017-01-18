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
		public var limitHint:Image;

		public static var uiView:Object ={"type":"View","props":{"width":310,"height":400},"child":[{"type":"Image","props":{"y":0,"x":0,"width":310,"var":"bg","skin":"res/gameScene/特殊tips底板.png","height":392,"sizeGrid":"44,22,51,20"}},{"type":"Label","props":{"y":8,"x":91,"width":140,"text":"等待坐庄队列","height":23,"fontSize":20,"color":"#b6c325","bold":true,"align":"center"}},{"type":"Label","props":{"y":40,"x":116,"width":99,"var":"BankerLimit","text":"9999","height":24,"fontSize":22,"color":"#b6c325","bold":true,"align":"center"}},{"type":"Label","props":{"y":41,"x":202,"width":94,"text":" 可申请]","height":28,"fontSize":18,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Label","props":{"y":41,"x":21,"width":85,"var":"title","text":"[现金达到","height":25,"fontSize":18,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Image","props":{"y":69,"x":15,"var":"NextPoint","skin":"res/gameScene/next.png"}},{"type":"Label","props":{"y":80,"x":30,"width":258,"var":"NoPlayer","text":"暂时没有等待上庄的玩家","height":32,"fontSize":22,"color":"#7d7d7a","bold":true,"align":"center"}},{"type":"Label","props":{"y":350,"x":116,"width":97,"var":"Page","text":"1/10","height":30,"fontSize":20,"color":"#f4f4f1","bold":false,"align":"center"}},{"type":"Label","props":{"y":66,"x":87,"width":210,"var":"player_0","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":95,"x":88,"width":210,"var":"player_1","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":123,"x":87,"width":210,"var":"player_2","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":152,"x":87,"width":210,"var":"player_3","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":180,"x":87,"width":210,"var":"player_4","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":209,"x":87,"width":210,"var":"player_5","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":237,"x":88,"width":210,"var":"player_6","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":266,"x":88,"width":210,"var":"player_7","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":294,"x":88,"width":210,"var":"player_8","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Label","props":{"y":323,"x":88,"width":210,"var":"player_9","text":"1 等待上庄的玩家","height":27,"fontSize":20,"color":"#7d7d7a","bold":true,"align":"left"}},{"type":"Image","props":{"y":379,"x":-149,"width":623,"var":"limitHint","skin":"res/gameScene/tips小底板.png","height":78,"sizeGrid":"18,25,30,22"},"child":[{"type":"Label","props":{"y":20,"x":11,"width":601,"text":"玩家带入金余额必须大于等于本牌桌限红的11倍，才可以进入等待坐庄队列","height":25,"fontSize":18,"color":"#f4f4f1","bold":false,"align":"center"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}