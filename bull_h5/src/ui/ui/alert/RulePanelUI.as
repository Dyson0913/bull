/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class RulePanelUI extends Dialog {

		public static var uiView:Object ={"type":"Dialog","props":{"width":597,"text":"规则说明","height":439},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_rule.png"}},{"type":"Button","props":{"y":-2,"x":564,"skin":"res/alert/btn_close.png"}},{"type":"Image","props":{"y":52,"x":13,"skin":"res/alert/img_rule_1.png"}},{"type":"TextArea","props":{"y":77,"x":13,"width":552,"text":" 百人牛牛是牛牛游戏的升级版，是可以提供100人及以上玩家同时进行的简单“押注类”扑克游戏，玩家可坐庄，闲家分别与庄家比较牌型大小来定输赢。","height":45}},{"type":"Image","props":{"y":119,"x":18,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":134,"x":22,"skin":"res/alert/img_rule_2.png"}},{"type":"TextArea","props":{"y":163,"x":18,"width":552,"text":"进入游戏：百人牛牛是随到随玩，您可以随时进入或退出游戏。 申请坐庄：玩家如果满足游戏坐庄条件，就能申请坐庄，进入申请上庄列表。 闲家下注：下注分为四个下注区，游戏开始后，除庄家外，所有玩家都可以下注。 发牌：加注时间结束后，系统将同时发出五副手牌。 结算：每位闲家赢得自己下注的金额，庄家赢闲家所输掉的下注金额，不同牌型倍数不一，结算时玩家的下注筹码乘上牌型倍数即为结算金额。","height":82}},{"type":"Image","props":{"y":242,"x":19,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":257,"x":23,"skin":"res/alert/img_rule_3.png"}},{"type":"TextArea","props":{"y":283,"x":21,"width":552,"text":"无牛：五张牌中，任意三张牌点数之和都不能组成10的倍数。 牛一：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是1，赔一倍。 牛二：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是2，赔一倍。 牛三：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是3，赔一倍。 牛四：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是4，赔一倍。 牛五：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是5，赔一倍。 牛六：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是6，赔一倍。 牛七：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是7，赔二倍。 牛八：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是8，赔三倍。 牛九：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是9，赔四倍。 牛牛：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是0，赔五倍。 五小牛：五张牌中，都小于或等于五，且五张牌点数之和小于或等于10，赔十倍。 四炸：即五张牌中有四张一样的牌，此时无需有牛赔十倍。 五花牛：五张十以上的花牌（不包括十）组成的牛牛，赔十倍。 牌型大小：五花牛>四炸>五小牛>牛牛>牛九>牛八>牛七>牛六>牛五>牛四>牛三>牛二>牛一>没牛。 如牌型大小一样，则比较最大单张牌的牌点：K>Q>J>10>9>8>7>6>5>4>3>2>A。","height":125}},{"type":"TextArea","props":{"y":5,"x":257,"width":66,"text":"规则说明","height":26,"color":"#f3e9e9"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}