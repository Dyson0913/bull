package bull.modules.room.services
{
	import com.IProtobuf.Builder;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.net.SocketConnect;
	import com.lightUI.net.SocketConnectEvent;
	
	import laya.utils.Byte;
	import laya.utils.Handler;
	import laya.utils.Timer;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.BullProtoModel;
	import light.car.modules.common.model.data.ConstData;
	import bull.modules.common.model.data.HallData;
	
	import bull.view.alert.AlertPanel;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class RoomSocketService extends Model implements IModel
	{
		public static const NAME:String = "roomSocketService";
		private var _socket:SocketConnect;
		private var bullProtoModel:BullProtoModel;
		private var num:int;
		private var timer:Timer;
		
		public function RoomSocketService(modelName:String=null, data:Object=null)
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
			// TODO Auto Generated method stub
//			Alert.show("连接失败","", AlertPanel);
			sentNotification(BullNotification.ROOM_SOCKET_CONNECT_FAILED, e.data);
		}
		
		override public function getInjector():Array{
			return ["bullProtoModel"];
		}
		
		public function connect(host:String,port:int):void
		{
			trace("游戏socket连接 Ip:",host," Port:",port);
			_socket.connect(host,port);
		}
		
		public function close():void{
			_socket.close();
		}
		
		public function sentMsg(message:CS):void
		{
			if( message.msg_type != ENCSType.CS_TYPE_HEART_BEAT_REQ )
				trace("发送消息给服务端：type:",message.msg_type," msg:",message);
			var byte:ArrayBuffer = message.encode().toBuffer();
			
			var builder:Builder = bullProtoModel.msg_proto.CS_Builer();
			var temp:CS = builder.decode(byte);
			
			var test:Byte = new Byte(byte);
//			trace("发送数据二进制编码:",test);
//			trace("发送数据解码:",temp);
			_socket.sent(byte);
		}
		
		public function hasConnected():Boolean{
			return _socket.isConnected();
		}
		
		private function onSocketConnect(e:SocketConnectEvent):void{
			trace("房间连接成功");
			clearTimer();
			sentNotification(BullNotification.ROOM_SOCKET_CONNECT_COMPLETE);
		}
		
		private function onSocketClose(e:SocketConnectEvent):void{
			
			trace("onSocketClose");
			
//			Alert.show("您的网络异常，请检查网络---------!","",AlertPanel,null, Handler.create(this,alertClose));
			sentNotification(BullNotification.RoomSocketClose);
			countRect();
//			showAlert();/////试图提示用户正在重连中
		}
		
		
		private function alertClose():void
		{
			// TODO Auto Generated method stub
			sentNotification(BullNotification.ExitRoomEvent);
		}
		
		private function onMessageReveived(e:SocketConnectEvent):void{
			var msgbyte:Byte = e.data as Byte;
			var input:CS = bullProtoModel.msg_proto.CS_Builer().decode(msgbyte.buffer);
			if(input.msg_type != ENCSType.CS_TYPE_HEART_BEAT_RSP)
				trace("房间服务端返回消息 type：",input.msg_type," msg:"+input);
			else
				trace("房间心跳返回消息 type：",input.msg_type," msg:"+input);
				
			//var input:CS = carProtoModel.CS_Builer().decode(msgbyte.buffer);
			sentNotification(input.msg_type.toString(),input);
		}
		
		public function reconnect():void
		{
			countRect();
		}
		
		private function countRect():void{
			
			trace("countRect",num, (new Date()).getTime())
			
			if(num>2){
				clearTimer();
				Alert.show("网络异常，请检查网络!","",AlertPanel,null, Handler.create(this,alertClose));
				return;
			}
			startTimer();
			num++;
			
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;						
			
			connect(hallData.ip, hallData.port);
		}
		
		private function startTimer():void{
			if(!timer)
			{
				//Light.layer.loadingMask.lock(ConstData.ROOM_RECONNECT_MASK);
				timer = new Timer();
				timer.loop(5000,this, countRect);
			}
			
		}
		
		private function clearTimer():void{
			if(!timer) return;
			//Light.layer.loadingMask.unLock(ConstData.ROOM_RECONNECT_MASK);
			timer.clear(this, countRect);
			timer = null;
			num = 0;
		}
	}
}