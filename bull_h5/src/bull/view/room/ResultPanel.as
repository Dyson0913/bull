package bull.view.room
{
	
	import com.IProtobuf.Long;
	import conf.SUserInfo;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.ui.Label;
	
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
		}		
		
		public function initView(playerName:String,myMony:Long,restTime:int,MyWin:Long,data:Array,Isbanker:Boolean,bankername:String):void
		{
			this.visible = true;
			reset();
			
			if( Isbanker)
			{
				isBanker.visible = true;				
			}
			else isBanker.visible = false;
			
			platform_name.text = bankername;
			
			
			self_name.text = playerName;
			self_money.text = GameUtil.formatMoney(myMony.toNumber()); 
			
			_rest_Time = restTime;
			rest_time.text = _rest_Time.toString();
			
			win_bitmap.font = "SettleWin";
			lost_bitmap.font = "Settlelost";
			
			if( MyWin.toNumber()>=0) 
			{			
				win_bitmap.text = "+" + GameUtil.formatMoneyBet(MyWin.toNumber());				
				lost_bitmap.text = "";
				SoundManager.playSound(SoundPath.settle_win);
			}
			else 
			{
				lost_bitmap.text = GameUtil.formatMoneyBet(MyWin.toNumber());				
				win_bitmap.text = "";
				SoundManager.playSound(SoundPath.settle_lose);
			}
			
			var n:int = data.length;
			
			//沒有人贏,顥示 本局无人赢钱
			if ( n==0)
			{				
				Text_NoOne_bet.text =  "本局无人赢钱";// MessageCodeMgr.getInstance().getMessage("10");					
			}
			else
			{
				Text_NoOne_bet.text = "";
			}
			
			
			var item:*;
			var txtitem:Label;
			for(var i:int =0;i< n;i++)
			{
				var _data:SUserInfo = data[i];
				
				item = mcRank[i];
				item.index = i;
				
				item = mclight[i];
				item.visible = _data.is_light;
				
				txtitem = txtNames[i];
				txtitem.text = _data["name"];
				
				txtitem = txtMoneys[i]				
				txtitem.text = GameUtil.formatMoney(_data.win_money.toNumber());
				
				item = HeadPic[i];
				item.visible = true;				
				//if( i ==0) item["mcHead_0"].loadImage(_data["Head"]);
				//if( i ==1) item["mcHead_1"].loadImage(_data["Head"]);
				//if( i ==2) item["mcHead_2"].loadImage(_data["Head"]);
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
				this.visible = false;
			}
			
		}
		
		public function get rest_Time():int
		{
			return _rest_Time;
		}
		
		public function set rest_Time(value:int):void
		{
			if( value != _rest_Time )
			{
				_rest_Time = value;
				rest_time.label = value.toString() +"S";		
			}
		}
		
		private function timeOut() : void
		{			
			hide();
			//dispatchEvent(new NewNewGameEvent(NewNewGameEvent.RUN_ResultOver));
		
		}
		
	
	
	}
}