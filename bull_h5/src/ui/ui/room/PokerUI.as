/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerUI extends View {
		public var poker_0_0:Animation;
		public var poker_0_1:Animation;
		public var poker_0_2:Animation;
		public var poker_0_3:Animation;
		public var poker_0_4:Animation;
		public var poker_1_0:Animation;
		public var poker_1_1:Animation;
		public var poker_1_2:Animation;
		public var poker_1_3:Animation;
		public var poker_1_4:Animation;
		public var poker_2_0:Animation;
		public var poker_2_1:Animation;
		public var poker_2_2:Animation;
		public var poker_2_3:Animation;
		public var poker_2_4:Animation;
		public var poker_3_0:Animation;
		public var poker_3_1:Animation;
		public var poker_3_2:Animation;
		public var poker_3_3:Animation;
		public var poker_3_4:Animation;
		public var poker_4_0:Animation;
		public var poker_4_1:Animation;
		public var poker_4_2:Animation;
		public var poker_4_3:Animation;
		public var poker_4_4:Animation;

		public static var uiView:Object ={"type":"View","props":{"width":1420,"height":800},"child":[{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_0_0","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_0_1","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_0_2","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_0_3","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_0_4","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_1_0","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_1_1","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_1_2","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_1_3","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_1_4","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_2_0","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_2_1","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_2_2","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_2_3","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_2_4","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_3_0","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_3_1","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_3_2","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_3_3","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_3_4","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_4_0","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_4_1","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_4_2","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_4_3","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}},{"type":"Animation","props":{"y":139,"x":1118,"var":"poker_4_4","source":"res/gameScene/牌背.png,res/red/diamand_A.png,res/black/club_A.png,res/red/heart_A.png,res/black/spade_A.png,res/red/diamand_2.png,res/black/club_2.png,res/red/heart_2.png,res/black/spade_2.png,res/red/diamand_3.png,res/black/club_3.png,res/red/heart_3.png,res/black/spade_3.png,res/red/diamand_4.png,res/black/club_4.png,res/red/heart_4.png,res/black/spade_4.png,res/red/diamand_5.png,res/black/club_5.png,res/red/heart_5.png,res/black/spade_5.png,res/red/diamand_6.png,res/black/club_6.png,res/red/heart_6.png,res/black/spade_6.png,res/red/diamand_7.png,res/black/club_7.png,res/red/heart_7.png,res/black/spade_7.png,res/red/diamand_8.png,res/black/club_8.png,res/red/heart_8.png,res/black/spade_8.png,res/red/diamand_9.png,res/black/club_9.png,res/red/heart_9.png,res/black/spade_9.png,res/red/diamand_10.png,res/black/club_10.png,res/red/heart_10.png,res/black/spade_10.png,res/red/diamand_J.png,res/black/club_J.png,res/red/heart_J.png,res/black/spade_J.png,res/red/diamand_Q.png,res/black/club_Q.png,res/red/heart_Q.png,res/black/spade_Q.png,res/red/diamand_K.png,res/black/club_K.png,res/red/heart_K.png,res/black/spade_K.png","scaleY":0.4,"scaleX":0.4,"rotation":-69}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}