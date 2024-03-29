package bull.view.room
{
	import laya.events.Event;
	import ui.ui.room.HistoryRecordUI;
	
	import laya.utils.Tween;
	import laya.utils.Ease;	
	
	import ui.ui.room.BullSceneUI;
	


	public class BullScene extends BullSceneUI
	{
		
		
		public function BullScene()
		{
			super();			
			this.on(Event.ADDED, this,onAdded);
		}
		
		private function onAdded():void {
			this.off(Event.ADDED,this,onAdded);
			
			trace("gameview init");
		}
		
		public function showme():void{
			trace("showme showme");
			
			
			Tween.to(HistoryBoard, { x:HistoryBoard.x + 173 },1000,Ease.backIn);
			Tween.to(InfoPanel, { y:InfoPanel.y - 96 }, 1000,Ease.backIn);
			Tween.to(bankerPanel, { y:bankerPanel.y +76 }, 1000,Ease.backIn);
			Tween.to(BetChip, { y:BetChip.y -138 }, 1000, Ease.backIn);
			
			
		
		}
		
		public function hideme():void{
			trace("hideme")
			
			//clear();
			btn_display(false);
			
			HistoryBoard.x = -173;
			InfoPanel.y = 800;
			bankerPanel.y = -81;
			BetChip.y = 803;
		}
		
		public function btn_display(show:Boolean):void
		{
			btnBg.visible = setupBtn.visible = helpBtn.visible = CarryInBtn.visible = PlayerListBtn.visible = show; 
		}
		
		
		public function start():void
		{
			trace("start");
		}
		
		public function banker():void
		{
			trace("banker");
		}
		
		public function bet():void
		{
			trace("bet");
		}
		
		public function betCheck():void
		{
			trace("betCheck");
		}
		
		public function deal():void
		{
			trace("deal");
		}
		
		public function end():void
		{
			trace("end");
		}
		
		private function onReturnClick(e:Event):void
		{			
			
		}
		
		public function clear():void {
		
		}
		
	}
}