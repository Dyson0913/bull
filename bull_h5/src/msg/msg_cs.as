package msg
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class msg_cs
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function ConnHead_Builer():Builder{
			return builder.build("msg")["ConnHead"];
		};
		public function getConnHead():ConnHead{
			var clazz:* = builder.build("msg")["ConnHead"];
			return new clazz();
		};
		public function ENPlatformType_Builer():Builder{
			return builder.build("msg")["ENPlatformType"];
		};
		public function getENPlatformType():ENPlatformType{
			var clazz:* = builder.build("msg")["ENPlatformType"];
			return new clazz();
		};
		public function ENError_Builer():Builder{
			return builder.build("msg")["ENError"];
		};
		public function getENError():ENError{
			var clazz:* = builder.build("msg")["ENError"];
			return new clazz();
		};
		public function ConnSvrInfo_Builer():Builder{
			return builder.build("msg")["ConnSvrInfo"];
		};
		public function getConnSvrInfo():ConnSvrInfo{
			var clazz:* = builder.build("msg")["ConnSvrInfo"];
			return new clazz();
		};
		public function LoginReq_Builer():Builder{
			return builder.build("msg")["LoginReq"];
		};
		public function getLoginReq():LoginReq{
			var clazz:* = builder.build("msg")["LoginReq"];
			return new clazz();
		};
		public function LoginRsp_Builer():Builder{
			return builder.build("msg")["LoginRsp"];
		};
		public function getLoginRsp():LoginRsp{
			var clazz:* = builder.build("msg")["LoginRsp"];
			return new clazz();
		};
		public function HeartBeatReq_Builer():Builder{
			return builder.build("msg")["HeartBeatReq"];
		};
		public function getHeartBeatReq():HeartBeatReq{
			var clazz:* = builder.build("msg")["HeartBeatReq"];
			return new clazz();
		};
		public function HeartBeatRsp_Builer():Builder{
			return builder.build("msg")["HeartBeatRsp"];
		};
		public function getHeartBeatRsp():HeartBeatRsp{
			var clazz:* = builder.build("msg")["HeartBeatRsp"];
			return new clazz();
		};
		public function TimeSyncReq_Builer():Builder{
			return builder.build("msg")["TimeSyncReq"];
		};
		public function getTimeSyncReq():TimeSyncReq{
			var clazz:* = builder.build("msg")["TimeSyncReq"];
			return new clazz();
		};
		public function TimeSyncRsp_Builer():Builder{
			return builder.build("msg")["TimeSyncRsp"];
		};
		public function getTimeSyncRsp():TimeSyncRsp{
			var clazz:* = builder.build("msg")["TimeSyncRsp"];
			return new clazz();
		};
		public function ENConnOperationType_Builer():Builder{
			return builder.build("msg")["ENConnOperationType"];
		};
		public function getENConnOperationType():ENConnOperationType{
			var clazz:* = builder.build("msg")["ENConnOperationType"];
			return new clazz();
		};
		public function ConnOperationNotify_Builer():Builder{
			return builder.build("msg")["ConnOperationNotify"];
		};
		public function getConnOperationNotify():ConnOperationNotify{
			var clazz:* = builder.build("msg")["ConnOperationNotify"];
			return new clazz();
		};
		public function ExitTableReq_Builer():Builder{
			return builder.build("msg")["ExitTableReq"];
		};
		public function getExitTableReq():ExitTableReq{
			var clazz:* = builder.build("msg")["ExitTableReq"];
			return new clazz();
		};
		public function ExitTableRsp_Builer():Builder{
			return builder.build("msg")["ExitTableRsp"];
		};
		public function getExitTableRsp():ExitTableRsp{
			var clazz:* = builder.build("msg")["ExitTableRsp"];
			return new clazz();
		};
		public function SGetRoomListReq_Builer():Builder{
			return builder.build("msg")["SGetRoomListReq"];
		};
		public function getSGetRoomListReq():SGetRoomListReq{
			var clazz:* = builder.build("msg")["SGetRoomListReq"];
			return new clazz();
		};
		public function SGetRoomListRsp_Builer():Builder{
			return builder.build("msg")["SGetRoomListRsp"];
		};
		public function getSGetRoomListRsp():SGetRoomListRsp{
			var clazz:* = builder.build("msg")["SGetRoomListRsp"];
			return new clazz();
		};
		public function STryEnterTableReq_Builer():Builder{
			return builder.build("msg")["STryEnterTableReq"];
		};
		public function getSTryEnterTableReq():STryEnterTableReq{
			var clazz:* = builder.build("msg")["STryEnterTableReq"];
			return new clazz();
		};
		public function STryEnterTableRsp_Builer():Builder{
			return builder.build("msg")["STryEnterTableRsp"];
		};
		public function getSTryEnterTableRsp():STryEnterTableRsp{
			var clazz:* = builder.build("msg")["STryEnterTableRsp"];
			return new clazz();
		};
		public function SEnterTableReq_Builer():Builder{
			return builder.build("msg")["SEnterTableReq"];
		};
		public function getSEnterTableReq():SEnterTableReq{
			var clazz:* = builder.build("msg")["SEnterTableReq"];
			return new clazz();
		};
		public function SEnterTableRsp_Builer():Builder{
			return builder.build("msg")["SEnterTableRsp"];
		};
		public function getSEnterTableRsp():SEnterTableRsp{
			var clazz:* = builder.build("msg")["SEnterTableRsp"];
			return new clazz();
		};
		public function SCarryInReq_Builer():Builder{
			return builder.build("msg")["SCarryInReq"];
		};
		public function getSCarryInReq():SCarryInReq{
			var clazz:* = builder.build("msg")["SCarryInReq"];
			return new clazz();
		};
		public function SCarryInRsp_Builer():Builder{
			return builder.build("msg")["SCarryInRsp"];
		};
		public function getSCarryInRsp():SCarryInRsp{
			var clazz:* = builder.build("msg")["SCarryInRsp"];
			return new clazz();
		};
		public function SBankerReq_Builer():Builder{
			return builder.build("msg")["SBankerReq"];
		};
		public function getSBankerReq():SBankerReq{
			var clazz:* = builder.build("msg")["SBankerReq"];
			return new clazz();
		};
		public function SBankerRsp_Builer():Builder{
			return builder.build("msg")["SBankerRsp"];
		};
		public function getSBankerRsp():SBankerRsp{
			var clazz:* = builder.build("msg")["SBankerRsp"];
			return new clazz();
		};
		public function SBetReq_Builer():Builder{
			return builder.build("msg")["SBetReq"];
		};
		public function getSBetReq():SBetReq{
			var clazz:* = builder.build("msg")["SBetReq"];
			return new clazz();
		};
		public function SBetRsp_Builer():Builder{
			return builder.build("msg")["SBetRsp"];
		};
		public function getSBetRsp():SBetRsp{
			var clazz:* = builder.build("msg")["SBetRsp"];
			return new clazz();
		};
		public function SExitTableReq_Builer():Builder{
			return builder.build("msg")["SExitTableReq"];
		};
		public function getSExitTableReq():SExitTableReq{
			var clazz:* = builder.build("msg")["SExitTableReq"];
			return new clazz();
		};
		public function SExitTableRsp_Builer():Builder{
			return builder.build("msg")["SExitTableRsp"];
		};
		public function getSExitTableRsp():SExitTableRsp{
			var clazz:* = builder.build("msg")["SExitTableRsp"];
			return new clazz();
		};
		public function SHistroyNotify_Builer():Builder{
			return builder.build("msg")["SHistroyNotify"];
		};
		public function getSHistroyNotify():SHistroyNotify{
			var clazz:* = builder.build("msg")["SHistroyNotify"];
			return new clazz();
		};
		public function STimerNotify_Builer():Builder{
			return builder.build("msg")["STimerNotify"];
		};
		public function getSTimerNotify():STimerNotify{
			var clazz:* = builder.build("msg")["STimerNotify"];
			return new clazz();
		};
		public function SAllUserInfoNotify_Builer():Builder{
			return builder.build("msg")["SAllUserInfoNotify"];
		};
		public function getSAllUserInfoNotify():SAllUserInfoNotify{
			var clazz:* = builder.build("msg")["SAllUserInfoNotify"];
			return new clazz();
		};
		public function SOneUserInfoNotify_Builer():Builder{
			return builder.build("msg")["SOneUserInfoNotify"];
		};
		public function getSOneUserInfoNotify():SOneUserInfoNotify{
			var clazz:* = builder.build("msg")["SOneUserInfoNotify"];
			return new clazz();
		};
		public function SBetNotify_Bet_Builer():Builder{
			return builder.build("msg")["SBetNotify_Bet"];
		};
		public function getSBetNotify_Bet():SBetNotify_Bet{
			var clazz:* = builder.build("msg")["SBetNotify_Bet"];
			return new clazz();
		};
		public function SBetNotify_Builer():Builder{
			return builder.build("msg")["SBetNotify"];
		};
		public function getSBetNotify():SBetNotify{
			var clazz:* = builder.build("msg")["SBetNotify"];
			return new clazz();
		};
		public function SDealCardNotify_Builer():Builder{
			return builder.build("msg")["SDealCardNotify"];
		};
		public function getSDealCardNotify():SDealCardNotify{
			var clazz:* = builder.build("msg")["SDealCardNotify"];
			return new clazz();
		};
		public function SCalculateNotify_Builer():Builder{
			return builder.build("msg")["SCalculateNotify"];
		};
		public function getSCalculateNotify():SCalculateNotify{
			var clazz:* = builder.build("msg")["SCalculateNotify"];
			return new clazz();
		};
		public function SBankerListNotify_Builer():Builder{
			return builder.build("msg")["SBankerListNotify"];
		};
		public function getSBankerListNotify():SBankerListNotify{
			var clazz:* = builder.build("msg")["SBankerListNotify"];
			return new clazz();
		};
		public function SBankerNotify_Builer():Builder{
			return builder.build("msg")["SBankerNotify"];
		};
		public function getSBankerNotify():SBankerNotify{
			var clazz:* = builder.build("msg")["SBankerNotify"];
			return new clazz();
		};
		public function SBankerCalculateNotify_Builer():Builder{
			return builder.build("msg")["SBankerCalculateNotify"];
		};
		public function getSBankerCalculateNotify():SBankerCalculateNotify{
			var clazz:* = builder.build("msg")["SBankerCalculateNotify"];
			return new clazz();
		};
		public function NoticeInfo_Builer():Builder{
			return builder.build("msg")["NoticeInfo"];
		};
		public function getNoticeInfo():NoticeInfo{
			var clazz:* = builder.build("msg")["NoticeInfo"];
			return new clazz();
		};
		public function PushNoticeNotify_Builer():Builder{
			return builder.build("msg")["PushNoticeNotify"];
		};
		public function getPushNoticeNotify():PushNoticeNotify{
			var clazz:* = builder.build("msg")["PushNoticeNotify"];
			return new clazz();
		};
		public function ENKickReason_Builer():Builder{
			return builder.build("msg")["ENKickReason"];
		};
		public function getENKickReason():ENKickReason{
			var clazz:* = builder.build("msg")["ENKickReason"];
			return new clazz();
		};
		public function KickPlayerNotify_Builer():Builder{
			return builder.build("msg")["KickPlayerNotify"];
		};
		public function getKickPlayerNotify():KickPlayerNotify{
			var clazz:* = builder.build("msg")["KickPlayerNotify"];
			return new clazz();
		};
		public function ENCSType_Builer():Builder{
			return builder.build("msg")["ENCSType"];
		};
		public function getENCSType():ENCSType{
			var clazz:* = builder.build("msg")["ENCSType"];
			return new clazz();
		};
		public function CS_Builer():Builder{
			return builder.build("msg")["CS"];
		};
		public function getCS():CS{
			var clazz:* = builder.build("msg")["CS"];
			return new clazz();
		};
	}
}
