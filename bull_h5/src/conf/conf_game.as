package conf
{

	import com.IProtobuf.Builder
	import laya.utils.Browser
	public class conf_game
	{
		private var ProtoBuf:* = Browser.window.dcodeIO.ProtoBuf
		private var builder:*
		public function loadProtoFile(protoPath:String):void{
			builder = ProtoBuf.loadProtoFile(protoPath)
		}
		public function Scope_Builer():Builder{
			return builder.build("conf")["Scope"];
		};
		public function getScope():Scope{
			var clazz:* = builder.build("conf")["Scope"];
			return new clazz();
		};
		public function Scope64_Builer():Builder{
			return builder.build("conf")["Scope64"];
		};
		public function getScope64():Scope64{
			var clazz:* = builder.build("conf")["Scope64"];
			return new clazz();
		};
		public function ENMoneyType_Builer():Builder{
			return builder.build("conf")["ENMoneyType"];
		};
		public function getENMoneyType():ENMoneyType{
			var clazz:* = builder.build("conf")["ENMoneyType"];
			return new clazz();
		};
		public function Money_Builer():Builder{
			return builder.build("conf")["Money"];
		};
		public function getMoney():Money{
			var clazz:* = builder.build("conf")["Money"];
			return new clazz();
		};
		public function Prop_Builer():Builder{
			return builder.build("conf")["Prop"];
		};
		public function getProp():Prop{
			var clazz:* = builder.build("conf")["Prop"];
			return new clazz();
		};
		public function ENTableType_Builer():Builder{
			return builder.build("conf")["ENTableType"];
		};
		public function getENTableType():ENTableType{
			var clazz:* = builder.build("conf")["ENTableType"];
			return new clazz();
		};
		public function Table_Builer():Builder{
			return builder.build("conf")["Table"];
		};
		public function getTable():Table{
			var clazz:* = builder.build("conf")["Table"];
			return new clazz();
		};
		public function DirtyWord_Builer():Builder{
			return builder.build("conf")["DirtyWord"];
		};
		public function getDirtyWord():DirtyWord{
			var clazz:* = builder.build("conf")["DirtyWord"];
			return new clazz();
		};
		public function ENNoticeType_Builer():Builder{
			return builder.build("conf")["ENNoticeType"];
		};
		public function getENNoticeType():ENNoticeType{
			var clazz:* = builder.build("conf")["ENNoticeType"];
			return new clazz();
		};
		public function ENNoticeLocation_Builer():Builder{
			return builder.build("conf")["ENNoticeLocation"];
		};
		public function getENNoticeLocation():ENNoticeLocation{
			var clazz:* = builder.build("conf")["ENNoticeLocation"];
			return new clazz();
		};
		public function Notice_Builer():Builder{
			return builder.build("conf")["Notice"];
		};
		public function getNotice():Notice{
			var clazz:* = builder.build("conf")["Notice"];
			return new clazz();
		};
		public function ENMailType_Builer():Builder{
			return builder.build("conf")["ENMailType"];
		};
		public function getENMailType():ENMailType{
			var clazz:* = builder.build("conf")["ENMailType"];
			return new clazz();
		};
		public function Mail_Builer():Builder{
			return builder.build("conf")["Mail"];
		};
		public function getMail():Mail{
			var clazz:* = builder.build("conf")["Mail"];
			return new clazz();
		};
		public function Integer2DTable_Builer():Builder{
			return builder.build("conf")["Integer2DTable"];
		};
		public function getInteger2DTable():Integer2DTable{
			var clazz:* = builder.build("conf")["Integer2DTable"];
			return new clazz();
		};
		public function String2DTable_Builer():Builder{
			return builder.build("conf")["String2DTable"];
		};
		public function getString2DTable():String2DTable{
			var clazz:* = builder.build("conf")["String2DTable"];
			return new clazz();
		};
		public function Double2DTable_Builer():Builder{
			return builder.build("conf")["Double2DTable"];
		};
		public function getDouble2DTable():Double2DTable{
			var clazz:* = builder.build("conf")["Double2DTable"];
			return new clazz();
		};
		public function SNetAddress_Builer():Builder{
			return builder.build("conf")["SNetAddress"];
		};
		public function getSNetAddress():SNetAddress{
			var clazz:* = builder.build("conf")["SNetAddress"];
			return new clazz();
		};
		public function ENRoomType_Builer():Builder{
			return builder.build("conf")["ENRoomType"];
		};
		public function getENRoomType():ENRoomType{
			var clazz:* = builder.build("conf")["ENRoomType"];
			return new clazz();
		};
		public function SDealInfo_Builer():Builder{
			return builder.build("conf")["SDealInfo"];
		};
		public function getSDealInfo():SDealInfo{
			var clazz:* = builder.build("conf")["SDealInfo"];
			return new clazz();
		};
		public function SRoomConfig_Builer():Builder{
			return builder.build("conf")["SRoomConfig"];
		};
		public function getSRoomConfig():SRoomConfig{
			var clazz:* = builder.build("conf")["SRoomConfig"];
			return new clazz();
		};
		public function STimeConfig_Builer():Builder{
			return builder.build("conf")["STimeConfig"];
		};
		public function getSTimeConfig():STimeConfig{
			var clazz:* = builder.build("conf")["STimeConfig"];
			return new clazz();
		};
		public function SWaterConfig_Builer():Builder{
			return builder.build("conf")["SWaterConfig"];
		};
		public function getSWaterConfig():SWaterConfig{
			var clazz:* = builder.build("conf")["SWaterConfig"];
			return new clazz();
		};
		public function Game_Builer():Builder{
			return builder.build("conf")["Game"];
		};
		public function getGame():Game{
			var clazz:* = builder.build("conf")["Game"];
			return new clazz();
		};
		public function SRoomInfo_Builer():Builder{
			return builder.build("conf")["SRoomInfo"];
		};
		public function getSRoomInfo():SRoomInfo{
			var clazz:* = builder.build("conf")["SRoomInfo"];
			return new clazz();
		};
		public function SRoomInfos_Builer():Builder{
			return builder.build("conf")["SRoomInfos"];
		};
		public function getSRoomInfos():SRoomInfos{
			var clazz:* = builder.build("conf")["SRoomInfos"];
			return new clazz();
		};
		public function SUserInfo_Builer():Builder{
			return builder.build("conf")["SUserInfo"];
		};
		public function getSUserInfo():SUserInfo{
			var clazz:* = builder.build("conf")["SUserInfo"];
			return new clazz();
		};
		public function SBetInfo_Builer():Builder{
			return builder.build("conf")["SBetInfo"];
		};
		public function getSBetInfo():SBetInfo{
			var clazz:* = builder.build("conf")["SBetInfo"];
			return new clazz();
		};
		public function SBankerCalcInfo_Builer():Builder{
			return builder.build("conf")["SBankerCalcInfo"];
		};
		public function getSBankerCalcInfo():SBankerCalcInfo{
			var clazz:* = builder.build("conf")["SBankerCalcInfo"];
			return new clazz();
		};
		public function ENMoveType_Builer():Builder{
			return builder.build("conf")["ENMoveType"];
		};
		public function getENMoveType():ENMoveType{
			var clazz:* = builder.build("conf")["ENMoveType"];
			return new clazz();
		};
		public function ENBetPosition_Builer():Builder{
			return builder.build("conf")["ENBetPosition"];
		};
		public function getENBetPosition():ENBetPosition{
			var clazz:* = builder.build("conf")["ENBetPosition"];
			return new clazz();
		};
		public function ENBankerType_Builer():Builder{
			return builder.build("conf")["ENBankerType"];
		};
		public function getENBankerType():ENBankerType{
			var clazz:* = builder.build("conf")["ENBankerType"];
			return new clazz();
		};
		public function ENBankerStatus_Builer():Builder{
			return builder.build("conf")["ENBankerStatus"];
		};
		public function getENBankerStatus():ENBankerStatus{
			var clazz:* = builder.build("conf")["ENBankerStatus"];
			return new clazz();
		};
		public function ENBullType_Builer():Builder{
			return builder.build("conf")["ENBullType"];
		};
		public function getENBullType():ENBullType{
			var clazz:* = builder.build("conf")["ENBullType"];
			return new clazz();
		};
		public function ENBullStatus_Builer():Builder{
			return builder.build("conf")["ENBullStatus"];
		};
		public function getENBullStatus():ENBullStatus{
			var clazz:* = builder.build("conf")["ENBullStatus"];
			return new clazz();
		};
		public function SBullMoney_Builer():Builder{
			return builder.build("conf")["SBullMoney"];
		};
		public function getSBullMoney():SBullMoney{
			var clazz:* = builder.build("conf")["SBullMoney"];
			return new clazz();
		};
		public function SResultInfo_Builer():Builder{
			return builder.build("conf")["SResultInfo"];
		};
		public function getSResultInfo():SResultInfo{
			var clazz:* = builder.build("conf")["SResultInfo"];
			return new clazz();
		};
		public function SCountInfo_Builer():Builder{
			return builder.build("conf")["SCountInfo"];
		};
		public function getSCountInfo():SCountInfo{
			var clazz:* = builder.build("conf")["SCountInfo"];
			return new clazz();
		};
	}
}
