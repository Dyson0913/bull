package com.lightUI.manager.loader
{
	import com.iflash.interfaces.IEventDispatcher;

	/**
	 * 在这里可以实现所有资源的版本控制  目前可以采用最简单的方法 所有资源公用一个版本号
	 * @author light
	 * 创建时间：2015-8-28 下午3:21:07
	 * 
	 */
	public interface IURLManager extends IEventDispatcher
	{
		//版本号
		function get version():String;
		function set version(value:String):void;
		
		//根节点
		function get root():String;
		function set root(value:String):void;
		
		//配置文件地址
		function get configURL():String;
		function set configURL(value:String):void;
			
		function getURL(name:String):String;
		//function getURLRequest(name:String):URLRequest
		
		function loadConfig(config:* = null):void;
		function getURLInfo(name:String):Object;
		
		function get config():Object;
		function set config(value:Object):void
	}
}