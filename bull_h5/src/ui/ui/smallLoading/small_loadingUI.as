/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.smallLoading {
	import laya.ui.*;
	import laya.display.*; 

	public class small_loadingUI extends View {
		public var ani1:FrameClip;
		public var anim:Image;

		public static var uiView:Object ={"type":"View","props":{"width":600,"height":400},"child":[{"type":"Image","props":{"y":179,"x":315,"var":"anim","skin":"res/smallLoading/chip_10.png","pivotY":29,"pivotX":26},"compId":2},{"type":"Label","props":{"y":229,"x":211,"width":236,"text":"努力加载中。。。","height":25,"fontSize":24,"color":"#fdfbfb","align":"center"}}],"animations":[{"nodes":[{"target":2,"keyframes":{"y":[{"value":179,"tweenMethod":"linearNone","tween":true,"target":2,"key":"y","index":0}],"rotation":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":0},{"value":360,"tweenMethod":"linearNone","tween":true,"target":2,"key":"rotation","index":15}]}}],"name":"ani1","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}