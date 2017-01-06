package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import laya.media.SoundManager;
	import bull.core.SoundPath;
	
	import ui.ui.room.TimerUI;
	
	public class Timer extends TimerUI
	{
		private var _time:int;
		public function Timer() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();						
			
		}		
		
		public function hide():void
		{			
			this.visible = false;
			_time = 0;
			Laya.timer.clear(this, timerHandler);
		}
		
		public function set_data(data:Array):void
		{
			this.visible = true;
			_time = data[0];
			LeftTime.text = _time.toString();			
			Laya.timer.loop(1000, this, timerHandler);
			
		}
		
		public function timerHandler():void
		{
			_time -= 1;	
			LeftTime.text = _time.toString();
			if (_time == 0)
			{
				Laya.timer.clear(this, timerHandler);
			}
			
			if( _time <=3)
			{
				//TODO 閃光提示 ,倒數
				//mcshine.gotoAndPlay(2);
				SoundManager.playSound(SoundPath.CountTick);
			}
		}
		
		private function test():void
		{
			//view.TimerPanel.set_data([10]);			
			//view.TimerPanel.hide();
		}		
	}

}