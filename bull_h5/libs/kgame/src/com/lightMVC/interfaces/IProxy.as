package com.lightMVC.interfaces
{

	public interface IProxy
	{
		function registerModel(model:IModel):IModel;
		function getModel(modelName:String):IModel;
		function hasModel(modelName:String):Boolean;
		function removeModel(modelName:String):void;
			
		function registerCommand( noteName : String, commandClassRef : Class ) : void;
//		function creatCommand(noteName:String):ICommand;
		function hasCommand(commandClassRef : Class):Boolean;
		function removeCommand(commandClassRef : Class):void;
			
		function registerMediator(mediator:IMediator, viewClazz:Class = null):IMediator;
		function getMediator(mediatorName:String):IMediator;
		function hasMediator(mediatorName:String):Boolean;
		function removeMediator(mediatorName:String):void;
			
		function sentNotification(notification:INotification):void;
		function registerNotificationMediator(notiName:String, mediator:IMediator):void;
		function registerNotificationCommand(nofiticationName:String, commandClassRef : Class):void;
		
		function removeNotificationCommand(commandClassRef:Class):void
		function removeOneNotificationMediator(notiName:String, mediator:IMediator):void;
		function removeAllNotificationMediator(nodename:String):void;
		
		function asSingleton(name:String,single:Class):void;
		function getSingleton(clazzname:String):Object;
			
		function injectorAll():void;
		function injector(injectors:Array,node:INode):void;
		
		function get mediatorMap():Array;
	}
}