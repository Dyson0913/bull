package com.lightMVC.parrerns
{
	import com.lightMVC.core.Proxy;
	import com.lightMVC.interfaces.IConfigure;
	import com.lightMVC.interfaces.IFacade;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.IProxy;

	/**
	 * mvc总管 入口   可以继承此类并设计为单列 方便调用 
	 * @author light-k
	 * 
	 * TODO: 可以考虑增加 asSingleton 数据层直接发送时间 摆脱 model束缚
	 * 
	 */	
	public class Facade implements IFacade
	{
		private var _proxy:IProxy = new Proxy();
		
		public function Facade()
		{
		}
		
		/**
		 * 配置mvc流程  注册command mediator model 都可以在 IConfigure 配置类里进行
		 * @param config	配置类
		 * @return 			返回入口类
		 * 
		 */		
		public function configure(config:IConfigure):IFacade{
			config.setProxy(_proxy);
			_proxy.injectorAll();
			return this;
		}
		
		public function injectUI2Meditor(view:Object, meditorName:String):IFacade{
			var mediator:IMediator = _proxy.getMediator(meditorName);
			if(mediator) _proxy.getMediator(meditorName).setViewComponent(view);
			else trace(view.name+"没有注册meditor");
			return this;
		}
		
		public function injectUI(view:Object):IFacade{
			var mediatorMap:Array = _proxy.mediatorMap;
			for each (var mediator:IMediator in mediatorMap) 
			{
				if(view is mediator.viewClazz){
					mediator.setViewComponent(view);
				}
			}
			
			return this;
		}
		
		/**
		 * 提供给子类使用 发送消息
		 * @param notiName	消息名称
		 * @param body		消息携带的参数
		 * 
		 */		
		protected function sentNotification(notiName:String, body:Object = null):void{
			_proxy.sentNotification(new Notification(notiName, body));
		}
	}
}