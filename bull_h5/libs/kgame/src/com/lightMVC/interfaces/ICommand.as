package com.lightMVC.interfaces
{
	public interface ICommand extends INode
	{
		function getModel(modelName:String):IModel;
		function getMediator(mediatorName:String):IMediator;
		function getSingleton(clazzname:String):Object;
		
		function setProxy(proxy:IProxy):void
		function sentNotification(notiName:String, body:Object = null):INode
		function injector():void
	}
}