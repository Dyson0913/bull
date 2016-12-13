package com.lightMVC.parrerns
{
	import com.lightMVC.core.Node;
	import com.lightMVC.interfaces.IHandle;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.interfaces.IProxy;
	
	public class Mediator extends Node implements IMediator, IHandle
	{
		private var _proxy:IProxy;
		public static const NAME:String = "Mediator";
			
		protected var viewComponent:Object;
		
		private var _viewClazz:Class;
		
		public function Mediator(mediatorName:String = "",viewComponent:Object = null)
		{
			name = (mediatorName != null)?mediatorName:NAME; 
			this.viewComponent = viewComponent;	
		}
		/**
		 * 添加关注的消息名称 
		 * @param notiName	关注的消息名称
		 * @return 
		 * 
		 */		
		public function addNotifiction(notiName:String):IMediator{
			_proxy.registerNotificationMediator(notiName,this);
			return this;
		}
		/**
		 * 删除关注的消息 
		 * @param notiName	消息名称
		 * @return 
		 * 
		 */		
		public function removeNotifiction(notiName:String):IMediator{
			_proxy.removeOneNotificationMediator(notiName,this);
			return this;
		}
		/**
		 * 获取UI 
		 * @return 
		 * 
		 */		
		public function getViewComponent():Object
		{
			return viewComponent;
		}
		/**
		 * 设置UI 
		 * @param viewComponent
		 * 
		 */		
		public function setViewComponent(viewComponent:Object):void
		{
			this.viewComponent = viewComponent;
		}
		/**
		 * 调用此方法 完成参数注入   参数需在 getInjector()数组里申明 
		 * 
		 */	
		public function injector():void{
			_proxy.injector(getInjector(),this);
		}
		
		public function setProxy(proxy:IProxy):void{
			_proxy = proxy;
		}
		/**
		 * 获取model数据 
		 * @param modelName
		 * @return 
		 * 
		 */		
		public function getModel(modelName:String):IModel{
			return _proxy.getModel(modelName);
		}
		/**
		 * 获取mediatot视图 
		 * @param mediatorName
		 * @return 
		 * 
		 */		
		public function getMediator(mediatorName:String):IMediator{
			return _proxy.getMediator(mediatorName);
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
		 * 注册完成后触发此函数
		 * 
		 */		
		public function onRegister():void
		{
		}
		/**
		 * 初始化完成后触发此函数   如需获取其它注册对象  需在此函数执行后  否则不能确保获取成功 
		 * 
		 */		
		public function onInitialize():void{
			
		}
		/**
		 * 被移除时候调用此函数 
		 * 
		 */		
		public function onRemove():void
		{
		}
		/**
		 * 消息处理函数  子类可以重写此方法 
		 * @param notification
		 * 
		 */	
		public function handler(notification:INotification):void
		{
		}

		/**
		 * 绑定关注的视图类 
		 * @param viewClazz
		 * 
		 */		
		public function bindingView(viewClazz:Class):void{
			_viewClazz = viewClazz;
		}
		
		public function get viewClazz():Class
		{
			return _viewClazz;
		}

	}
}