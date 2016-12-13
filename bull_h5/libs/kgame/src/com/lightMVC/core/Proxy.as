package com.lightMVC.core
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.IHandle;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.interfaces.INode;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.interfaces.IProxy;
	
	import laya.utils.Dictionary;
	
	import light.car.modules.common.model.data.HallData;
	import light.car.modules.common.model.data.RoomData;
	import light.car.view.hall.Hall;
	
	public class Proxy implements IProxy
	{
//		private var _dispatcher:INofiticationDispatcher = new NofiticationDispatcher();
		
		private var _commandMap:Array = [];/////////////以name为key
		private var _mediatorMap:Array = [];
		private var _modelMap:Array = [];
		
		private var _singleMap:Array = [];
		
		private var _notoViewMap:Array = [];
		private var _notoCommMap:Array = [];
		
		public function Proxy()
		{
		}
		
		public function asSingleton(name:String,clazz:Class):void{
			trace("asSingleton",name);
			if(_singleMap[name]) throw new Error("asSingleton() 单例不能重名");
			_singleMap[name] = new SingleInfo(name,new clazz());
		}
		public function getSingleton(clazzname:String):Object{
			var info:SingleInfo = _singleMap[clazzname];
			return info?info.single:null;
		}
		
		public function registerModel(model:IModel):IModel
		{
			//trace("registerModel",mmodel,mmodel.getName, mmodel is IModel,mmodel is TestModel)
			_modelMap[model.getName()] = model;
			model.setProxy(this);
			model.onRegister();
			if(model.getInjector().length == 0) model.onInitialize();
			return model;
		}
		
		public function getModel(modelName:String):IModel
		{
			return _modelMap[modelName];
		}
		
		public function hasModel(modelName:String):Boolean
		{
			return (_modelMap[_modelMap] == null)?false:true;
		}
		
		public function removeModel(modelName:String):void
		{
			var model:IModel = _modelMap[modelName];
			delete _modelMap[modelName];
			model.onRemove();
			model = null;
		}
		
		public function registerCommand( noteName : String, commandClassRef : Class ) : void
		{
			_commandMap[commandClassRef] = commandClassRef;
			registerNotificationCommand(noteName,commandClassRef);
		}
		
//		public function creatCommand(noteName:String):ICommand{
//			var clazz:Class = _commandMap[noteName];
//			if(clazz == null) return null;
//			else return new clazz();
//		}
		
		public function hasCommand(commandClassRef:Class):Boolean
		{
			return (_commandMap[commandClassRef] == null)?false:true;
		}
		
		public function removeCommand(commandClassRef:Class):void
		{
			delete _commandMap[commandClassRef];
			removeNotificationCommand(commandClassRef);
		}
		
		public function registerMediator(mediator:IMediator, viewClazz:Class = null):IMediator
		{
			_mediatorMap[mediator.getName()] = mediator;
			mediator.setProxy(this);
			mediator.onRegister();
			mediator.bindingView(viewClazz);
			if(mediator.getInjector().length == 0) mediator.onInitialize();
			return mediator;
		}
		
		public function getMediator(mediatorName:String):IMediator
		{
			return _mediatorMap[mediatorName];
		}
		
		public function hasMediator(mediatorName:String):Boolean
		{
			return (_mediatorMap[mediatorName] == null)?false:true;
		}
		
		public function removeMediator(mediatorName:String):void
		{
			var mediator:IMediator = getMediator(mediatorName);
			if(mediator == null) return;
			delete _mediatorMap[mediatorName];
			removeAllNotificationMediator(mediatorName);
			mediator.onRemove();
		}
		
		public function registerNotificationMediator(notiName:String, mediator:IMediator):void{
			if(_notoViewMap[notiName] == null) _notoViewMap[notiName] = [];
			(_notoViewMap[notiName] as Array).push(mediator);
		}
		public function removeOneNotificationMediator(notiName:String, mediator:IMediator):void{
			var handler:INode;
			var items:Array = _notoViewMap[notiName];
			if(items == null) return;
			var l:int = items.length;
			for (var i:int = 0; i < l; i++) 
			{
				handler = items[i];
				if(handler == mediator){
					items.splice(i,1);
				}
			}
		}
		public function removeAllNotificationMediator(nodename:String):void{
			var handler:INode
			for each (var item:Array in _notoViewMap) 
			{
				if(item){
					//trace("item",item)
					for (var i:int = 0; i < item.length; i++) 
					{
						handler = item[i];
						if(handler != null && handler.getName() == nodename){
							item.splice(i,1);
						}
					}
				}
			}
		}
		
		public function registerNotificationCommand(nofiticationName:String, commandClassRef : Class):void{
			if(_notoCommMap[nofiticationName] == null) _notoCommMap[nofiticationName] = [];
			(_notoCommMap[nofiticationName] as Array).push(commandClassRef);
		}
		public function removeNotificationCommand(commandClassRef:Class):void{
			var comm:Class;
			for each (var item:Array in _notoCommMap) 
			{
				if(item){
					//trace("item",item)
					for (var i:int = 0; i < item.length; i++) 
					{
						comm = item[i];
						if(comm == commandClassRef) item.splice(i,1);
					}
				}
			}
		}
		
		public function sentNotification(notification:INotification):void
		{
			sendViewModle(notification);
			sendCommand(notification);
		}
		private function sendViewModle(notification:INotification):void{
			var list:Array = _notoViewMap[notification.getName()];
			if(list == null) return;
			var l:int = list.length;
			var handler:IHandle;
			for (var i:int = 0; i < list.length; i++) 
			{
				handler = list[i];
				handler.handler(notification);
			}
		}
		private function sendCommand(notification:INotification):void{
			var list:Array = _notoCommMap[notification.getName()];
			if(list == null) return;
			var l:int = list.length;
			var clazz:Class;
			var command:ICommand;
			for (var i:int = 0; i < list.length; i++) 
			{
				clazz = list[i];
				command = new clazz();
				command.setProxy(this);
				(command as IHandle).handler(notification);
				//(new clazz() as INode).setProxy(this);
				//(new clazz() as IHandle).handler(notification);
			}
		}
		public function injectorAll():void{
			injectorMediator();
			injectorModle();
			inJectorSingle();
		}
		private function inJectorSingle():void{
			for each (var single:SingleInfo in _singleMap) 
			{
				trace("inJectorSingle",single.name)
				if(single.isInitialize) continue;
				inJectorSingleHandler(single.single["injector"],single.single);
			}
		}
		private function inJectorSingleHandler(injectors:Array, single:Object):void{
			//trace("inJectorSingleHandler",injectors)
			if(!injectors) return;
			var item:Object;
			var key:String;
			var l:int = injectors.length;
			for (var i:int = 0; i < l; i++) 
			{
				key = injectors[i];
				item = getSingleton(key);
				
				if(item){
					single[key] = item;
				}else{
					trace("要注入的"+key+"对象不存在 请检查注入名是否正确 或者确保注入对象已经注册成功！！！");
				}
				single.isInitialize = true;
			}
		}
		private function injectorMediator():void{
			for each (var mediator:IMediator in _mediatorMap) 
			{
				if(mediator.isInitialize) continue;
				injector(mediator.getInjector(),mediator);
				if(mediator.getInjector().length > 0){
					mediator.onInitialize();
					mediator.isInitialize = true;
				}
			}
		}
		private function injectorModle():void{
			for each (var model:IModel in _modelMap) 
			{
				if(model.isInitialize) continue;
				injector(model.getInjector(),model);
				if(model.getInjector().length > 0){
					model.onInitialize();
					model.isInitialize = true;
				}
			}
		}
		public function injector(injectors:Array, node:INode):void{
			
				var item:Object;
				var key:String;
				var l:int = injectors.length;
				for (var i:int = 0; i < l; i++) 
				{
					key = injectors[i];
					item = getNode(key);
					if(item){
						node[key] = item;
					}else{
						trace("injector"+node.getName()+"要注入的"+key+"对象不存在 请检查注入名是否正确 或者确保注入对象已经注册成功！！！");
						//trace("injector: ",node.getName(),key,node[key],item);
					}
				}
		}
		private function getNode(name:String):Object{
			var node:Object;
			node = getMediator(name);
			if(node) return node;
			node = getModel(name);
			if(node) return node;
			node = getSingleton(name);
			if(node) return node;
			return null;
		}

		public function get mediatorMap():Array
		{
			return _mediatorMap;
		}

	}
}

class SingleInfo{
	public var isInitialize:Boolean = false;
	public var name:String;
	public var single:Object = null;
	public function SingleInfo(name:String,single:Object):void{
		this.single = single;
	}
}