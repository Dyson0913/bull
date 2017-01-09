package bull.view.hall
{
	import conf.ENRoomType;
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	import conf.SRoomInfos;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.utils.Color;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.utils.Ease;	
	import laya.media.SoundManager;
	
	import com.lightUI.core.Light;
	import com.lightUI.components.alert.Alert;
	import bull.view.alert.AlertPanel;
	
	import bull.core.SoundPath;
	
	import ui.ui.hall.hallUI;
	
	public class Hall extends hallUI
	{
		
		var marqu_x:int = 612;
		
		public function Hall()
		{
			super();		
			GLowEnter.visible = GHighEnter.visible = true;			
			MLowEnter.visible =	MHighEnter.visible = false;			
			
			Tween.to(mqrqueue, { x:mqrqueue.x - 600 }, 15000, null, Handler.create(this, showmarque));
			
			//跑燈
			for (var i:int = 0; i < 128; i++)
			{
				if ( i % 2 == 1)
				{					
					this["light_" + i].interval = 1000;
					this["light_" + i].play();	
					
					this["_light_" + i].interval = 1000;
					this["_light_" + i].play();	
				}
				else
				{
					this["light_" + i].interval = 1000;
					this["light_" + i].wrapMode = 1;
					this["light_" + i].play(1);		
					
					this["_light_" + i].interval = 1000;
					this["_light_" + i].wrapMode = 1;
					this["_light_" + i].play(1);		
				}			
			}
			//SoundManager.playMusic(SoundPath.Lobby_BGM, 100);
			
			
			
		}
		
		private function onLowEnter(e:Event):void
		{
			trace("onLowEnter");
			
			
		}
		
		private function showmarque():void
		{
			Tween.clearTween(showmarque);
			mqrqueue.x = marqu_x;
			Tween.to(mqrqueue, { x:mqrqueue.x - 600 }, 15000,null, Handler.create(this,showmarque));
		}
		
		
		
		private function callCarryInPanel(data:int,flg:String):void{
			
		}
		
		public function show_G():void
		{
			GLowEnter.visible = GHighEnter.visible = true;			
			MLowEnter.visible =	MHighEnter.visible = false;
			init_box.source  = Light.loader.getRes("res/hall/img_Ginit.png");			
			high_box.source = Light.loader.getRes("res/hall/img_GHigh.png");		
			
		}
		
		public function show_M():void
		{
			GLowEnter.visible = GHighEnter.visible = false;			
			MLowEnter.visible = MHighEnter.visible = true;
			init_box.source  = Light.loader.getRes("res/hall/img_Minit.png");			
			high_box.source = Light.loader.getRes("res/hall/img_MHigh.png");	
		}
			
		
		public function showRoomList(data:Array):void
		{
			var roominfo:SRoomInfo = data[0] as SRoomInfo;					
			var config:SRoomConfig = roominfo.config;			
			
			var isCoin:Boolean = true;
			if (config.room_type != ENRoomType.ROOM_TYPE_COIN) isCoin = false;
			
			LowRoomLimit.text = txt_adjust(isCoin, config.room_limit);
			LowRoomBet.text = txt_adjust(isCoin, config.min_bet) +" - " + txt_adjust(isCoin, config.max_bet);
			
			var frame:int = 0;
			if ( roominfo.cur_player > 30 && roominfo.cur_player < 50 ) frame = 1;
			if ( roominfo.cur_player > 50  ) frame = 2;
			
			stateAni_1.index = frame;
			stateAni_1.stop();
			
			roominfo = data[1] as SRoomInfo;					
			config = roominfo.config;
			
			HighRoomLimit.text = txt_adjust(isCoin, config.room_limit);
			HighRoomBet.text = txt_adjust(isCoin, config.min_bet) +" - " + txt_adjust(isCoin, config.max_bet);
			
			if ( roominfo.cur_player > 30 && roominfo.cur_player < 50 ) frame = 1;
			if ( roominfo.cur_player > 50  ) frame = 2;
			
			stateAni_2.index = frame;
			stateAni_2.stop();
		}
		
		private function txt_adjust(isCoin:Boolean,nu:int):String
		{
			if ( isCoin == true) return nu.toString();		
			
			nu  = nu / 100;
			return "¥" +nu + ".00";
		}
		
		public function clear():void
		{
			
		}
		
		
	}
}