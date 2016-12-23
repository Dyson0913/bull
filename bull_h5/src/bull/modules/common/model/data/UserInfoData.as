package bull.modules.common.model.data
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.events.LightEvent;
	
	public class UserInfoData extends EventDispatcher
	{
		private var _name:String;//////玩家名字
		private var _balance:int;//////玩家余额
		private var _bonus:int;////////玩家盈利
		private var _moneyType:int; ////////玩家货币类型
		private var _headIcon:String;
		
		public static const NAME:String = "userInfoData";
		
		//-----------------event-----------------
		
		public function UserInfoData()
		{
			super();
		}
		
		public function get moneyType():int
		{
			return _moneyType;
		}

		public function set moneyType(value:int):void
		{
			_moneyType = value;
		}

		public function toString():String{
			return "{name:"+_name+",balance:"+_balance+":bonus:"+_bonus+"}";
		}
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
			dispatchEventDelay(new LightEvent(LightEvent.CHANGE));
		}

		public function get balance():int
		{
			return _balance;
		}

		public function set balance(value:int):void
		{
			trace("userbalance sss");
			_balance = value;
			dispatchEventDelay(new LightEvent(LightEvent.CHANGE));
		}

		public function get bonus():int
		{
			return _bonus;
		}

		public function set bonus(value:int):void
		{
			_bonus = value;
			dispatchEventDelay(new LightEvent(LightEvent.CHANGE));
		}
		
		public function get headIcon():String
		{
			return _headIcon;
		}
		public function set headIcon(value:String):void
		{
			_headIcon = value;
		}
	}
}