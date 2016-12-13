package com.lightMVC.parrerns
{
	import com.lightMVC.core.Node;
	import com.lightMVC.interfaces.IConfigure;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.IProxy;
	
	public class Configure extends Node implements IConfigure
	{
		private var _proxy:IProxy;
		
		public function Configure()
		{
			
		}
		
		public function asSingleton(name:String,single:Class):void{
			_proxy.asSingleton(name,single);
		}
		/**
		 * 子类可以重写此方法 完成流程配置 
		 * 
		 */		
		public function configure():void{
			
		}
		
		/**
		 * 注册model数据 
		 * @param mmodel
		 * @return 
		 * 
		 */		
		public function registerModel(mmodel:IModel):IModel
		{
			return _proxy.registerModel(mmodel);
		}
		/**
		 * 注册command控制器 
		 * @param noteName			需要关注的消息名
		 * @param commandClassRef	处理的command类
		 * 
		 */		
		public function registerCommand(noteName:String, commandClassRef:Class):void
		{
			_proxy.registerCommand(noteName,commandClassRef);
		}
		/**
		 * 注册mediator视图
		 * @param mediator
		 * @return 
		 * 
		 */		
		public function registerMediator(mediator:IMediator, viewClazz:Class = null):IMediator
		{
			return _proxy.registerMediator(mediator,viewClazz);
		}
		
		public function setProxy(proxy:IProxy):void{
			_proxy = proxy;
			configure();
		}
		
		public function getProxy():IProxy{
			return _proxy;
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
	}
}