package com.lightMVC.interfaces
{
	public interface IConfigure
	{
		function registerModel(mmodel:IModel):IModel;
		function registerCommand( noteName : String, commandClassRef : Class ) : void;
		function registerMediator(mediator:IMediator,viewClazz:Class = null):IMediator;
		
		function setProxy(proxy:IProxy):void
		function configure():void
		function getProxy():IProxy;
		
		function asSingleton(name:String,single:Class):void
	}
}