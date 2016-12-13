package bull.modules.BullHall.service
{
	import com.IProtobuf.Builder;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.net.SocketConnect;
	import com.lightUI.net.SocketConnectEvent;
	
	import laya.utils.Byte;
	import laya.utils.Handler;
	import laya.utils.Timer;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.ConfigData;
	import bull.view.alert.AlertPanel;
	
	import msg.CS;
	import msg.ENCSType;
	
	/**
	 * 这里处理大厅的socket连接  
	 * @author light-k
	 * 
	 */	
	public class HallSocketService extends Model implements IModel
	{
		public static const NAME:String = "hallSocketService";
		
		private var _socket:SocketConnect;
		public var ProtoModel:BullProtoModel;
		private var num:int;
		private var timer:Timer;
		
		override public function getInjector():Array{
			return ["BullProtoModel"];
		}
		
		public function HallSocketService(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
			
			_socket = new SocketConnect();
			_socket.addEventListener(SocketConnectEvent.CONNECT,this,onSocketConnect);
			_socket.addEventListener(SocketConnectEvent.CLOSE,this,onSocketClose);
			_socket.addEventListener(SocketConnectEvent.RECEIVE,this,onMessageReveived);
			_socket.addEventListener(SocketConnectEvent.CONNECT_FAIL,this, onConnectionFailed);			
		}
		
		private function onConnectionFailed(e:SocketConnectEvent):void
		{
			trace("连接失败");
		}
		
		public function connect(host:String,port:int):void
		{
			_socket.connect(host,port);
		}
		
		public function sentMsg(message:CS):void
		{
			if( message.msg_type != ENCSType.CS_TYPE_HEART_BEAT_REQ )
				trace("发送消息给服务端：type:",message.msg_type," msg:",message);
			else
				trace("心跳消息给服务端：type:",message.msg_type," msg:",message);
				
			var byte:ArrayBuffer = message.encode().toBuffer();
			
			var builder:Builder = carProtoModel.msg_proto.CS_Builer();
			var temp:CS = builder.decode(byte);
			
			var test:Byte = new Byte(byte);
//			trace("发送二进制编码:",test);
//			trace("发送数据解码:",temp);
			_socket.sent(byte);
		}
		
		private function onSocketConnect(e:SocketConnectEvent):void{
			trace("大厅连接成功");
			num = 0;
			sentNotification(BullNotification.HALL_SOCKET_CONNECT_COMPLETE);
		}
		
		public function close():void{
			trace("大厅SocketClose");
			_socket.close();
			num = 0;
		}
		
		private function onSocketClose(e:SocketConnectEvent):void{
			clearTimer();
			Alert.show("您的网络异常，请检查网络!","",AlertPanel,null, Handler.create(this,alertClose));
		}
		
		private function alertClose():void{
			
		}
		
		private function onMessageReveived(e:SocketConnectEvent):void{
			var msgbyte:Byte = e.data as Byte;
			var input:CS = ProtoModel.msg_proto.CS_Builer().decode(msgbyte.buffer);
			if(input.msg_type != ENCSType.CS_TYPE_HEART_BEAT_RSP)
				trace("大厅服务端返回消息 type：",input.msg_type," msg:"+input);
			else
				trace("大厅心跳包返回消息 type：",input.msg_type," msg:"+input);
	
			//var input:CS = carProtoModel.CS_Builer().decode(msgbyte.buffer);
			sentNotification(input.msg_type.toString(),input);
		}
		
		public function reconnect():void
		{
			if(num>2){
				clearTimer();
				Alert.show("网络异常，请检查网络!","",AlertPanel,null, Handler.create(this,alertClose));
				return;
			}
			startTimer();
			num++;
			var config:ConfigData = getSingleton(ConfigData.NAME) as ConfigData;
			connect(config.ip, config.port);
		}
		
		private function startTimer():void{
			if(!timer)
			{
				timer = new Timer();
				timer.loop(5000,this, reconnect);
			}
		}
		
		private function clearTimer():void{
			timer.clear(this, reconnect);
			timer = null;
			num = 0;
			_socket.close();
		}
	}
}