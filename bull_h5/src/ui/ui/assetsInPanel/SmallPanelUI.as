/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class SmallPanelUI extends Dialog {
		public var cancel_btn:Button;
		public var ok_btn:Button;
		public var maxmum_txt:Label;
		public var minmum_txt:Label;
		public var amount_describe_txt:Label;
		public var total_txt:Label;
		public var total_describe_txt:Label;
		public var roomName_txt:Label;
		public var close_btn:Button;
		public var amount_txt:Label;
		public var slider:AssetsInSlider;

		public static var uiView:Object ={"type":"Dialog","props":{"width":445,"height":363},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"assetsIn/smallPanel.png"}},{"type":"Button","props":{"y":304,"x":242,"var":"cancel_btn","skin":"assetsIn/Btn_bg.png"}},{"type":"Button","props":{"y":304,"x":66,"var":"ok_btn","skin":"assetsIn/Btn_bg.png"}},{"type":"Label","props":{"y":247,"x":353,"width":82,"var":"maxmum_txt","text":"(1700)","height":30,"fontSize":20,"font":"微软雅黑","color":"#FFFFFF","align":"right"}},{"type":"Label","props":{"y":247,"x":21,"width":82,"var":"minmum_txt","text":"(700)","height":32,"fontSize":20,"font":"微软雅黑","color":"#FFFFFF","align":"left"}},{"type":"Label","props":{"y":145,"x":44,"width":112,"var":"amount_describe_txt","text":"带入金额：","height":28,"fontSize":22,"font":"微软雅黑","color":"#b5b5b5"}},{"type":"Label","props":{"y":106,"x":246,"width":179,"var":"total_txt","text":"¥4512，567，57","height":29,"fontSize":20,"font":"微软雅黑","color":"#E8D07A","align":"right"}},{"type":"Label","props":{"y":104,"x":43,"width":109,"var":"total_describe_txt","text":"可用G 币：","height":28,"fontSize":22,"font":"微软雅黑","color":"#b5b5b5"}},{"type":"Label","props":{"y":56,"x":24,"width":390,"var":"roomName_txt","text":"新手场1桌","height":33,"fontSize":20,"color":"#b5b5b5","align":"center"}},{"type":"Image","props":{"y":7,"x":182,"width":98,"skin":"assetsIn/carryInFont.png","height":24}},{"type":"Button","props":{"y":-2,"x":408,"var":"close_btn","skin":"assetsIn/closeBtn.png"}},{"type":"Label","props":{"y":151,"x":264,"width":162,"var":"amount_txt","text":"¥4512，567，57","height":26,"fontSize":20,"font":"微软雅黑","color":"#E8D07A","align":"right"}},{"type":"AssetsInSlider","props":{"y":192,"x":9,"var":"slider","runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider"}},{"type":"Label","props":{"y":313,"x":111,"width":62,"text":"确 定","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}},{"type":"Label","props":{"y":313,"x":286,"width":62,"text":"取 消","mouseEnabled":false,"height":29,"fontSize":25,"color":"#f6ebea"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}