package com.lightMVC.interfaces
{
	public interface IMediator extends INode
	{
		//function getMediatorName():String;
		function getViewComponent():Object;
		function setViewComponent( viewComponent:Object ):void;
		function onRegister( ):void;
		function onInitialize():void;
		function onRemove( ):void;
		
		function getModel(modelName:String):IModel;
		function getMediator(mediatorName:String):IMediator;
		
		function addNotifiction(notiName:String):IMediator;
		function removeNotifiction(notiName:String):IMediator;
		function injector():void
			
		function setProxy(proxy:IProxy):void
		function sentNotification(notiName:String, body:Object = null):INode
		
		function bindingView(viewClazz:Class):void
		function get viewClazz():Class;
	}
}