package bull.view.hall
{
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	import conf.SRoomInfos;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.hall.hallUI;
	
	public class Hall extends hallUI
	{
		
		public function Hall()
		{
			super();		
			Ginit.visible = GHigh.visible =GLowEnter.visible = GHighEnter.visible = true;			
			Minit.visible = MHigh.visible = MLowEnter.visible =	MHighEnter.visible = false;
			
			
			backLobby.on(Event.CLICK, this, onReturnClick);
		}
		
		private function onReturnClick(e:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function show_G():void
		{
			Ginit.visible = GHigh.visible =GLowEnter.visible = GHighEnter.visible = true;			
			Minit.visible = MHigh.visible = MLowEnter.visible =	MHighEnter.visible = false;
		}
		
		public function show_M():void
		{
			Ginit.visible = GHigh.visible = GLowEnter.visible = GHighEnter.visible = false;			
			Minit.visible = MHigh.visible = MLowEnter.visible = MHighEnter.visible = true;		
		}
			
		
		public function showRoomList(data:Array):void
		{
			var roominfo:SRoomInfo = data[0] as SRoomInfo;					
			var config:SRoomConfig = roominfo.config;
			
			trace("config =" + config)
			
			LowRoomLimit.text = config.room_limit;
			LowRoomBet.text = config.min_bet +" - "+ config.max_bet;
			
			roominfo = data[1] as SRoomInfo;					
			config = roominfo.config;
			
			HighRoomLimit.text = config.room_limit;
			HighRoomBet.text = config.min_bet +" - "+ config.max_bet;		
			
		}
		
		
		
	}
}