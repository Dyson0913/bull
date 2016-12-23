package bull.view.hall
{
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.hall.hallUI;
	
	public class Hall extends hallUI
	{
		
		public function Hall()
		{
			super();		
			Ginit.visible = GHigh.visible =GLowEnter.visible = GHighEnter.visible = true;			
			Minit.visible = MHigh.visible = MLowEnter.visible =	MHighEnter.visible = false;
			
			GBtn.on(Event.CLICK, this, onGBtnClick);
			MBtn.on(Event.CLICK, this, onMBtnClick);
			backLobby.on(Event.CLICK, this, onReturnClick);
		}
		
		private function onReturnClick(e:Event):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onGBtnClick(e:Event):void
		{
			
			Ginit.visible = GHigh.visible =GLowEnter.visible = GHighEnter.visible = true;			
			Minit.visible = MHigh.visible = MLowEnter.visible =	MHighEnter.visible = false;
		}
		
		private function onMBtnClick(e:Event):void
		{
			Ginit.visible = GHigh.visible = GLowEnter.visible = GHighEnter.visible = false;			
			Minit.visible = MHigh.visible = MLowEnter.visible = MHighEnter.visible = true;			
		}
			
		
		
	}
}