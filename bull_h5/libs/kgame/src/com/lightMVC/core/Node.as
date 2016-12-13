package com.lightMVC.core
{
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.IProxy;
	
	public class Node implements INode
	{
//		protected var proxy:IProxy;
		protected var name:String;
		
		private var _isInitialize:Boolean = false;///////////////标记是否已经被初始化
		
		public function Node(name:String = ""):void{
			this.name = name;
		}
		
//		public function setProxy(proxy:IProxy):void{
//			this.proxy = proxy;
//			
//			//TODO:  如此的做法 只能是  被注入的类 必须先与注入类 创建     优化方案   静态注入类  同一批次注入   动态注入的类  只能是被注入 已创建的类 
//			//if(getInjector().length != 0) proxy["injector"](getInjector(),this);
//		}
		
		public function getName():String{
			return name;
		}
		
//		public function sentNotification(notiName:String, body:Object = null):INode{
//			proxy.sentNotification(new Notification(notiName,body));
//			return this;
//		}
		
		public function getInjector():Array{
			return [];
		}

		public function get isInitialize():Boolean
		{
			return _isInitialize;
		}

		public function set isInitialize(value:Boolean):void
		{
			_isInitialize = value;
		}
	}
}