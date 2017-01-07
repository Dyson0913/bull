package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	
	import laya.events.Event;
	
	import ui.ui.room.RecordPanelUI
	
	public class RecordPanel extends RecordPanelUI
	{
		
		public function RecordPanel() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			Showing_Recode.on(Event.CLICK, this, onShow);
			Hidding_Recode.on(Event.CLICK, this, onHide);
			
		}		
		
		private function onShow(e:Event):void
		{		
			Showing_Recode.visible = false;
			Hidding_Recode.visible = true;
		}
		
		private function onHide(e:Event):void
		{		
			Showing_Recode.visible = true;
			Hidding_Recode.visible = false;
		}
		
		public function update_info(win:Array,lost:Array,result:Array):void
		{
			if ( win.length == 0)
			{
				spade_win.text = heart_win.text = club_win.text = diamond_win.text = "";
			}
			else
			{
				spade_win.text = win[0];
				heart_win.text = win[1];
				club_win.text = win [2];
				diamond_win.text = win[3];
			}
			
			if ( lost.length == 0)
			{
				spade_lost.text = heart_lost.text = club_lost.text = diamond_lost.text = "";
			}
			else
			{
				spade_lost.text = lost[0];
				heart_lost.text = lost[1];
				club_lost.text = lost [2];
				diamond_lost.text = lost[3];
			}
			
			var n:int = result.length;
			for (var i:int = 0; i < n; i++)
			{
				this["spade_" + i].text = result[0];
				this["heart_" + i].text = result[1];				
				this["club_" + i].text = result[2];				
				this["diamond_" + i].text = result[3];				
			}			
			
		}
		
		public function hide():void
		{
			
		}
		
		public function show():void
		{
			
		}
		
	}

}