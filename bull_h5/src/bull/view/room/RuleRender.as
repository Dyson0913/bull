package bull.view.room
{
	import com.lightUI.events.LightEvent;
	import conf.SUserInfo;
	import laya.display.Animation;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.ui.List;

	
	public class RuleRender extends Box
	{
		
		
		public function RuleRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			
		}
		
		override public function set dataSource(value:*):void{			
						
			if (value == null) return;
			
			trace("data");
		}
		
	}
}