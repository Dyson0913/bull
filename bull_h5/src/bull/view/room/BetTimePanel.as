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
		private var _sp:Sprite;
		
		public function BetTimePanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			_sp = new Sprite();	
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
			_time = data[0] -1;
			bt_txt.text = _time.toString();			
			
			light.interval = 100;
			light.x = 60;
			light.y = 59;
			light.visible = true;
			light.play();
			
			light.pivotX = -30;
			light.pivotY = 33;
			
			_start_angel = -90;
			//360度 / 秒數 =  每100毫需要減少的角度
			_per_sec_value = 360 / (_time * 10);
			//trace("_per_sec_value = "+_per_sec_value);
			var sp:Sprite = new Sprite();			
			mcbg.mask = null;
			sp.graphics.drawPie(57, 57, 52, _start_angel, 270, "#FF0000");
			mcbg.mask = sp;
			
			Laya.timer.loop(1000, this, timerHandler);			
			Laya.timer.loop(100, this, pie);			
			
			
		}
		
		public function pie():void
		{
			_start_angel += _per_sec_value;
			//trace("_start_angel = " + _start_angel);
			if ( _start_angel >= 360) _start_angel = 362;
			var sp:Sprite = new Sprite();
			mcbg.mask = null;
			sp.graphics.drawPie(57, 57, 52, _start_angel , 270, "#FF0000");
			mcbg.mask = sp;			
			
			var de:Number = _start_angel;		
			light.rotation = de;
		}
		
		public function timerHandler():void
		{
			_time -= 1;	
			if ( _time <= 0) _time = 0;
			bt_txt.text = _time.toString();
			if (_time == 0)
			{				
				light.visible =  false;
				Laya.timer.clear(this, timerHandler);
				Tween.to(this, { }, 100, Ease.cubicOut,Handler.create(this,ani_ok)););
			}
			
			if( _time <=3)
			{
				//TODO 閃光提示				
				SoundManager.playSound(SoundPath.CountTick);
			}
		}
		
		private function ani_ok():void
		{
			
			Laya.timer.clearAll(this);
		}
		
		private function test():void
		{
			//view.TimerPanel.set_data([10]);			
			//view.TimerPanel.hide();
		}
	}
}