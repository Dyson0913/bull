package bull.view.room
{
	import com.lightUI.core.Light;
	import com.IProtobuf.Long;
	import conf.SUserInfo;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.ui.Label;
	
	import com.lightUI.events.LightEvent;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import laya.display.Animation;
	import ui.ui.room.ResultPanelUI
	
	import laya.media.SoundManager;
	import bull.core.SoundPath;
	
	/**
	 * 结算面板
	 */	
	public class ResultPanel extends ResultPanelUI
	{
		
		private var mcRank:Array = null;
		private var mclight:Array = null;
		private var HeadPic:Array = null;
		private var txtNames:Array = null;
		private var txtMoneys:Array = null;
		
		private var _rest_Time:int;
		
		public function ResultPanel()
		{			
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();	
			this.visible = false;
			mcRank = [];
			mclight = [];
			txtNames = [];
			txtMoneys = [];
			HeadPic = [];
			
			mcRank.push(Num_0);
			mcRank.push(Num_1);
			mcRank.push(Num_2);
			
			mclight.push(light_0);
			mclight.push(light_1);
			mclight.push(light_2);
			
			txtNames.push(name_0);
			txtNames.push(name_1);
			txtNames.push(name_2);
			
			txtMoneys.push(Money_0);
			txtMoneys.push(Money_1);
			txtMoneys.push(Money_2);
			
			HeadPic.push(headPic_0);
			HeadPic.push(headPic_1);
			HeadPic.push(headPic_2);			
			
			btnClose.on(Event.CLICK,this,onClick);
			btnok.on(Event.CLICK,this, onClick);
			
			Text_NoOne_bet.text = "";
		}
		
		protected function onClick(event:MouseEvent):void
		{
			this.visible = false;
			//this.event(NewNewGameEvent.Banker_Settle_pop);
			//dispatchEvent(new NewNewGameEvent(NewNewGameEvent.Banker_Settle_pop));
		}
		
		private function reset():void			
		{
			var item:*;
			var txtitem:TextField;
			for(var i:int =0;i< 3;i++)
			{			
				item = mcRank[i];
				item.visible = false;
				
				item = mclight[i]			
				item.visible = false;
				
				txtitem = txtNames[i];
				txtitem.text = "";
				
				txtitem = txtMoneys[i];
				txtitem.text = "";
				
				item = HeadPic[i];
				item.visible = false;
			}
			
			isBanker.visible = false;
			BankerHead.source = Light.loader.getRes("res/gameScene/HeadIcon.jpg");
		}		
		
		public function initView(playerName:String,myMony:String,restTime:int,MyWin:Long,MywinDisplay:String,data:Array,isSelfbaner:Boolean,banker_name:String,banker_Head:String,sef_head:String):void
		{
			this.visible = true;
			reset();
			
			isBanker.visible = isSelfbaner;
			if ( banker_name.length == 0) platform_name.visible = true;
			else platform_name.visible = false;
			
			//玩家或其它玩家坐庄
			BankerName.text = banker_name;
			BankerHead.loadImage(banker_Head, 0, 0, 68, 67);
			
			//自己的資訊
			self_name.text = playerName;
			self_money.text = myMony;
			mcHead.loadImage(sef_head, 0, 0, 68, 67); 
			
			
			_rest_Time = restTime;
			rest_time.text = _rest_Time.toString();
			
			win_bitmap.font = "SettleWin";
			lost_bitmap.font = "Settlelost";
			
			if( MyWin.toNumber()>=0) 
			{			
				win_bitmap.text = MywinDisplay;			
				lost_bitmap.text = "";
				SoundManager.playSound(SoundPath.settle_win);
			}
			else 
			{
				lost_bitmap.text = MywinDisplay;
				win_bitmap.text = "";
				SoundManager.playSound(SoundPath.settle_lose);
			}
			
			var n:int = data.length;			
			//沒有人贏,顥示 本局无人赢钱
			if ( n==0) Text_NoOne_bet.text =  "本局无人赢钱";// MessageCodeMgr.getInstance().getMessage("10");
			else Text_NoOne_bet.text = "";
			
			var item:*;
			var txtitem:Label;
			for(var i:int =0;i< n;i++)
			{
				var _data:Object = data[i];
				trace
				item = mcRank[i];
				item.visible = true;
				item.index = i;				
				
				item = mclight[i];
				item.visible = _data.is_light;
				
				txtitem = txtNames[i];
				txtitem.text = _data["name"];
				
				txtitem = txtMoneys[i]				
				txtitem.text = _data["money"];
				
				item = HeadPic[i];
				item.visible = true;
				this["mcHead_" + i].loadImage(sef_head, 0, 0, 34, 34); 
				
			}			
			
		}
		
		
		public function show():void
		{
			this.scaleX = this.scaleY = .2;	
			Tween.to(this, { scaleX:1 , scaleY:1 }, 300, Ease.cubicOut,Handler.create(this,onFinishTween));			
		}		
		
		public function onFinishTween():void
		{
			Laya.timer.loop(1000, this, timerHandler);
		}
		
		public function timerHandler():void
		{
			_rest_Time -= 1;	
			rest_time.text = _rest_Time.toString();
			if (_rest_Time == -1)
			{
				Laya.timer.clear(this, timerHandler);
				event(LightEvent.ITEM_CLICK);
				this.visible = false;
			}
			
		}
		
	}
}