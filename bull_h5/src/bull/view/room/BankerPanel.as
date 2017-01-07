package bull.view.room
{
	import BullGame.common.Common;
	import BullGame.utils.GameUtil;
	
	import laya.events.Event;
	
	import ui.ui.room.BankerPanelUI;
	
	/**
	 * 庄家面版
	 */	
	public class BankerPanel extends BankerPanelUI
	{						
		
		public var mcHintBoard:MovieClip;
		
		public var applybanker:Boolean;
		public var apply_debanker:Boolean;
		
		private var _callback:Function = null;
		private var _list:Array;
		private var _myName:String;
		private var _head_url:String;
		private var _loader:Loader;
		
		private var _bankerlimit:Number;
		
		private var _isGMoney:Boolean;
		
		public function BankerPanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();		
			
			txtname.text = "";
			Point.text ="";
			BankerTimes.text = "";
			mcHintBoard.visible = false;
			textFix_text_0.visible = false;s			
			
			_list =[];
			applybanker = false;
			apply_debanker = false;			
			
			//open_apply();
		}
		
		public function setRoundID(id:String):void
		{
			txt_RoundID.text = id;
		}
		
		public function set_G_identy(value:Boolean):void
		{
			_isGMoney = value;
		}
		
		public function set_room_limit(limit:Number):void
		{
			_bankerlimit = limit;
		}
		
		public function open_apply():void
		{
			btnBanker.visible = true;
			btndeBanker.visible = true;
			
			btnBanker.enabled = true;
			
		
			btnBanker.removeEventListener(MouseEvent.MOUSE_OVER, onOver, false);
			btnBanker.removeEventListener(MouseEvent.MOUSE_OUT, onOut, false);
			
			btnBanker.addEventListener(MouseEvent.CLICK, onClick, false);
			btnBanker.addEventListener(MouseEvent.MOUSE_OVER, onOver, false);
			btnBanker.addEventListener(MouseEvent.MOUSE_OUT, onOut, false);
			
			btndeBanker.removeEventListener(MouseEvent.MOUSE_OVER, onOver, false);
			btndeBanker.removeEventListener(MouseEvent.MOUSE_OUT, onOut, false);
			
			btndeBanker.addEventListener(MouseEvent.CLICK, ondebanker, false);
			btndeBanker.addEventListener(MouseEvent.MOUSE_OVER, onOver, false);
			btndeBanker.addEventListener(MouseEvent.MOUSE_OUT, onOut, false);
		
			mc_bankerAni.visible = false;
		}
		
		public function set_list(data:Array,myName:String):void
		{
			_list = data;
			_myName = myName;
		}
		
		public function i_am_not_banker():void			
		{
			btnBanker.enabled =false;	
			
			btnBanker.removeEventListener(MouseEvent.CLICK, onClick, false);			
			btndeBanker.removeEventListener(MouseEvent.CLICK, ondebanker, false);
			
			mcHintBoard.visible = false;
		}
		
		protected function onOver(event:MouseEvent):void
		{
			mcHintBoard.visible = true;
			var n:int = _list.length;
			mcHintBoard.gotoAndStop(n+1);
			for( var i:int =0;i< n;i++)
			{
				var one:Object =_list[i];
				mcHintBoard["bank_list_"+i].text = (i+1).toString()+ " " + one["name"];				
				mcHintBoard["Page_text"].text = i+"/10";				
				
				//自己變色
				if( _myName == one["name"]) 
				{
					mcHintBoard["bank_list_"+i].textColor = 0xF0d96B;
				}
				else
				{
					mcHintBoard["bank_list_"+i].textColor = 0x666666;
				}
								
			}
			mcHintBoard["txtBankerLimit"].text = GameUtil.formatMoney(_bankerlimit);
			
			if( _isGMoney) mcHintBoard["txt_title"].text = "[G币达到";
			else mcHintBoard["txt_title"].text = "[现金达到";
		}
		
		protected function onOut(event:MouseEvent):void
		{
			mcHintBoard.visible = false;
		}
		
		
		protected function onClick(event:MouseEvent):void
		{					
			applybanker = true;			
			//上庄类型 (1上, 2下)				
			dispatchEvent(new OperateEvent(NewNewGameEvent.apply_banker, [1]));
			
		}		
		
		protected function ondebanker(event:MouseEvent):void
		{
			apply_debanker =true;		
			dispatchEvent(new OperateEvent(NewNewGameEvent.apply_banker, [2]));
		}
		
		public function destory():void
		{
			btnBanker.removeEventListener(MouseEvent.CLICK, onClick);
			btnBanker.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
			btnBanker.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
			
			btndeBanker.removeEventListener(MouseEvent.CLICK, ondebanker);
			btndeBanker.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
			btndeBanker.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		
		public function switch_to_debanker():void	
		{
			applybanker = false;
			btnBanker.visible = false;
		}
		
		public function switch_to_banker():void	
		{
			apply_debanker = false;
			btnBanker.visible = true;
		}		
		
		//確認是否
		public function check_is_banker():void
		{
			if( btnBanker.visible == false )
			{
				//還原 申請上庄
				btnBanker.visible = true;
			}
			
		}
		
		public function bankerChange(bankerName:String,money:Number,bankTime:String,IsSys:Boolean,playAni:Boolean,head_url:String):void			
		{
			txtname.text = bankerName;
			Point.text = GameUtil.formatMoney(money);			
			BankerTimes.text = bankTime;					
			_head_url = head_url;
			
			if( IsSys )
			{
				textFix_text_0.visible = false;
				textFix_text_1.visible = false;
				Point.text ="";
			}
			else
			{
				textFix_text_0.visible = true;
				textFix_text_1.visible = true;
			}
			
			if( !playAni) return;
			
			if( _head_url != "avata")
			{
				//讀取頭像
				_loader.load(new URLRequest(_head_url));
			}
			else
			{
				//換回系統當庄,移除前一位玩家頭像
				mc_bankerAni.gotoAndStop(2);
				if(　_picforAni != null)
				{
					var mc:MovieClip = mc_bankerAni["NewBankerHead"].getChildByName("HeadContainer");
					while(mc.numChildren > 0)
					{
						mc.removeChildAt(0);
					}
					
					_picforAni = null;
					headbmp = null;
				}
				
				play_ani();
			}
			
			
			//TweenLite.to(NewBankerHead, 1, {x:NewBankerHead.x -177,y:NewBankerHead.y +147,scaleX:2,scaleY:2,onComplete:toHead, ease:Expo.easeOut});			
		}	
		
		//-----for test
		public function test_read():void
		{
			_loader.load(new URLRequest("http://statics.kgame63.com/common/images/avatars/1.png"));
		}
		
		//-----for test
		public function test_release():void
		{
			mc_bankerAni.gotoAndStop(2)
			var mc:MovieClip = mc_bankerAni["NewBankerHead"].getChildByName("HeadContainer");
			while(mc.numChildren > 0)
			{
				mc.removeChildAt(0);
			}
			
			_picforAni = null;	
			headbmp =null;
			play_ani();
		}
		
		
		private function play_ani():void
		{
			//播上庄動畫
			mc_bankerAni.visible = true;
			mc_bankerAni["text"].text = "";
			
			mc_bankerAni.gotoAndStop(2);
			if(_picforAni != null) mc_bankerAni["NewBankerHead"]["HeadContainer"].addChild(_picforAni);
			
			mc_bankerAni["NewBankerHead"]["HeadContainer"].height = 85;
			mc_bankerAni["NewBankerHead"]["HeadContainer"].width = 100;
			
			mc_bankerAni.gotoAndPlay(2);			
			mc_bankerAni.addEventListener(Event.ENTER_FRAME,enterFrame);
		}
		
		protected function enterFrame(event:Event):void
		{
			var mc:MovieClip = event.currentTarget as MovieClip;
			if( mc.currentFrame ==9)				
			{				
				mc_bankerAni["text"].text = txtname.text;				
				mc_bankerAni.gotoAndPlay(10);
				
			}
			else if( mc.currentFrame ==33)
			{
				mc_bankerAni["text"].text = "";
			}
			else if( mc.currentFrame == mc.totalFrames)
			{
				mc_bankerAni.removeEventListener(Event.ENTER_FRAME,enterFrame);
				mc_bankerAni.gotoAndStop(1);
				if( _picforAni != null)
				{
					_picforAni.width = _picforAni.height = 42;
					Head["HeadContainer"].addChild(_picforAni);					  
				}
				else
				{
					var user_head:MovieClip = Head["HeadContainer"];
					while(user_head.numChildren > 0)
					{
						user_head.removeChildAt(0);
					}					
				}
				
			}
				
			
		}	
		
	}
}