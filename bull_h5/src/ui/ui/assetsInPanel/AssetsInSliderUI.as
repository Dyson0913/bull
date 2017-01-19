/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.assetsInPanel {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider;

	public class AssetsInSliderUI extends View {
		public var slider:HSlider;
		public var min_btn:Button;
		public var max_btn:Button;
		public var slider_bar:Image;

		public static var uiView:Object ={"type":"View","props":{"width":430,"runtime":"com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider","height":45},"child":[{"type":"HSlider","props":{"y":17,"x":81,"width":265,"var":"slider","skin":"assetsIn/hslider.png","showLabel":false,"height":50}},{"type":"Button","props":{"y":1,"x":0,"var":"min_btn","skin":"assetsIn/标签按钮常态.png"}},{"type":"Button","props":{"y":1,"x":350,"var":"max_btn","skin":"assetsIn/标签按钮常态.png"}},{"type":"Label","props":{"y":9,"x":364,"width":49,"text":"最 高","mouseEnabled":false,"height":28,"fontSize":20,"color":"#f6ebea"}},{"type":"Label","props":{"y":9,"x":14,"width":49,"text":"最 低","mouseEnabled":false,"height":28,"fontSize":20,"color":"#f6ebea"}},{"type":"Image","props":{"y":16,"x":88,"width":259,"var":"slider_bar","skin":"assetsIn/bar_hslider.png","sizeGrid":"1,7,1,4","height":12}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.KGameComponents.assetsInPanel.AssetsInSlider",AssetsInSlider);
			super.createChildren();
			createView(uiView);
		}
	}
}