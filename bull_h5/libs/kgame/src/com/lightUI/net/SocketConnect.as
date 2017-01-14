package com.lightUI.net
{
	import com.iflash.events.EventDispatcher;
	import com.iflash.utils.ByteArray;
	
	import laya.events.Event;
	import laya.net.Socket;
	import laya.utils.Byte;

	public class SocketConnect extends EventDispatcher
	{
		private var _socket:Socket;
		private var _receiveBytes:ByteArray;
		private var _msgBytes:ByteArray;
		private var _sendBytes:ByteArray;
		
		private var _host:String;
		private var _port:int;
		
		private var _retryTimes:int = 0;//////////////////////////////-1为不断重连
		private var _currRetryTimes:int = 0;///////////////////////////当前连接的次数
		private var _interval:int   = 3000;////////////////////////////重连间隔
		
		public var isReConnect:Boolean = false;//////////////////////标记是否为重连
		public var name:String;
		
		private var _isConnectError:Boolean = false;
		
		public function SocketConnect()
		{
			init();
		}
		
		private function init():void{
			_receiveBytes = new ByteArray();
			_sendBytes = new ByteArray();
			
			_socket = new Socket();
			
			_socket.endian = Socket.BIG_ENDIAN;
			
			_socket.on(Event.OPEN, this, onSocketOpen);
			_socket.on(Event.CLOSE, this, onSocketClose);
			_socket.on(Event.MESSAGE, this, onMessageReveived);
			_socket.on(Event.ERROR, this, onConnectError);
		}
		
		private function onConnectError():void
		{
			trace("onConnectError");
			_isConnectError = true;
			this.dispatchEvent(new SocketConnectEvent(SocketConnectEvent.CONNECT_FAIL));
		}
		
		/**
		 *连接服务器 
		 * @param host
		 * @param port
		 * 
		 */		
		public function connect(host:String,port:int):void
		{
			_host = host;
			_port = port;
			
			trace("[SocketConnect] ","connect",host,port,_currRetryTimes,_retryTimes);
			_socket.connect(host,port);
			
			_currRetryTimes++;
			
		}
		
		public function sent(msg:ArrayBuffer):void{
			if(!_socket || !_socket.output) return;
			var _dataByte:Byte = new Byte(msg);
			(_socket.output as Byte).writeArrayBuffer(msg,0,msg.byteLength);
			_socket.flush();
		}
		
		public function close():void{
			_socket.close();
		}
		
		public function isConnected():Boolean{
			return _socket.connected;
		}
		
		private var _lengthNeedReceived:int;
		private var _hasReededHead:Boolean;
		private var _dataByte:Byte;
		/**
		 *收到数据 
		 * @param evt
		 * 
		 */		
		private function onMessageReveived(message:*=null):void
		{
			if (message is String) {
				trace("is String");
			} else if (message is ArrayBuffer) {
				
				
				
				_dataByte = new Byte(message);
				_dataByte.endian = Socket.BIG_ENDIAN;
				
				
				
				this.dispatchEvent(new SocketConnectEvent(SocketConnectEvent.RECEIVE,_dataByte));
			}
		}
		
		private function onSocketOpen(evt:Event = null):void
		{
			trace('Socket connect success！',_port);
			_currRetryTimes = 0;
			this.dispatchEvent(new SocketConnectEvent(SocketConnectEvent.CONNECT));
		}
		
		private function onSocketClose(evt:Event = null):void
		{
			trace("onSocketClose")
			
			if(_isConnectError){
				_isConnectError = false;
				return;
			}
			
			//trace("close: ",evt);
			clear();
			this.dispatchEvent(new SocketConnectEvent(SocketConnectEvent.CLOSE));
			this.dispatchEvent(new SocketConnectEvent(SocketConnectEvent.DROPPED));
			//setTimeout(connect, _interval, _host, _port);
			//reconnect();
		}
		
		private function clear():void{
			_currRetryTimes = 0;
		}
	}
}