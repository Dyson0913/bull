package bull.view.room
{
	
	import com.IProtobuf.Long;
	import laya.events.Event;
	import laya.ui.Image;
	import laya.ui.Label;
	
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import laya.display.Animation;
	import ui.ui.room.ResultPanelUI
	
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
		
		//private var _loader_1:Loader = null;
		//private var _loader_2:Loader = null;
		//private var _loader_3:Loader = null;
		
		private var _rest_Time:int;		
		//private var _bankerpic:DisplayObject =null;
		//private var _pic:Bitmap =null;
		
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
			this.event(NewNewGameEvent.Banker_Settle_pop);
			//dispatchEvent(new NewNewGameEvent(NewNewGameEvent.Banker_Settle_pop));
		}
		
		private function reset():void			
		{
			var item:*;
			var txtitem:TextField;
			for(var i:int =0;i< 3;i++)
			{			
				item = mcRank[i];
				item.gotoAndStop(2);
				
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
		
		public function setHead2(bankerpic:DisplayObject):void		
		{
			if( bankerpic ==null)
			{
//				var user_head:MovieClip = mcHead["HeadContainer"];
//				while(user_head.numChildren > 0)
//				{
//					user_head.removeChildAt(0);
//				}
				var user_head:MovieClip  = mcbankerHead["HeadContainer"];
				while(user_head.numChildren > 0)
				{
					user_head.removeChildAt(0);
				}				
			}
			else
			{
				if( _bankerpic == bankerpic)
				{
					return;
				}
				
				_bankerpic = bankerpic;
				

				
				var b2:BitmapData = new BitmapData(_bankerpic.width, _bankerpic.height);
				b2.draw(_bankerpic);
				var clip_mc:Bitmap = new Bitmap(b2);
				clip_mc.width = clip_mc.height = 42;
				mcbankerHead["HeadContainer"].addChild(clip_mc);					 
				
			}
		}
		
		public function setHead(pic:DisplayObject):void		
		{
			if( _pic !=null) return;
			
			var myBitmapData:BitmapData = new BitmapData(pic.width, pic.height);
			myBitmapData.draw(pic);
			var clip2_mc:Bitmap = new Bitmap(myBitmapData);
			clip2_mc.width = clip2_mc.height = 42;
			mcHead["HeadContainer"].addChild(clip2_mc);
			_pic =clip2_mc;
			
//			var myBitmapData:BitmapData = new BitmapData(pic.width, pic.height);
//			myBitmapData.draw(pic);
//			var clip2_mc:Bitmap = new Bitmap(myBitmapData);
//			_pic =clip2_mc;
//			mcHead.addChild(_pic);
//			mcHead.width = mcHead.height = 50; 
		}
		
		private function mycopy(value:*):*{
			var buffer:ByteArray = new ByteArray();
			buffer.writeObject(value);
			buffer.position = 0;
			var result:Object = buffer.readObject();
			return result;
		}
		
		public function initView(playerName:String,myMony:Number,restTime:int,MyWin:Long,data:Array,Isbanker:Boolean,bankername:String):void
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
			self_money.text = GameUtil.formatMoney(myMony); 
			
			_rest_Time = restTime;
			rest_time.text = String(_rest_Time+"S");
			trace("------MyWin--------" + MyWin.toNumber()); 
			win_bitmap.font = "SettleWin";
			lost_bitmap.font = "SettleLost";
			if( MyWin.toNumber()>=0) 
			{
				trace("------MyWin str--------"+GameUtil.formatMoneyBet(MyWin.toNumber())); 
				win_bitmap.text = "+"+GameUtil.formatMoneyBet(MyWin.toNumber());
				lost_bitmap.text = "";
			}
			else 
			{
				lost_bitmap.text = GameUtil.formatMoneyBet(MyWin.toNumber());
				win_bitmap.text = "";
			}

			
			var n:int = data.length;
			
			//沒有人贏,顥示 本局无人赢钱
			if ( n==0)
			{				
				Text_NoOne_bet.text =  "";// MessageCodeMgr.getInstance().getMessage("10");
				//TweenLite.to(Text_NoOne_bet, 0,{onComplete:onFinishTween});
				return;
			}
			else
			{
				Text_NoOne_bet.text = "";
			}
			
			
			var item:*;
			var txtitem:Label;
			for(var i:int =0;i< n;i++)
			{
				var _data:Object = data[i];
				
				item = mcRank[i];
				item.gotoAndStop(_data["rank"]);
				
				item = mclight[i]
				var frame:int =_data["ligt"];
				item.visible = true;
				
				txtitem = txtNames[i];
				txtitem.text = _data["name"];
				
				txtitem = txtMoneys[i]				
				txtitem.text = GameUtil.formatMoney(_data["money"]);
				
				item = HeadPic[i];
				item.visible = true;
				if( i ==0) loadHead(_data["Head"]);
				if( i ==1) loadHead(_data["Head"]);
				if( i ==2) loadHead(_data["Head"]);
			}			
			
		}
		
		public function loadHead(str:String,callback:Function,i:int):void
		{						
			if(i ==0 )
			{
				info_0.headPic.loadImage(str);
			}
			 
			if(i ==1 )
			{
				info_1.headPic.loadImage(str);
			}
			
			if(i ==2 )
			{
				info_2.headPic.loadImage(str);
			}
		}
		
		
		public function show():void
		{
			this.scaleX = this.scaleY = .2;	
			Tween.to(this, { scaleX:1 , scaleY:1 }, 300, Ease.cubicOut,Handler.create(this,onFinishTween));
			//LayerManager.getInstance().layerBottom.addChild(this);
			//TweenLite.to(this, 0.3,{scaleX:1, scaleY:1, ease:Back.easeOut,onComplete:onFinishTween});
		}		
		
		public function onFinishTween():void
		{
			//Tween.to(this, { scaleX:1 , scaleY:1 }, rest_Time, Ease.cubicOut,Handler.create(this,onFinishTween));
			//TweenLite.to(this, rest_Time, {rest_Time:0, onComplete:timeOut, ease:Linear.easeNone});
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
			dispatchEvent(new NewNewGameEvent(NewNewGameEvent.RUN_ResultOver));
		
		}
		
		public function hide():void
		{			
			if(this.parent)
				this.parent.removeChild(this);
		}
		
		public function setData(userName:String, myWinClip:Number, list:Array):void
		{
			var txtName:TextField;
			var txtMoney:TextField;
			
			self_name.text = userName;
			
			var i:int;		
			for ( i = 0; i < list.length; i++) 
			{
				//"+"+GameUtil.formatMoneyBet( myWinClip ); 
			}
			
//			for ( i = 0; i < txtNames.length; i++) 
//			{
//				txtName = txtNames[i]; 
//				txtMoney = txtMoneys[i];
//				
//				if( i < list.length )
//				{
//					var nameStr:String = list[i][0];
//					txtName.text = nameStr;
//					txtName.textColor = ( nameStr == _name ) ? 0x3ae93a : 0xFFFFFF;
//					txtMoney.text = GameUtil.formatMoney(list[i][1]);
//				}else{
//					txtName.text = "无";
//					txtMoney.text = GameUtil.formatMoney(0);
//					txtName.textColor = 0xFFFFFF;
//				}
//			}
//			
//			js_txt.label ="+"+GameUtil.formatMoneyBet( myWinClip ); 
		}

	}
}