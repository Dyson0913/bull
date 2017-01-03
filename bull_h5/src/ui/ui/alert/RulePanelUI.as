/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.alert {
	import laya.ui.*;
	import laya.display.*; 

	public class RulePanelUI extends Dialog {
		public var btnClose:Button;

		public static var uiView:Object ={"type":"Dialog","props":{"width":833,"text":"规则说明","height":612},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/alert/img_rule.png"}},{"type":"Button","props":{"y":-1,"x":793,"var":"btnClose","skin":"res/alert/btn_close.png"}},{"type":"Image","props":{"y":64,"x":13,"skin":"res/alert/img_rule_1.png"}},{"type":"TextArea","props":{"y":97,"x":36,"width":781,"text":" 百人牛牛是牛牛游戏的升级版，是可以提供100人及以上玩家同时进行的简单“押注类”扑克游戏，玩家可坐庄，闲家分别与庄家比较牌型大小来定输赢。","height":45,"color":"#f3e4e4"}},{"type":"Image","props":{"y":153,"x":30,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":164,"x":16,"skin":"res/alert/img_rule_2.png"}},{"type":"TextArea","props":{"y":204,"x":23,"width":781,"text":"进入游戏：百人牛牛是随到随玩，您可以随时进入或退出游戏。 申请坐庄：玩家如果满足游戏坐庄条件，就能申请坐庄，进入申请上庄列表。 闲家下注：下注分为四个下注区，游戏开始后，除庄家外，所有玩家都可以下注。 发牌：加注时间结束后，系统将同时发出五副手牌。 结算：每位闲家赢得自己下注的金额，庄家赢闲家所输掉的下注金额，不同牌型倍数不一，结算时玩家的下注筹码乘上牌型倍数即为结算金额。","height":82,"color":"#f3efef"}},{"type":"Image","props":{"y":272,"x":19,"skin":"res/alert/img_rule_line.png"}},{"type":"Image","props":{"y":287,"x":19,"skin":"res/alert/img_rule_3.png"}},{"type":"TextArea","props":{"y":349,"x":21,"width":782,"text":"无牛：五张牌中，任意三张牌点数之和都不能组成10的倍数。 牛一：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是1，赔一倍。 牛二：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是2，赔一倍。 牛三：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是3，赔一倍。 牛四：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是4，赔一倍。 牛五：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是5，赔一倍。 牛六：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是6，赔一倍。 牛七：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是7，赔二倍。 牛八：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是8，赔三倍。 牛九：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是9，赔四倍。 牛牛：三张牌的点数之和组成10的倍数，剩余两张点数之和的个位数字是0，赔五倍。 五小牛：五张牌中，都小于或等于五，且五张牌点数之和小于或等于10，赔十倍。 四炸：即五张牌中有四张一样的牌，此时无需有牛赔十倍。 五花牛：五张十以上的花牌（不包括十）组成的牛牛，赔十倍。 牌型大小：五花牛>四炸>五小牛>牛牛>牛九>牛八>牛七>牛六>牛五>牛四>牛三>牛二>牛一>没牛。 如牌型大小一样，则比较最大单张牌的牌点：K>Q>J>10>9>8>7>6>5>4>3>2>A。","height":157,"color":"#eedfdf"}},{"type":"TextArea","props":{"y":7,"x":408,"width":66,"text":"规则说明","scaleY":1.5,"scaleX":1.5,"height":26,"color":"#f3e9e9"}},{"type":"VScrollBar","props":{"y":53,"x":799,"width":17,"value":5,"touchScrollEnable":true,"skin":"res/gameScene/vscroll.png","height":506}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}