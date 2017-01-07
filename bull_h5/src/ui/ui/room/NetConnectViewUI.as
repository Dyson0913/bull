/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.room {
	import laya.ui.*;
	import laya.display.*; 
	import bull.view.room.NetConnectView;

	public class NetConnectViewUI extends View {
		public var txtName:Label;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"runtime":"bull.view.room.NetConnectView","height":800},"child":[{"type":"Label","props":{"y":360,"x":494,"width":224,"var":"txtName","text":"天涯歌女爱与仇","scaleY":1.8,"scaleX":1.8,"height":76,"color":"#f8f0ef","align":"center"}}]};
		override protected function createChildren():void {
			View.regComponent("bull.view.room.NetConnectView",NetConnectView);
			super.createChildren();
			createView(uiView);
		}
	}
}