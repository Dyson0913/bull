package bull.view.room
{
	import laya.events.Event;
	import com.lightUI.core.Light
	
	import ui.ui.room.NetStatusPanelUI
	
	public class NetStatusPanel extends NetStatusPanelUI
	{				
		
		public var mcStatus:MovieClip;
		
		private var _ms:Number = 0;
		private var _status:uint = 0;
		private var _statuTxts:Array;
		
		private var _timer_idx:int;
		public function NetStatusPanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();							
			tip_bg.visible = false;				
			_statuTxts = ["极佳", "流畅", "普通", "不佳"];		
						
			mcStatus.on(Event.MOUSE_OVER, this, onRollOver);
			mcStatus.on(Event.MOUSE_OUT, this, onRollOut);
			
		}
		
		private function onRollOver(e:Event):void
		{		
			showTxt();
			tip_bg.visible = true;
			
		}
		
		private function showTxt():void
		{
			if( _status < _statuTxts.length )
			{
				
				tip_bg["txt_Tip"].text = "当前延迟"+_ms.toFixed(2) + "ms，网络状况"+_statuTxts[_status];
			}					
			else
			{				
				tip_bg["txt_Tip"].text  = "你的网路状态不佳,可能因为延造成投注损失建议检查网路後再进行游戏";
			}
		}
		
		private function onRollOut(e:MouseEvent):void
		{		
			tip_bg.visible = false;
		}
		
		public function updateMs(ms:Number):void
		{
			_ms = ms;
			if ( _ms < 101 )
			{
				_status = 1;		
				mcStatus["State_0"].visible = true;
				mcStatus["State_1"].visible = false;
				mcStatus["State_2"].visible = false;
				mcStatus["State_3"].visible = false;
			}
			else if ( _ms < 401 )
			{				
				_status = 2;
				mcStatus["State_0"].visible = false;
				mcStatus["State_1"].visible = true;
				mcStatus["State_2"].visible = false;
				mcStatus["State_3"].visible = false;
			}
			else if ( _ms < 701 )
			{
				_status = 3;
				mcStatus["State_0"].visible = false;
				mcStatus["State_1"].visible = false;
				mcStatus["State_2"].visible = true;				
				mcStatus["State_3"].visible = false;
			}
			else 
			{				
				_status = 4;
				mcStatus["State_0"].visible = false;
				mcStatus["State_1"].visible = false;
				mcStatus["State_2"].visible = false;			
				mcStatus["State_3"].visible = true;
			}				
			
			//網速太慢,直接提醒用戶			
			if( _status ==4)
			{					
				_timer_idx = Light.timer.setInterval(this, tip_apear, 1000, null);				
			}
		}
		
		private function tip_apear():void			
		{
			tip_bg.visible = true;	
			showTxt();
			Light.timer.clearInterval(_timer_idx);			
			
			_timer_idx = Light.timer.setInterval(this, tip_disaper, 1000, null);					
		}
		
		private function tip_disaper():void
		{
			tip_bg.visible = false;		
			Light.timer.clearInterval(_timer_idx);			
		}
		
		
		
	}
}