/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.NetConnectView;

	public class NetConnectViewUI extends View {
		public var txtName:Label;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"runtime":"bull.view.room.NetConnectView","height":800},"child":[{"type":"Label","props":{"y":355,"x":584,"width":254,"var":"txtName","text":"天涯歌女爱与仇","height":76,"fontSize":30,"color":"#f8f0ef","align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.NetConnectView",NetConnectView);
			super.createChildren();
			createView(uiView);
		}
	}
}