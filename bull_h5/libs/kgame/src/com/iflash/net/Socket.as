package com.iflash.net
{
	import com.iflash.ByteArray;
	
	import laya.net.Socket;
	
	public class Socket extends laya.net.Socket
	{
		private var _outPut:ByteArray;
		
		public function Socket(host:String=null, port:int=0, byteClass:Class=null)
		{
			byteClass = byteClass?byteClass:ByteArray;
			super(host, port, byteClass);
		}
		
		override public function connectByUrl(url:String):void{
			super.connectByUrl(url);
			_outPut = super.output;
		}
		
		public function writeBytes (bytes:ByteArray, offset:uint = 0, length:uint = 0):void 
		{
			_outPut.writeBytes(bytes,offset,length);
		}
	}
}