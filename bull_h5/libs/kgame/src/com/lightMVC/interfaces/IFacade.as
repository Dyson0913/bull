package com.lightMVC.interfaces
{
	public interface IFacade
	{
		function configure(config:IConfigure):IFacade;
		//function sentNotification(notiName:String, body:Object = null):void
		function injectUI2Meditor(view:Object, meditorName:String):IFacade;
		function injectUI(view:Object):IFacade;
	}
}