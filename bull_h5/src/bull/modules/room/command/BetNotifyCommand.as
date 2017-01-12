package bull.modules.room.command
{	
	
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.common.model.data.vo.ClipConfigVo;
	import bull.modules.room.services.RoomSocketService;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.ENMoneyType;
	import conf.SBetInfo;
	import conf.SUserInfo;
	import msg.SBetNotify;
	import msg.SBetRsp;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	
	import msg.CS;
	import msg.ENCSType;
	import conf.ENBetPosition;
	import conf.ENRoomType;
	
	public class BetNotifyCommand extends Command implements ICommand
	{		
		
		public function BetNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_BET_REQ.toString()){
				Request();
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BET_RSP.toString()){
				betResponse(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BET_NOTIFY.toString()){
				betnotify(notification.getBody() as CS);
			}
			
			
		}
		
		public function execute(e:NewNewGameEvent):void
		{
			switch(e.type)
			{
				case String(ENCSType.CS_TYPE_BET_RSP):
					betResponse(e.data as CS)
					break;
				case NewNewGameEvent.CancelMybet_Req:
					CancelRequest();
				break;
				case NewNewGameEvent.Samebet_Req:
					SameRequest();
					break;				
			}
		}
		
		private function Request():void
		{
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_BET_REQ;
			out.bet_req = proto.msg_proto.getSBetReq();
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			//下那區
			var betzone:int = 0;
			if( roomData.bet_zone == 0) betzone = conf.ENBetPosition.BET_POSITION_1;
			else if (roomData.bet_zone == 1) betzone = conf.ENBetPosition.BET_POSITION_2;
			else if (roomData.bet_zone == 2) betzone = conf.ENBetPosition.BET_POSITION_3;
			else if (roomData.bet_zone == 3) betzone = conf.ENBetPosition.BET_POSITION_4;
			
			out.bet_req.position = betzone;
			
			//金額
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;
			var dataSelectClip:ClipConfigVo  = roomData.getClipBets(hallData.join_room_idx);
			var bet_add_value:int;
			if ( roomData.bet_idx == 5) bet_add_value = -1;  //MAX
			else 
			{
				bet_add_value = parseInt(dataSelectClip.selectClips[roomData.bet_idx]);
				
				//現金下10塊,傳1000
				if( roomData.Cash_Type != ENMoneyType.MONEY_TYPE_COIN ) bet_add_value = bet_add_value*100;
			}
			
			out.bet_req.bet_money  = bet_add_value;
			//if( bet_add_value ==-1) appMedel.IsBetMax = true;
			//else appMedel.IsBetMax =  false;
			//
			//appMedel.IsRepeat = false;
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		private function betResponse(cs:CS):void
		{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;	
			
			var rsp:SBetRsp = cs.bet_rsp;		
			switch(rsp.error_code)
			{
				case 0:
					//下注位置    (11. 取消,  10. 同上一轮,  1~4. 下注位置)
					if ( rsp.position ==  conf.ENBetPosition.BET_POSITION_CANCEL )
					{						
						appMedel.BetRecode = false;
						//還回全部和自己的金額
						var mybet:Array = appMedel.dataStartStatus.myBetClips;
						for(var i:int =0;i<  mybet.length;i++)
						{						
							appMedel.dataStartStatus.myBetClips[i] =0;
						}					
						appMedel.roomParam.roomlimit += rsp.betMoney;
						
						//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.CancelMybet_Rsp, cs)); 
					}
					else if (rsp.position == conf.ENBetPosition.BET_POSITION_REPEAT)
					{						
						appMedel.BetRecode =true;						
						appMedel.TotalMoney = rsp.handMoney.toNumber();						
						//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.Samebet_Rsp, cs)); 
					}
					else 
					{
						//appMedel.BetRecode =true;		
						
						if( roomData.Cash_Type != ENMoneyType.MONEY_TYPE_COIN )
						{
							roomData.Total_money = rsp.hand_money.toNumber() /100;		
						}
						else	roomData.Total_money = rsp.hand_money.toNumber() ;
						
						sentNotification(BullNotification.BET_RSP);		
					}
				break;
				
				default:				
					if (  rsp.error_code ==14 ||  rsp.error_code ==7 || rsp.error_code >=17 &&  rsp.error_code <=29)
					{
						
						var alertMsg:String = MessageCodeMgr.getInstance().getError( String(rsp.error_code) );
						var po:int; 
						//相同下注失敗 po 回傳10
						if( rsp.position ==10 )
						{
							po =0;
							//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.Samebet_FAILE, cs));
						}
						else
						{
							po = rsp.position -1
						}
						
						//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.Bet_Error, {"error_msg":alertMsg,"po":po,"error_code":rsp.errorCode}));
					}
					else
					{
						//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.ErrorCode, rsp.errorCode));
					}
					
					break;
			}
			
		}
		
		private function betnotify(cs:CS):void
		{
			var data:SBetNotify = cs.bet_notify;
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			
			var divi_100:Boolean = false;
			if ( roomData.Cash_Type != conf.ENRoomType.ROOM_TYPE_COIN ) divi_100 = true;
			
			var bullData:Data = getSingleton(Data.NAME) as Data;
			var myuid:Number =  bullData.uid;
			
			var m1:SBetInfo = data.m1;
			var m2:SBetInfo = data.m2;
			var m3:SBetInfo = data.m3;
			var m4:SBetInfo = data.m4;
			
			//總下注更新
			roomData.Zone_Total_bet[0] = divi_100 == true ? m1.money.toNumber() / 100 : m1.money.toNumber();
			roomData.Zone_Total_bet[1] = divi_100 == true ? m2.money.toNumber() / 100 : m2.money.toNumber();
			roomData.Zone_Total_bet[2] = divi_100 == true ? m3.money.toNumber() / 100 : m3.money.toNumber();
			roomData.Zone_Total_bet[3] = divi_100 == true ? m4.money.toNumber() / 100 : m4.money.toNumber();
			
			//下注資訊更新
			roomData.sameBetinfo = [];
			roomData.sameBetinfo = data.bets;		
			
			
			sentNotification(BullNotification.bet_info_update,[myuid,divi_100,roomData.sameBetinfo]);
			
			return;
						
			var m1:SBetInfo = data.m1;
			var m2:SBetInfo = data.m2;
			var m3:SBetInfo = data.m3;
			var m4:SBetInfo = data.m4;
			
			//if ( m1 == null) return;
			
			
			
			var Total_batch_bet:Number=0;
			var bet:SBetNotify_Bet =null;
			//中途進入 ,沒有SBetNotify_Bet bet = null
			for(var i:int =0;i< appMedel.sameBetinfo.length;i++)
			{
				bet = appMedel.sameBetinfo[i];
				Total_batch_bet += bet.value;				
			}	

			//中途進入 ,沒有SBetNotify_Bet bet = null
			if( bet == null)
			{
				Total_batch_bet = m1.money + m2.money +m3.money + m4.money;
			}
			
			//現金下1塊,傳100 ,回來要/100
			if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
			{
				
				//變成一包處理			
				Total_batch_bet /=100;				
			}
						
			var isMybet:Boolean = false;
			var IsSub:Boolean = false;
			var Total_self:Number = 0;
			
			//中途進入 ,沒有SBetNotify_Bet bet = null
			if( bet == null)
			{
				//個人資料歸零
				appMedel.dataStartStatus.myBetClips[0] = 0;
				appMedel.dataStartStatus.myBetClips[1] = 0;
				appMedel.dataStartStatus.myBetClips[2] = 0;
				appMedel.dataStartStatus.myBetClips[3] = 0;
				
				//m1
				for(var i:int =0;i< m1.user_info_s.length;i++)
				{
					 var person:SUserInfo = m1.user_info_s[i];
					 if( person.uid.toString() == appMedel.user_id)
					 {
						 if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						 {
							 appMedel.dataStartStatus.myBetClips[0] += person.betMoney.toNumber() /100;
						 }
						 else appMedel.dataStartStatus.myBetClips[0] += person.betMoney.toNumber();
					 }					 
				}
				
				//m2
				for(var i:int =0;i< m2.user_info_s.length;i++)
				{
					var person2:SUserInfo = m2.user_info_s[i];
					if( person2.uid.toString() == appMedel.user_id)
					{
						if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						{
							appMedel.dataStartStatus.myBetClips[1] += person2.betMoney.toNumber() /100;
						}
						else appMedel.dataStartStatus.myBetClips[1] += person2.betMoney.toNumber();
					}					 
				}
				
				//m3
				for(var i:int =0;i< m3.user_info_s.length;i++)
				{
					var person3:SUserInfo = m3.user_info_s[i];
					if( person3.uid.toString() == appMedel.user_id)
					{
						if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						{
							appMedel.dataStartStatus.myBetClips[2] += person3.betMoney.toNumber() /100;
						}
						else appMedel.dataStartStatus.myBetClips[2] += person3.betMoney.toNumber();
					}					 
				}
				
				//m4
				for(var i:int =0;i< m4.user_info_s.length;i++)
				{
					var person4:SUserInfo = m4.user_info_s[i];
					if( person4.uid.toString() == appMedel.user_id)
					{
						if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						{
							appMedel.dataStartStatus.myBetClips[3] += person4.betMoney.toNumber() /100;
						}
						else appMedel.dataStartStatus.myBetClips[3] += person4.betMoney.toNumber();
					}					 
				}
				
				Total_self = appMedel.dataStartStatus.myBetClips[3];
			}
			else
			{			
				isMybet= bet.uid.toString() == appMedel.user_id;
				IsSub = Total_batch_bet > 0 ? false :true;
				
				if( isMybet)
				{
					// TODO 變成一包處理	
					for(var k:int =0;k< appMedel.sameBetinfo.length;k++)
					{
						bet = appMedel.sameBetinfo[k];
						
						if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						{
							appMedel.dataStartStatus.myBetClips[bet.position-1] += bet.value/100;
						}
						else appMedel.dataStartStatus.myBetClips[bet.position-1] += bet.value;
							
						Total_self = appMedel.dataStartStatus.myBetClips[bet.position-1];
					}				
				}
			}
			
			//下注與退注更新
			appMedel.roomParam.roomlimit -= Total_batch_bet;
			
			// 前三名data
			var list:Array = [m1,m2,m3,m4];
			var tip_list:Array =[];			
			//uid 取得對應
			for( var j:int =0 ;j< list.length;j++)
			{
				var n:int = list[j].user_info_s.length;		
				var zone_list:Array =[];
				for (var i:int =0;i< n;i++)
				{
					var info:SUserInfo =  list[j].user_info_s[i];
					var playerLen:int = appMedel.TablePlayerlist.length;			
					for (var k:int =0;k< playerLen;k++)
					{
						var playerinfo:Array = appMedel.TablePlayerlist[k];	
						
						if( playerinfo[0] == info.uid.toString())
						{		
							var mon:Int64;
							if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
							{
								var nu:Number = info.betMoney.toNumber() /100;
								mon = Int64.fromNumber(nu);
							}
							else mon = info.betMoney;
								
							
							var one:Object = {"name":playerinfo[3],
								                             "light":info.isLight == true ? 1: 2,
															 "money":mon,
															 "vip":0
							                                };
							
							zone_list.push(one);							
						}
					}
				}
				
				tip_list.push(zone_list);				
			}
			appMedel.TabPlayerList = [];
			appMedel.TabPlayerList = tip_list;
			
			//明燈位置
			var light_po:int =-1;
			if (data.lightPos <=0 || data.lightPos >=5)
			{
				light_po = -1;
			}
			else light_po = data.lightPos-1;			
			appMedel.where_is_lamp = light_po;
						
			
			//中途進入 ,沒有SBetNotify_Bet bet = null
			var Total:Number =0;
			if( bet == null) ; 
			else	Total = appMedel.dataStartStatus.allBetClips[bet.position-1];			
			
			//trace("money "+ data.m1.money +" --" +data.m2.money+ "--" + data.m3.money + "---- "+ data.m4.money);
			//trace("is my ? " +isMybet + "is repeat =" +appMedel.IsRepeat + " is maxbet = " +appMedel.IsBetMax);
			
			//不用了
			//evt.dispatchEvent(new OperateEvent(NewNewGameEvent.Bet_Clip_Half_In));		
			
			var singlebet:Number = 0;
			if( bet == null) 
			{
				//中途進入 ,沒有SBetNotify_Bet bet = null ,bet.posito,傳零
				evt.dispatchEvent(new OperateEvent(NewNewGameEvent.Bet_Clip_Otherbet, [0,singlebet,Total,isMybet,IsSub,Total_self,bet]));
			}			
			else
			{
				if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )			
				{
					singlebet = bet.value /100; 
				}
				else singlebet  = bet.value ;
				evt.dispatchEvent(new OperateEvent(NewNewGameEvent.Bet_Clip_Otherbet, [bet.position-1,singlebet,Total,isMybet,IsSub,Total_self,bet]));
			}
		}
		
		
		private function CancelRequest():void
		{
			var cs:CS = new CS(); 
			cs.msgType = ENCSType.CS_TYPE_BET_REQ;
			var req:SBetReq = new SBetReq();			
			 req.position = conf.ENBetPosition.BET_POSITION_CANCEL;			 
			 
			cs.betReq =req;
			evt.dispatchEvent(new SocketEvent(SocketEvent.SEND, cs));
		}
		
		private function SameRequest():void
		{
			var cs:CS = new CS(); 
			cs.msgType = ENCSType.CS_TYPE_BET_REQ;
			var req:SBetReq = new SBetReq();			
			req.position = conf.ENBetPosition.BET_POSITION_REPEAT;			
			cs.betReq =req;
			
			//相同下注 有可能會比廣播的包慢 ,所以一點擊就設定
			appMedel.IsRepeat = true;
			
			evt.dispatchEvent(new SocketEvent(SocketEvent.SEND, cs));
		}
		
		
	}
}