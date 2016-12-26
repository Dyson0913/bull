package bull.view.room
{

	import ui.ui.room.BullSceneUI;
	


	public class BullScene extends BullSceneUI
	{
		
		
		public function BullScene()
		{
			super();
			
			trace("room init");
			
			btnBg.visible = setupBtn.visible = helpBtn.visible = CarryInBtn.visible = PlayerListBtn.visible = false; 
			
			
			//trace("assetIn atlas: "+Light.loader.getRes("assetsIn"));
			//backLobby.on(Event.CLICK, this, onReturnClick);
		}
		
		private function onReturnClick(e:Event):void
		{			
			
		}
		public function clear():void {
		
		}
		
	}
}