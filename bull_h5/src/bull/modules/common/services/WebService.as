package bull.modules.common.services
{
	import com.kgame.KGH5;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	
	
	
	import bull.modules.BullHall.common.Common;
	//import bull.modules.common.model.data.AppModel;
	//import bull.modules.common.model.param.RoomParam;
	import bull.modules.common.model.param.WebParam;
	
	import conf.ENMoneyType;
	import conf.ENRoomType;
	
	import laya.utils.Browser;
	import laya.utils.Handler;
	

	public class WebService extends Model implements IModel
	{

		//public var appModel:AppModel;
		public var webApi:KGH5 = new KGH5();
		
		//TODO
		//public var config:GameConfig;
		
		
		public static const NAME:String = "WebService";
		
	
		
		override public function getInjector():Array{
			return [];
		}
		
		//h5
		public function WebService(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
			
			//			ExternalInterface.addCallback("getUserBalanceCallBack",getUserBalanceCallBack);
		}
		
		
		public function getUserBalance(callback:Handler):void
		{					
			webApi.getUserBalance(callback);			
		}
		
		
	
		
		static public function resolveBrowserParam():WebParam {
			
			//FOR test test
			var param:WebParam = new WebParam();
			param.uid = 1014495;
			param.access_token = "7b8007aaaef180fb1c0d78bc9c4b5589";
			return param;
			
			var browserStr:String = Browser.document.location.href.toString();
			var askIndex:int = browserStr.indexOf("?");
			var paramAry:Array = browserStr.substr(askIndex+1).split("&");
			var param:WebParam = new WebParam();
			for (var i:int=0;i<paramAry.length;i++){
				var ary:Array = paramAry[i].split("=");
				var key:String = ary[0];
				var value:String = ary[1];
				param[key] = value;
				trace("key: "+key+",  value: "+value);
			}
			//調試數據
			if(!param.uid){
				param.uid = 1014495;
				param.access_token = "6908dfe04342b2458fb006435eab8e48";//"6908dfe04342b2458fb006435eab8e48";//"7b8007aaaef180fb1c0d78bc9c4b5589";
			}
			return param;
		}
		
		public function parseInfo(callback:Function):void
		{
			var browserStr:String = Browser.document.location.href.toString();
			var askIndex:int = browserStr.indexOf("?");
			var paramAry:Array = browserStr.substr(askIndex+1).split("&");
			var param:WebParam = new WebParam();
			for (var i:int=0;i<paramAry.length;i++){
				var ary:Array = paramAry[i].split("=");
				var key:String = ary[0];
				var value:String = ary[1];
				param[key] = value;
				trace("key: "+key+",  value: "+value);
			}
			
			
			//appModel.userInfoModel.user_id = param.uid;
			//appModel.assess_token = param.access_token;
			

			
		}
		
		
		
	
		
		public function getUserBalanceCallBack(param:Object):void{
				
			
			//if(!Common.isWeb) return;
			
			
			var userMoneyNum:Number = 0;
			
			//if(appModel.hallAppModel.room_type == conf.ENRoomType.ROOM_TYPE_CASH){
				//if( appModel.roomParam.isCanUseCash )
					//userMoneyNum += Number(param.cash);				
			//}
			//else if(appModel.hallAppModel.room_type == conf.ENRoomType.ROOM_TYPE_CASH_NM){
				//if ( appModel.roomParam.isCanUseNm )
				//userMoneyNum +=  Number(param.nm);
			//}
			//else if(appModel.hallAppModel.room_type == conf.ENRoomType.ROOM_TYPE_COIN){
				//if ( appModel.roomParam.isCanUseCoin )
					//userMoneyNum += Number(param.coin);
			//}
						
			//var roomOb:Object = appModel.hallAppModel.roomLists[appModel.hallAppModel.join_group];
			
			//不擋錢
			//if( userMoneyNum >=roomOb.toNumber() || Common.curTableId != -1 )
			//{
				//var roomParam:RoomParam = appModel.hallAppModel.roomParam;
				//roomParam.roomID = roomOb["roomId"];
				//roomParam.roomType = roomOb["roomType"];
				//roomParam.lobby_token = appModel.hallAppModel.Lobby_token;
				//roomParam.roomlimit = roomOb["roomLimit"];
				//roomParam.bankerlimit = roomOb["bankerLimit"];
				//roomParam.ip = appModel.hallAppModel.join_IP;
				//roomParam.port = String(appModel.hallAppModel.join_Port);
				//roomParam.uin = appModel.userInfo.avatarID;
				//
				//roomParam.moneyCoin = Number(param.coin);
				//roomParam.moneyCash = Number(param.cash);
				//roomParam.moneyNm = Number(param.nm);
				//
				//roomParam.minBet = roomOb["minBet"];
				//roomParam.maxBet =roomOb["maxBet"];
				//
				//TODO 還需要?
				//roomParam.clipType = appModel.hallAppModel.room_type;
				
				//TODO cookie有點問題 
				//先改用LightAssetManager.getInstance().sound ,LightAssetManager.getInstance().music 
				//
//				roomParam.music = LightAssetManager.getInstance().music;//cookie.getMusic();
//				roomParam.sound = LightAssetManager.getInstance().sound ;//cookie.getSound();
				
				//var name:String,name2:String,minBetStr:String,maxBetStr:String;
				//if( appModel.hallAppModel.room_type == ENMoneyType.MONEY_TYPE_CASH )
				//{
//					name = "G币场 ";
//					name2 = name;
//					minBetStr = MoneyUtils.standardNumber(csTable.minBet.toNumber(), ENMoneyType.MONEY_TYPE_COIN);
//					maxBetStr = MoneyUtils.standardNumber(csTable.maxBet.toNumber(), ENMoneyType.MONEY_TYPE_COIN);
//					name += (" " + csTable.tableName + " 下注范围："+minBetStr+"～" + maxBetStr+" G币");  
//					name2 += (minBetStr+"～" + maxBetStr+" G币");  
					
					
				//}
				//else
				//{
//					name = "现金场 ";
//					name2 = name;
//					var temp:Number = MoneyUtils.monay(csTable.minBet.toNumber()); 
//					var temp2:Number = MoneyUtils.monay(csTable.maxBet.toNumber()); 
//					minBetStr = MoneyUtils.standardNumber(temp, ENMoneyType.MONEY_TYPE_CASH);
//					maxBetStr = MoneyUtils.standardNumber(temp2, ENMoneyType.MONEY_TYPE_CASH);
//					name += (" " + csTable.tableName + " 下注范围：¥"+minBetStr+"～" + "¥"+maxBetStr);
//					name2 += ("¥"+minBetStr+"～" + "¥"+maxBetStr);
				//}
				//name = roomOb["roomName"];
				//roomParam.roomName = roomOb["roomName"];// name2;
				//roomParam.roomName2 = roomOb["roomName"]; //csTable.tableName;
				//
//				var roomParam:RoomParam = appModel.roomParam;				
//				startOneGame(name, String(roomParam.roomID), roomParam); //将参数传递给游戏窗口

				
//				var sound:Sound = LightAssetManager.getInstance().getSound(SoundNameManager.getInstance().Lobby_BGM);
//				sound.
					//(SoundNameManager.getInstance().Lobby_BGM, 0,10000);
//			} else {
//				evt.dispatchEvent(new CarHallEvent(CarHallEvent.MsgCode_NoEnoughMoney));
//			}

		}
		
		
		
	}
}