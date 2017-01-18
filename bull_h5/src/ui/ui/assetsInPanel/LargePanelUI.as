/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class LargePanelUI extends Dialog {
		public var btn_canel:Button;
		public var btn_ok:Button;
		public var tips_txt:Label;
		public var btnClose:Button;
		public var roomName_txt:Label;
		public var range_txt:Label;
		public var amount_total_txt:Label;
		public var total_cash_txt:Label;
		public var total_nm_txt:Label;
		public var cash_txt:Label;
		public var nm_txt:Label;
		public var cash_slider:AssetsInSlider;
		public var nm_slider:AssetsInSlider;

		public static var uiView:Object ={"type":"Dialog","props":{"width":445,"height":573},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"assetsIn/longPanel.png"}},{"type":"Button","props":{"y":512,"x":233,"var":"btn_canel","skin":"assetsIn/Btn_bg.png"}},{"type":"Button","props":{"y":511,"x":51,"var":"btn_ok","skin":"assetsIn/Btn_bg.png"}},{"type":"Label","props":{"y":478,"x":68,"width":300,"var":"tips_txt","text":"拟码无法在 JackPot 和 Bonus 上使用!","height":30,"fontSize":15,"font":"微软雅黑","color":"#FF6511","align":"left"}},{"type":"Button","props":{"y":-2,"x":405,"var":"btnClose","skin":"assetsIn/closeBtn.png"}},{"type":"Label","props":{"y":53,"x":17,"width":412,"var":"roomName_txt","text":"新手桌","height":35,"fontSize":25,"color":"#b5b5b5","align":"center"}},{"type":"Label","props":{"y":102,"x":56,"width":106,"text":"带入范围：","height":33,"fontSize":20,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":105,"x":232,"width":196,"var":"range_txt","text":"0.3-0.7","height":26,"fontSize":20,"color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":146,"x":59,"width":99,"text":"可用现金：","height":30,"fontSize":20,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":252,"x":55,"width":99,"text":"可用拟码：","name":"roomName_txt","height":33,"fontSize":20,"font":"微软雅黑","color":"#aeaeae","align":"center"}},{"type":"Label","props":{"y":366,"x":115,"width":168,"var":"amount_total_txt","text":"0.3-0.7","height":20,"fontSize":18,"color":"#FFFFFF","align":"left"}},{"type":"Label","props":{"y":148,"x":268,"width":161,"var":"total_cash_txt","text":"0.3-0.7","height":27,"fontSize":20,"color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":421,"x":40,"width":61,"text":"拟 码：","height":30,"fontSize":18,"font":"微软雅黑","color":"#aeaeae","bold":false,"align":"left"}},{"type":"Label","props":{"y":362,"x":40,"width":58,"text":"总 计：","height":25,"fontSize":18,"font":"微软雅黑","color":"#aeaeae","align":"left"}},{"type":"Label","props":{"y":391,"x":40,"width":58,"text":"现 金：","height":28,"fontSize":18,"font":"微软雅黑","color":"#aeaeae","align":"left"}},{"type":"Label","props":{"y":257,"x":345,"width":85,"var":"total_nm_txt","text":"0.3-0.7","height":30,"fontSize":20,"color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":395,"x":115,"width":171,"var":"cash_txt","text":"0.3-0.7","height":16,"fontSize":18,"color":"#FFFFFF","align":"left"}},{"type":"Label","props":{"y":425,"x":115,"width":169,"var":"nm_txt","text":"0.3-0.7","height":16,"fontSize":18,"color":"#FFFFFF","align":"left"}},{"type":"Image","props":{"y":474,"x":16,"skin":"assetsIn/warn2.png"}},{"type":"AssetsInSlider","props":{"y":187,"x":10,"var":"cash_slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}},{"type":"AssetsInSlider","props":{"y":295,"x":10,"var":"nm_slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}},{"type":"Label","props":{"y":5,"x":160,"width":135,"text":"带入金设置","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}},{"type":"Label","props":{"y":521,"x":277,"width":62,"text":"取 消","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}},{"type":"Label","props":{"y":520,"x":97,"width":62,"text":"确 定","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}