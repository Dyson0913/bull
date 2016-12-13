package com.lightMVC.parrerns
{
	import com.lightMVC.interfaces.INotification;
	
	public class Notification implements INotification
	{
		private var _name:String;
		private var _body:Object;
		
		public function Notification(name:String,body:Object = null)
		{
			_name = name;
			_body = body;
		}
		
		public function getName():String
		{
			return _name;
		}
		
		public function setName(value:String):void
		{
			_name = value;
		}
		
		public function setBody(body:Object):void
		{
			_body = body;
		}
		
		public function getBody():Object
		{
			return _body;
		}
		
		public function toString():String
		{
			return null;
		}
	}
}