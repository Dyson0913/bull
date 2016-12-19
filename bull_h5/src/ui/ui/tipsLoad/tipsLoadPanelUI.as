/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.tipsLoad {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.components.tipsLoadPanel.TipsLoadPanel;

	public class tipsLoadPanelUI extends View {
		public var loading_percent:Image;
		public var msg_txt:Label;
		public var tip_txt:Label;
		public var progressbar:ProgressBar;
		public var loadingbg:Image;
		public var loadin_percent:Image;

		public static var uiView:Object ={"type":"View","props":{"width":1420,"text":"Version 0.0.1","scaleX":1,"runtime":"com.lightUI.components.tipsLoadPanel.TipsLoadPanel","height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"var":"loading_percent","skin":"res/tipLoading/loading.jpg"}},{"type":"Label","props":{"y":604,"x":680,"width":69,"var":"msg_txt","text":"label","height":12,"fontSize":12,"color":"#e1e1e1","align":"center"}},{"type":"Label","props":{"y":650,"x":599,"width":161,"var":"tip_txt","text":"Version 0.0.1","scaleY":1.5,"scaleX":1.4,"height":35,"color":"#e1e1e1","align":"center"}},{"type":"ProgressBar","props":{"y":582,"x":267,"width":893,"var":"progressbar","skin":"comp/progress.png","height":14}},{"type":"Image","props":{"y":624,"x":260,"var":"loadingbg","skin":"res/tipLoading/loading_bg.png"}},{"type":"Image","props":{"y":629,"x":266,"var":"loadin_percent","skin":"res/tipLoading/loading_bar.png"}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.components.tipsLoadPanel.TipsLoadPanel",TipsLoadPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}