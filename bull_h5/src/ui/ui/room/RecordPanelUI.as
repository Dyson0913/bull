/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.NetStatusPanel;

	public class RecordPanelUI extends View {
		public var Hidding_Recode:Image;
		public var Showing_Recode:Box;
		public var spade_0:Animation;
		public var spade_1:Animation;
		public var spade_2:Animation;
		public var spade_3:Animation;
		public var spade_4:Animation;
		public var spade_5:Animation;
		public var spade_6:Animation;
		public var spade_7:Animation;
		public var spade_8:Animation;
		public var spade_9:Animation;
		public var spade_10:Animation;
		public var spade_11:Animation;
		public var heart_0:Animation;
		public var heart_1:Animation;
		public var heart_2:Animation;
		public var heart_3:Animation;
		public var heart_4:Animation;
		public var heart_5:Animation;
		public var heart_6:Animation;
		public var heart_7:Animation;
		public var heart_8:Animation;
		public var heart_9:Animation;
		public var heart_10:Animation;
		public var heart_11:Animation;
		public var club_0:Animation;
		public var club_1:Animation;
		public var club_2:Animation;
		public var club_3:Animation;
		public var club_4:Animation;
		public var club_5:Animation;
		public var club_6:Animation;
		public var club_7:Animation;
		public var club_8:Animation;
		public var club_9:Animation;
		public var club_10:Animation;
		public var club_11:Animation;
		public var diamond_0:Animation;
		public var diamond_1:Animation;
		public var diamond_2:Animation;
		public var diamond_3:Animation;
		public var diamond_4:Animation;
		public var diamond_5:Animation;
		public var diamond_6:Animation;
		public var diamond_7:Animation;
		public var diamond_8:Animation;
		public var diamond_9:Animation;
		public var diamond_10:Animation;
		public var diamond_11:Animation;
		public var spade_win:Label;
		public var spade_lost:Label;
		public var heart_win:Label;
		public var club_win:Label;
		public var diamond_win:Label;
		public var heart_lost:Label;
		public var club_lost:Label;
		public var diamond_lost:Label;
		public var viewNetState:NetStatusPanel;

		public static var uiView:Object ={"type":"View","props":{"width":250,"name":"Record","height":500},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"Hidding_Recode","skin":"res/gameScene/未展开胜负记录.png"}},{"type":"Box","props":{"y":0,"x":0,"var":"Showing_Recode"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/展开胜负记录.png"}},{"type":"Animation","props":{"y":123,"x":15,"var":"spade_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":147,"x":16,"var":"spade_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":171,"x":16,"width":0,"var":"spade_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":195,"x":16,"width":0,"var":"spade_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":218,"x":17,"var":"spade_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":242,"x":17,"var":"spade_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":266,"x":17,"width":0,"var":"spade_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":290,"x":17,"width":0,"var":"spade_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":312,"x":17,"var":"spade_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":336,"x":17,"var":"spade_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":360,"x":17,"width":0,"var":"spade_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":384,"x":17,"width":0,"var":"spade_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":124,"x":51,"var":"heart_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":148,"x":51,"var":"heart_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":172,"x":51,"width":0,"var":"heart_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":196,"x":51,"width":0,"var":"heart_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":219,"x":52,"var":"heart_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":243,"x":52,"var":"heart_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":267,"x":52,"width":0,"var":"heart_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":291,"x":52,"width":0,"var":"heart_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":313,"x":52,"var":"heart_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":337,"x":52,"var":"heart_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":361,"x":52,"width":0,"var":"heart_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":385,"x":52,"width":0,"var":"heart_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":124,"x":89,"var":"club_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":148,"x":89,"var":"club_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":172,"x":89,"width":0,"var":"club_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":196,"x":89,"width":0,"var":"club_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":219,"x":90,"var":"club_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":243,"x":90,"var":"club_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":267,"x":90,"width":0,"var":"club_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":291,"x":90,"width":0,"var":"club_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":313,"x":90,"var":"club_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":337,"x":90,"var":"club_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":361,"x":90,"width":0,"var":"club_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":385,"x":90,"width":0,"var":"club_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":124,"x":125,"var":"diamond_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":148,"x":125,"var":"diamond_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":172,"x":125,"width":0,"var":"diamond_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":196,"x":125,"width":0,"var":"diamond_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":219,"x":126,"var":"diamond_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":243,"x":126,"var":"diamond_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":267,"x":126,"width":0,"var":"diamond_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":291,"x":126,"width":0,"var":"diamond_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":313,"x":126,"var":"diamond_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":337,"x":126,"var":"diamond_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":361,"x":126,"width":0,"var":"diamond_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":385,"x":126,"width":0,"var":"diamond_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Label","props":{"y":78,"x":14,"width":32,"var":"spade_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":102,"x":15,"width":30,"var":"spade_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":78,"x":51,"width":32,"var":"heart_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":78,"x":87,"width":32,"var":"club_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":78,"x":123,"width":32,"var":"diamond_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":102,"x":52,"width":30,"var":"heart_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":102,"x":88,"width":30,"var":"club_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":102,"x":125,"width":30,"var":"diamond_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}}]},{"type":"NetStatusPanel","props":{"y":412,"x":9,"var":"viewNetState","runtime":"bull.view.room.NetStatusPanel"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.NetStatusPanel",NetStatusPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}