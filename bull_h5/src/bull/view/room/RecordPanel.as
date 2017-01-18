package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import conf.SResultInfo;
	
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
			
			reset();
			
			Showing_Recode.on(Event.CLICK, this, onShow);
			Hidding_Recode.on(Event.CLICK, this, onHide);
			
		}		
		
		private function onShow(e:Event):void
		{		
			Showing_Recode.visible = false;
			Hidding_Recode.visible = true;
			
			viewNetState.y = 50;
		}
		
		private function onHide(e:Event):void
		{		
			Showing_Recode.visible = true;
			Hidding_Recode.visible = false;
			
			viewNetState.y = 412;
		}
		
		public function histroy_notify(win:Array,lost:Array,result:Array):void
		{
			reset();
			
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
				var item:SResultInfo = result[i];				
				this["spade_" + i].index = item[0] == false ? 0: 1;
				this["heart_" + i].index = item[1] == false ? 0: 1;
				this["club_" + i].index = item[2] == false ? 0: 1;
				this["diamond_" + i].index = item[3] == false ? 0: 1;
			}
			
		}
		
		public function net_seed(speed:Number):void
		{			
			viewNetState.updateMs(speed);
		}
		
		private function reset():void
		{
			spade_win.text = heart_win.text = club_win.text = diamond_win.text = "";			
			spade_lost.text = heart_lost.text = club_lost.text = diamond_lost.text = "";
			for (var i:int = 0; i < 12; i++)
			{
				this["spade_" + i].index = 2;
				this["heart_" + i].index = 2;
				this["club_" + i].index = 2;			
				this["diamond_" + i].index = 2;
			}			
			
		}
		
	}

}