package bull.modules.common.model
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import com.lightUI.core.Light;
	
	import conf.conf_game;
	
	import laya.utils.Handler;
	
	import bull.events.BullNotification;
	
	import msg.msg_cs;
	
	public class BullProtoModel extends Model implements IModel
	{
		public static const NAME:String = "BullProtoModel";
		
		public var msg_proto:msg_cs;
		public var conf_proto:conf_game;
		
		private var _callBack:Handler;
		
		public function BullProtoModel(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
			
			msg_proto = new msg_cs();
			conf_proto = new conf_game();
		}
		
		public function loadProtoFile(callBack:Handler):void{
			trace("msg_proto",this.msg_proto,this.conf_proto,this)
			_callBack = callBack;
			msg_proto.loadProtoFile(Light.loader.URLM.getURL("msg_proto"));
			conf_proto.loadProtoFile(Light.loader.URLM.getURL("conf_proto"));
			
			_callBack.run();
			sentNotification(BullNotification.PROTO_CREAT);
		}
	}
}