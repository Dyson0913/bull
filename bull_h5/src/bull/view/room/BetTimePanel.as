package bull.view.room
{
	import com.lightUI.events.LightEvent;
	import laya.display.Sprite;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import laya.media.SoundManager;
	import bull.core.SoundPath;
	
	import com.lightUI.core.Light
	
	import ui.ui.room.BetTimePanelUI;
	
	
	/**
	 * 下注时间倒计时
	 */	
	public class BetTimePanel extends BetTimePanelUI
	{		
		private var _time:int;
		
		private var _per_sec_value:Number;
		private var _start_angel:Number;		
				
		private var _timer_idx:int;
		
		public function BetTimePanel()
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
			bt_txt.text = _time.toString();			
			
			
			_start_angel = -90;
			//360度 / 秒數 =  每100毫需要減少的角度
			_per_sec_value = 360 / (_time * 10);
			
			var sp:Sprite = new Sprite();			
			sp.graphics.drawPie(57, 57, 52, _start_angel, 270, "#FF0000");
			mcbg.mask = sp;
			
			Laya.timer.loop(1000, this, timerHandler);			
			_timer_idx = Light.timer.setInterval(this, pie, 100, null);
		}
		
		public function pie():void
		{
			_start_angel += _per_sec_value;
			trace("_start_angel = " + _start_angel);
			var sp:Sprite = new Sprite();
			mcbg.mask = null;
			sp.graphics.drawPie(57, 57, 52, _start_angel , 270, "#FF0000");
			mcbg.mask = sp;
		}
		
		public function timerHandler():void
		{
			_time -= 1;	
			bt_txt.text = _time.toString();
			if (_time == 0)
			{
				Laya.timer.clear(this, timerHandler);
				Light.timer.clearInterval(_timer_idx);
			}
			
			if( _time <=3)
			{
				//TODO 閃光提示				
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