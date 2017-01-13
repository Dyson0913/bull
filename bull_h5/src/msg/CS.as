package msg
{
	import com.IProtobuf.Message;

	public class CS extends Message
	{

		public var msg_type:int = 1;
		public var conn_head:ConnHead = null;
		public var heart_beat_req:HeartBeatReq = null;
		public var heart_beat_rsp:HeartBeatRsp = null;
		public var conn_operation_notify:ConnOperationNotify = null;
		public var time_sync_req:TimeSyncReq = null;
		public var time_sync_rsp:TimeSyncRsp = null;
		public var login_req:LoginReq = null;
		public var login_rsp:LoginRsp = null;
		public var get_room_list_req:SGetRoomListReq = null;
		public var get_room_list_rsp:SGetRoomListRsp = null;
		public var try_enter_table_req:STryEnterTableReq = null;
		public var try_enter_table_rsp:STryEnterTableRsp = null;
		public var enter_table_req:SEnterTableReq = null;
		public var enter_table_rsp:SEnterTableRsp = null;
		public var carry_in_req:SCarryInReq = null;
		public var carry_in_rsp:SCarryInRsp = null;
		public var banker_req:SBankerReq = null;
		public var banker_rsp:SBankerRsp = null;
		public var bet_req:SBetReq = null;
		public var bet_rsp:SBetRsp = null;
		public var exit_table_req:SExitTableReq = null;
		public var exit_table_rsp:SExitTableRsp = null;
		public var histroy_notify:SHistroyNotify = null;
		public var timer_notify:STimerNotify = null;
		public var all_user_info_notify:SAllUserInfoNotify = null;
		public var one_user_info_notify:SOneUserInfoNotify = null;
		public var bet_notify:SBetNotify = null;
		public var deal_card_notify:SDealCardNotify = null;
		public var calculate_notify:SCalculateNotify = null;
		public var banker_list_notify:SBankerListNotify = null;
		public var banker_notify:SBankerNotify = null;
		public var banker_calc_notify:SBankerCalculateNotify = null;
		public var push_notice_notify:PushNoticeNotify = null;
		public var kick_player_notify:KickPlayerNotify = null;
		public var get_player_info_req:GetPlayerInfoReq = null;
		public var get_player_info_rsp:GetPlayerInfoRsp = null;
		public function writeTo(value:*):void{
		}
	}
}
