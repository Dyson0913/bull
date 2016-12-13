package BullHall.view
{	
	
//	
	import BullGame.manager.SoundNameManager;
	
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	import BullHall.manager.SoundNameManager;
	import BullHall.model.HallAppMedel;
	import BullHall.service.LocalcnnService;
	
	import conf.ENRoomType;
	
	import kg.components.tabBar.TabBarEvent;
	import kg.core.assetsloader.LightAssetManager;
	import kg.core.timer.TimerManager;
	
	import msg.ENError;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class bullHallMediator extends Mediator
	{
		[Inject]
		public var hall:BullHallView;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var localcnn:LocalcnnService;
		
		override public function initialize():void
		{
			super.initialize();
			
			addContextListener(BullHallEvent.Update_RoomInfo, onUpdateRoomInfo);
			addContextListener(BullHallEvent.push_msg_notify, onUpdatePushNotify);
			
			hall.typeTabBar_tb.addEventListener(TabBarEvent.ITEM_CLICK, onTabBarItemChange);
			
			var roomItem:RoomItem = null;
			for (var i:int = 0; i < hall.items.length; i++) 
			{
				roomItem = hall.items[i];
				roomItem.addEventListener(MouseEvent.CLICK, onItemClick);
				roomItem.buttonMode = true;
			}
			LightAssetManager.getInstance().sound = true;
			LightAssetManager.getInstance().music = true;
						
			TimerManager.getInstance().registeTimer(play, 1000, 1);
		}		
		
		private function play() : void
		{
			TimerManager.getInstance().removeTimer(play, 1000, 1);
			appMedel.soundbg = LightAssetManager.getInstance().getSound(SoundNameManager.getInstance().Lobby_BGM);
			if( appMedel.soundbg)
			{
				appMedel.soundbg_channel = LightAssetManager.getInstance().playASound(appMedel.soundbg, 0, 10000);
				appMedel.sound_playing =true;
			}			
			
			appMedel.pushmsg.push("測試跑馬燈~~~~~~燈~~~~燈");			
			
			evt.dispatchEvent(new BullHallEvent(BullHallEvent.push_msg_notify));
		}
		
		private function onTabBarItemChange(e:TabBarEvent):void{
			//trace("onTabBarItemClick",hall.typeTabBar_tb.seletedIndex)
			
			switch(hall.typeTabBar_tb.seletedIndex)
			{
				case 0:				
					hall.select_Coin();
					//appMod.roomType = AppMedel.CASH;
					break;
				case 1:					
					hall.select_Money();
					//appMod.roomType = AppMedel.COIN;
					break;
			
			}
		}
		
		protected function onItemClick(event:MouseEvent):void
		{			
			var join_group:int = int(event.currentTarget.name);
			
			appMedel.room_type = hall.select_type;
			if( appMedel.room_type ==conf.ENRoomType.ROOM_TYPE_CASH_NM)
			{
				join_group +=2;				
			}
			appMedel.join_group = join_group;
			evt.dispatchEvent(new BullHallEvent(BullHallEvent.JoinTable_Request));
			
			return;
			//只有這裡檢查?其它不用?
			if( !Common.isOpenServer )
			{
				evt.dispatchEvent(new BullHallEvent(BullHallEvent.ErrorCode, ENError.ERROR_SERVER_STOPPED));
				return;
			}		
			
			//異地己經登入
//			if( Common.curTableId != -1 && !Common.isOtherPlaceLogin )
//			{
//				if( Common.curTableId == roomItem.data.tableId )
//				{
//					//hallRoomItemClick(roomItem.data);
//					return;
//				}
//				//evt.dispatchEvent(new CarHallEvent(CarHallEvent.MsgCode_PlayerStatus));
//				return;
//			}
			
//			if(roomItem.data.curPlayer >= roomItem.data.maxPlayer)
//			{
//				evt.dispatchEvent(new CarHallEvent(CarHallEvent.ErrorCode, ENError.ERROR_ROOMSVR_FULL));
//				return;
//			}
			//hallRoomItemClick(roomItem.data);
		}

		private function onUpdatePushNotify(e:BullHallEvent):void
		{
			
			var n:int = appMedel.pushmsg.length;
			for( var i:int =0;i<n;i++)
			{
				hall.viewMarquee.label_txt.addMsg(appMedel.pushmsg[i],i);
				//hall.viewMarquee.show(appMedel.pushmsg[i],i);		
			}
			
		}		

		private function onUpdateRoomInfo(e:BullHallEvent):void
		{
			
			hall.update(appMedel.roomLists);
			hall.updateList([appMedel.roomLists[0],appMedel.roomLists[1]]);
			hall.select_Coin();
		
			
		}
		
	}
}