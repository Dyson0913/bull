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

		public static var uiView:Object ={"type":"View","props":{"width":250,"name":"Record","height":500},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"Hidding_Recode","skin":"res/gameScene/未展开胜负记录.png"}},{"type":"Box","props":{"y":0,"x":0,"var":"Showing_Recode"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/gameScene/展开胜负记录.png"}},{"type":"Animation","props":{"y":126,"x":24,"var":"spade_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":150,"x":24,"var":"spade_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":174,"x":24,"width":0,"var":"spade_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":198,"x":24,"width":0,"var":"spade_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":221,"x":25,"var":"spade_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":245,"x":25,"var":"spade_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":269,"x":25,"width":0,"var":"spade_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":293,"x":25,"width":0,"var":"spade_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":315,"x":25,"var":"spade_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":339,"x":25,"var":"spade_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":363,"x":25,"width":0,"var":"spade_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":387,"x":25,"width":0,"var":"spade_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":127,"x":61,"var":"heart_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":151,"x":61,"var":"heart_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":175,"x":61,"width":0,"var":"heart_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":199,"x":61,"width":0,"var":"heart_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":222,"x":62,"var":"heart_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":246,"x":62,"var":"heart_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":270,"x":62,"width":0,"var":"heart_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":294,"x":62,"width":0,"var":"heart_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":316,"x":62,"var":"heart_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":340,"x":62,"var":"heart_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":364,"x":62,"width":0,"var":"heart_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":388,"x":62,"width":0,"var":"heart_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":127,"x":97,"var":"club_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":151,"x":97,"var":"club_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":175,"x":97,"width":0,"var":"club_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":199,"x":97,"width":0,"var":"club_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":222,"x":98,"var":"club_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":246,"x":98,"var":"club_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":270,"x":98,"width":0,"var":"club_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":294,"x":98,"width":0,"var":"club_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":316,"x":98,"var":"club_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":340,"x":98,"var":"club_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":364,"x":98,"width":0,"var":"club_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":388,"x":98,"width":0,"var":"club_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":127,"x":133,"var":"diamond_0","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":151,"x":133,"var":"diamond_1","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":175,"x":133,"width":0,"var":"diamond_2","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":199,"x":133,"width":0,"var":"diamond_3","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":222,"x":134,"var":"diamond_4","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":246,"x":134,"var":"diamond_5","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":270,"x":134,"width":0,"var":"diamond_6","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":294,"x":134,"width":0,"var":"diamond_7","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":316,"x":134,"var":"diamond_8","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":340,"x":134,"var":"diamond_9","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png"}},{"type":"Animation","props":{"y":364,"x":134,"width":0,"var":"diamond_10","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Animation","props":{"y":388,"x":134,"width":0,"var":"diamond_11","source":"res/gameScene/红叉.png,res/gameScene/绿勾.png","height":0}},{"type":"Label","props":{"y":78,"x":14,"width":32,"var":"spade_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":102,"x":15,"width":30,"var":"spade_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":78,"x":51,"width":32,"var":"heart_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":78,"x":87,"width":32,"var":"club_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":78,"x":123,"width":32,"var":"diamond_win","text":"999","height":18,"fontSize":18,"color":"#13c328","align":"center"}},{"type":"Label","props":{"y":102,"x":52,"width":30,"var":"heart_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":102,"x":88,"width":30,"var":"club_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}},{"type":"Label","props":{"y":102,"x":125,"width":30,"var":"diamond_lost","text":"999","height":18,"fontSize":18,"color":"#db1028","align":"center"}}]},{"type":"NetStatusPanel","props":{"y":424,"x":6,"var":"viewNetState","runtime":"bull.view.room.NetStatusPanel"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.NetStatusPanel",NetStatusPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}