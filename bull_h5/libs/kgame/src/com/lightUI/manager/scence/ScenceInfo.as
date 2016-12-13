package com.lightUI.manager.scence
{
	import laya.display.Sprite;

	public class ScenceInfo
	{
		public var assets:Array = [];
		public var viewNames:Array = [];
		public var parent:Sprite;
		public var views:Array = [];
		public var name:String;
		
		
		public var treatPerScence:int = 0;
		
		public var state:int = 0;
		
		public static const INIT:int = 0;////////////////////才刚被初始化  还没有被创建出来
		public static const CREATED:int = 1;/////////////////已经被创建
		public static const SHOW:int = 2;
		public static const HIDE:int = 3;////////////////////已经被隐藏    但 还没以后被销毁    等待以后被复用
		public static const	DESTROY:int = 4;
		
		public static const KEPT_PERSCENCE:int= 0;///////////保留前场景   默认此处理
		public static const HIDE_PERSCENCE:int = 1;//////////隐藏前场景   removeChild 但不销毁资源
		public static const REMOVE_PERSCCENCE:int = 2;///////移除前场景   并  销毁资源 （移动端的 默认选择）
		
		public function ScenceInfo(name:String ,info:Object, views:Array,parent:Sprite,treat:int = 0):void
		{
			try
			{
				this.name = name;
				assets = info.assets;
				this.viewNames = views;
				this.parent = parent;
				this.treatPerScence = treat;
			} catch(error:Error)  {
				trace("ScenceInfo 解析数据错误： ",error);
			}
		}
		
//		public function remove():void{
//			removeViews();
//			state = HIDE;
//		}
		
		public function destroy():void{
//			removeViews();
//			destroyAssetes();
			
			assets = null;
			viewNames = null;
			parent = null;
			views = null;
		}
	
//		private function destroyAssetes():void{
//			var l:int = assets.length;
//			for (var i:int = 0; i < l; i++) 
//			{
//				Laya.loader.clearRes(assets[i]);
//			}
//		}
//		private function removeViews():void{
//			var l:int = views.length;
//			var view:Sprite;
//			for (var i:int = 0; i < l; i++) 
//			{
//				view = views[i];
//				if(view.parent) view.parent.removeChild(view);
//			}
//		}
		
		public function toString():String{
			return "{name:"+name+" , assets:"+assets+" , view:"+viewNames+"}";
		}
	}
}