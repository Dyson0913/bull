package com.lightMVC.parrerns
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.IHandle;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.interfaces.IProxy;
	import com.lightMVC.core.Node;
	
	public class Command extends Node implements ICommand, IHandle
	{
		private var _proxy:IProxy;
		
		public function Command()
		{
			
		}
		
		public function getSingleton(clazzname:String):Object{
			return _proxy.getSingleton(clazzname);
		}
		
		/**
		 * 获取一个model数据  
		 * @param modelName
		 * @return 
		 * 
		 */		
		public function getModel(modelName:String):IModel{
			return _proxy.getModel(modelName);
		}
		/**
		 * 获取一个mediator视图 
		 * @param mediatorName
		 * @return 
		 * 
		 */		
		public function getMediator(mediatorName:String):IMediator{
			return _proxy.getMediator(mediatorName);
		}
		
		public function setProxy(proxy:IProxy):void{
			_proxy = proxy;
		}
		/**
		 * 发送消息
		 * @param notiName	消息名称
		 * @param body		消息携带的参数
		 * 
		 */	
		public function sentNotification(notiName:String, body:Object = null):INode{
			_proxy.sentNotification(new Notification(notiName,body));
			return this;
		}
		/**
		 * 调用此方法 完成参数注入   参数需在 getInjector()数组里申明 
		 * 
		 */		
		public function injector():void{
			_proxy.injector(getInjector(),this);
		}
		/**
		 * 消息处理函数  子类可以重写此方法 
		 * @param notification
		 * 
		 */		
		public function handler(notification:INotification):void
		{
		}
	}
}