package com.IProtobuf
{
	import laya.utils.Browser;

	public class Long
	{
		private static var Long:* = Browser.window.dcodeIO.Long;
		
		public function Long()
		{
		}
		
		public function toNumber():*{
			
		}
		
		public static function fromNumber(value:Number):*{
			return Long.Long.fromNumber(value);
		}
	}
}