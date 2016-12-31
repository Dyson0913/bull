/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.smallLoading {
	import laya.ui.*;
	import laya.display.*; 

	public class small_loadingUI extends View {
		public var ani1:FrameClip;

		public static var uiView:Object ={"type":"View","props":{"width":1400,"height":800},"animations":[{"nodes":[{"target":2,"keyframes":{"y":[{"value":179,"tweenMethod":"linearNone","tween":true,"target":2,"key":"y","index":0}],"rotation":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":0},{"value":360,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":15}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}