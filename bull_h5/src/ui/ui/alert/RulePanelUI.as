/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.alert.RulePanel;
	import bull.view.room.RuleRender;

	public class RulePanelUI extends Dialog {
		public var btnClose:Button;
		public var list:List;

		public static var uiView:Object ={"type":"Dialog","props":{"width":833,"text":"规则说明","runtime":"bull.view.alert.RulePanel","height":612},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_rule.png"}},{"type":"Button","props":{"y":-1,"x":793,"var":"btnClose","skin":"res/alert/btn_close.png"}},{"type":"TextArea","props":{"y":4,"x":387,"width":115,"text":"规则说明","height":34,"fontSize":25,"color":"#f3e9e9","bold":true}},{"type":"List","props":{"y":50,"x":5,"width":825,"var":"list","height":515},"child":[{"type":"Box","props":{"y":-1,"x":-3,"width":806,"runtime":"bull.view.room.RuleRender","name":"render","height":994},"child":[{"type":"Image","props":{"y":6,"x":12,"skin":"res/alert/img_rule_1.png"}},{"type":"Image","props":{"y":120,"x":14,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":143,"x":3,"skin":"res/alert/img_rule_2.png"}},{"type":"Image","props":{"y":431,"x":5,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":442,"x":5,"skin":"res/alert/img_rule_3.png"}},{"type":"Label","props":{"y":45,"x":17,"width":756,"text":"    百人牛牛是牛牛游戏的升级版，是可以提供100人及以上玩家同时进行的简\\n单\"押注类\"克游戏，玩家可坐庄，闲家分别与庄家比较牌型大小来定输赢。","height":65,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":181,"x":31,"width":756,"text":"进入游戏 ：百人牛牛是随到随玩，您可以随时进入或退出游戏。","height":29,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":215,"x":30,"width":756,"text":"申请坐庄 ：玩家如果满足游戏坐庄条件，就能申请坐庄，进入申请上庄列表。","height":30,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":202,"x":-58}},{"type":"Label","props":{"y":252,"x":30,"width":756,"text":"闲家下注 ：下注分为四个下注区，游戏开始后，除庄家外，所有玩家都可以\\n下注。 ","height":52,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":308,"x":29,"width":756,"text":"发牌：加注时间结束后，系统将同时发出五副手牌。","height":30,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":345,"x":23,"width":756,"text":" 结算：每位闲家赢得自己下注的金额，庄家赢闲家所输掉的下注金额，不同牌\\n型倍数不一，\\n结算时玩家的下注筹码乘上牌型倍数即为结算金额。","height":74,"fontSize":22,"color":"#f1f6ef"}},{"type":"Label","props":{"y":484,"x":30,"width":756,"text":"无牛：五张牌中，任意三张牌点数之和都不能组成10的倍数。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":517,"x":30,"width":756,"text":"牛一：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是1，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":550,"x":31,"width":756,"text":"牛二：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是2，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":579,"x":30,"width":756,"text":"牛三：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是3，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":608,"x":30,"width":756,"text":"牛四：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是4，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":642,"x":29,"width":756,"text":"牛五：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是5，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":673,"x":29,"width":756,"text":"牛六：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是6，赔一倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":703,"x":29,"width":756,"text":"牛七：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是7，赔二倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":735,"x":30,"width":756,"text":"牛八：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是8，赔三倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":765,"x":29,"width":756,"text":"牛九：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是9，赔四倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":796,"x":28,"width":756,"text":"牛牛：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是0，赔五倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":828,"x":29,"width":756,"text":"五小牛：五张牌中，都小于或等于五，且五张牌点数之和小于或等于10，赔十倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":859,"x":29,"width":756,"text":"四炸：即五张牌中有四张一样的牌，此时无需有牛赔十倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":888,"x":29,"width":756,"text":"五花牛：五张十以上的花牌（不包括十）组成的牛牛，赔十倍。 ","height":34,"fontSize":20,"color":"#f1f6ef"}},{"type":"Label","props":{"y":916,"x":32,"width":772,"text":"牌型大小：五花牛>四炸>五小牛>牛牛>牛九>牛八>牛七>牛六>牛五>牛四>牛三>牛二>牛一>没牛。 ","height":34,"fontSize":18,"color":"#f1f6ef"}},{"type":"Label","props":{"y":948,"x":32,"width":772,"text":"如牌型大小一样，则比较最大单张牌的牌点：K>Q>J>10>9>8>7>6>5>4>3>2>A。","height":34,"fontSize":18,"color":"#f1f6ef"}}]},{"type":"VScrollBar","props":{"y":9,"x":803,"width":17,"skin":"res/alert/vscroll.png","name":"scrollBar","height":506}}]}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.alert.RulePanel",RulePanel);
			View.regComponent("bull.view.room.RuleRender",RuleRender);
			super.createChildren();
			createView(uiView);
		}
	}
}