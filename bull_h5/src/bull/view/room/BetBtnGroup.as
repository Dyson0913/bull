package bull.view.room
{
	
	import laya.filters.ColorFilter;
	import ui.ui.room.BetBtnGroupUI
	
	import laya.events.Event;
	
	/**
	 * 下注按鈕 
	 */	
	public class BetBtnGroup extends BetBtnGroupUI
	{
		private var _samebet:Boolean;
		private var _rebet:Boolean;
		
		private var grayscaleFilter:ColorFilter;		
		
		public function BetBtnGroup()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
						
			disapear();
			
			betBtn_cancel.on(Event.CLICK, this, onClick);
			betBtn_same.on(Event.CLICK, this, onClick);
			
			var grayscaleMat = [0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0, 0, 0, 1, 0];
			grayscaleFilter = new ColorFilter(grayscaleMat);		
		}		
		
		public function disapear():void
		{
			_samebet =false;
			_rebet = false;
		}		
		
		public function samebet_rep():void
		{
			if( _samebet == true )
			{
				_samebet = false;
				//重新彈出取消下注
				withdraw_pop();
				
			}
		}
				
		public function rebet_popup():void
		{
			if( _rebet == true ) return;						
			
			withdraw_pop();			
		}
		
		
		private function withdraw_pop():void
		{			
			//重新下注彈出
			betBtn_cancel.disabled = false;
			betBtn_same.disabled = true;		
			
			_rebet = true;
		}
		
		public function initView(betrecode:Boolean):void
		{	
			this.visible = true;
			
			if(betrecode ==false) 
			{
				init();		
				
				return;
			}			
			
			//相同下注
			betBtn_same.disabled = false;
			betBtn_cancel.disabled = true;			
			
			_samebet = true;
		}	
		
		private function onClick(e:Event):void
		{								
			
			if ( e.target == betBtn_cancel)
			{
				trace("Btn_CancelBet");
				init();
				//dispatchEvent(new OperateEvent(NewNewGameEvent.CancelMybet, []));
			}
			else if ( e.target == betBtn_same)
			{
				trace("Btn_SameBet");
				btnSame_disapear();	
				//dispatchEvent(new OperateEvent(NewNewGameEvent.SameBet, []));
			}			
			
			//TODO 
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		private function btnSame_disapear():void			
		{
			betBtn_same.disabled = true;			
		}
		
		private function btncancel_disapear():void			
		{
			betBtn_same.disabled = true;
			betBtn_cancel.disabled = true;			
		}
		
		
		private function init():void
		{
			betBtn_cancel.disabled = true;
			betBtn_same.disabled = true;			
		}
		
	}
}