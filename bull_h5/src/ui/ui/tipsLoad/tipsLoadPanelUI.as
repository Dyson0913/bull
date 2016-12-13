/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.tipsLoad {
	import laya.ui.*;
	import laya.display.*; 
	import com.lightUI.components.tipsLoadPanel.TipsLoadPanel;

	public class tipsLoadPanelUI extends View {
		public var msg_txt:Label;
		public var tip_txt:Label;
		public var progressbar:ProgressBar;

		public static var uiView:Object ={"type":"View","props":{"width":1022,"runtime":"com.lightUI.components.tipsLoadPanel.TipsLoadPanel","height":575},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/tipLoading/loading.jpg"}},{"type":"Label","props":{"y":384,"x":454,"width":69,"var":"msg_txt","text":"label","height":12,"fontSize":12,"color":"#e1e1e1","align":"center"}},{"type":"Label","props":{"y":432,"x":212,"width":553,"var":"tip_txt","text":"label","height":12,"color":"#e1e1e1","align":"center"}},{"type":"ProgressBar","props":{"y":404,"x":200,"width":585,"var":"progressbar","skin":"comp/progress.png","height":14}}]};
		override protected function createChildren():void {
			View.regComponent("com.lightUI.components.tipsLoadPanel.TipsLoadPanel",TipsLoadPanel);
			super.createChildren();
			createView(uiView);
		}
	}
}