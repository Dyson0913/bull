package BullHall.command
{	
	
	
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	import BullHall.event.SocketEvent;
	import BullHall.model.HallAppMedel;
	import BullHall.service.SocketService;
	
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.SGetRoomListReq;
	import msg.SGetRoomListRsp;

	public class RoomListCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var socket:SocketService;
		
		public function RoomListCommand()
		{
		}
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case BullHallEvent.Roomlist_Request:
					roomlistequest();
					break;
				case String(ENCSType.CS_TYPE_GET_ROOM_LIST_RSP):
					roomlistResponse(e.data as CS);
					break;
			}
		}
		
		private function roomlistequest():void{
			var cs:CS = new CS(); 
			cs.msgType = ENCSType.CS_TYPE_GET_ROOM_LIST_REQ;
			var req:SGetRoomListReq = new SGetRoomListReq();						
			evt.dispatchEvent(new SocketEvent(SocketEvent.SEND, cs));
		}
		
		private function roomlistResponse(cs:CS):void
		{			
			var rsp:SGetRoomListRsp = cs.getRoomListRsp;
			switch(rsp.errorCode)
			{
				case 0:
					var arr:Array = rsp.roomInfos.roominfo;					
					var n:int = arr.length;
					for(var i:int =0;i<n ;i++)
					{
						var d:SRoomInfo = arr[i];
						var config:SRoomConfig = d.config;
					
						var roomOb:Object = {"cur_player":d.curPlayer,
							                                     "roomId":config.roomId,
							                                     "roomType":config.roomType,
							                                     "minBet":config.minBet,
							                                     "maxBet":config.maxBet,
							                                     "roomName":config.roomName,
							                                     "maxPlayer":config.maxPlayer,
							                                     "roomLimit":config.roomLimit,
							                                     "playerLimit":config.playerLimit,
							                                     "bankerLimit":config.bankerLimit,
							                                     "pumpRate":config.pumpRate,
							                                     "isRobbery":config.isRobbery,
							                                     "isMulti":config.isMulti,
							                                     "waterLevel":config.waterLevel														 
						                                         };
						appMedel.roomLists.push(roomOb);						
					}
					
					evt.dispatchEvent( new BullHallEvent(BullHallEvent.Update_RoomInfo));
					
					appMedel.Lobby_token = rsp.token;
					
					if (rsp.hasRoomType)
					{
						appMedel.already_join_roomType =rsp.roomType;
						appMedel.already_join_roomId = rsp.roomId;
						evt.dispatchEvent(new BullHallEvent(BullHallEvent.MsgCode_MultiOpen));						
					}
					
					break;
				default:
					evt.dispatchEvent(new BullHallEvent(BullHallEvent.ErrorCode, rsp.errorCode));
					break;
			}
		}
	}
}