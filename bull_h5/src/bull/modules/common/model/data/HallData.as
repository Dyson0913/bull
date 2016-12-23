package bull.modules.common.model.data
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.events.LightEvent;
	
	import bull.modules.common.model.data.vo.HallRoomVO;	
	
	[Event(name="change", type="com.lightUI.events.LightEvent")]
	public class HallData extends EventDispatcher
	{
		
		
		public static const NAME:String = "hallData";
		
		
		private var _roomList:Array;////////////HallRoomVO
		
		public function getHallRoomInfoById(tableId:int):HallRoomVO{
			for each(var roomVo:HallRoomVO in _roomList){
				if(roomVo.id == tableId) return roomVo;
			}
			return null;
		}
		
		public function HallData()
		{
			super();
		}
		
		public function get roomList():Array
		{
			return _roomList;
		}

		public function set roomList(value:Array):void
		{
			//trace("set roomList",value);
			_roomList = value;
			this.dispatchEvent(new LightEvent(LightEvent.CHANGE));
		}

	}
}