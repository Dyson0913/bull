package com.lightMVC.parrerns
{
	import com.lightMVC.core.Node;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.IProxy;
	
	public class Model extends Node implements IModel
	{
		private var _proxy:IProxy;
		private var _data:Object;
		
		public static const NAME:String = "Model";
		public function Model(modelName:String=null, data:Object=null)
		{
			name = (modelName != null)?modelName:NAME; 
			if (data != null) setData(data);
		}
		
		/**
		 * 获取注册过的单列 
		 * @param clazzname
		 * @return 
		 * 
		 */		
		public function getSingleton(clazzname:String):Object{
			return _proxy.getSingleton(clazzname);
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

		public function getData():Object
		{
			return _data;
		}

		public function setData(value:Object):void
		{
			_data = value;
		}

	}
}