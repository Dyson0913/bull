package bull.view.room
{
	import com.lightUI.events.LightEvent;
	import laya.filters.ColorFilter;
	import ui.ui.room.BetBtnGroupUI
	
	import laya.events.Event;
	
	/**
	 * 下注按鈕 
	 */	
	public class BetBtnGroup extends BetBtnGroupUI
	{
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
			this.visible = false;
		}		
		
		public function appear(betrecode:Boolean):void
		{
			this.visible = true;
			
			//有下注記錄
			if ( betrecode)
			{
				betBtn_cancel.disabled = true;
				betBtn_same.disabled = false;		
			}
			else
			{
				betBtn_cancel.disabled = true;
				betBtn_same.disabled = true;
			}
		}
		
		public function rebet_popup():void
		{
			//重新下注 可按
			betBtn_cancel.disabled = false;
			betBtn_same.disabled = true;		
		}
		
		private function onClick(e:Event):void
		{								
			var sName:String = e.target.name;
			var pattern:RegExp = /betBtn_/;
			sName = sName.replace(pattern, "");			
						
			event(LightEvent.ITEM_CLICK,sName);
		}
		
	}
}