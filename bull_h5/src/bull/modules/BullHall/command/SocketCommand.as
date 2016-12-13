package BullHall.command
{
	import BullHall.event.SocketEvent;
	import BullHall.model.GameConfig;
	import BullHall.service.HeartService;
	import BullHall.service.SocketService;
	
	import msg.CS;
	
	/**
	 * 接收此消息 开始连接服务器
	 */
	public class SocketCommand
	{
		[Inject]
		public var socket:SocketService;
		
		[Inject]
		public var heart:HeartService;
		
		[Inject]
		public var config:GameConfig;
		
		public function execute(e:SocketEvent):void
		{
			switch(e.type)
			{
				case SocketEvent.CONNECT: 
					socket.socket.retryTimes = 3;
					socket.connect(config.ip,config.port);
					break;
				case SocketEvent.SEND:
					if(socket) socket.send(e.data as CS);
					break;
				case SocketEvent.No_Heart_No_Net:
					if(socket) socket.noNetAndReconnect();
					break;
			}
		}
		
	}
}