package BullHall.command
{

	
	import BullHall.common.Common;
	import BullHall.manager.LayerManager;
	import BullHall.view.BullHallView;
	import BullHall.view.RoomItem;
	import BullHall.view.Marquee;
	
	import kg.components.rollTextField.RollTextField;	
	import kg.components.alert.AlertWindow;
	import kg.core.CompFactory;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	
	public class CreatHallCommand implements ICommand
	{
		public function execute():void
		{
			creatHallView();
		}
		
		private function creatHallView():void
		{
			CompFactory.getInstance().registerClazz("RoomItem",RoomItem);
			CompFactory.getInstance().registerClazz("HallView",BullHallView);
			CompFactory.getInstance().registerClazz("AlertWindow",AlertWindow); 
			CompFactory.getInstance().registerClazz("Marquee",Marquee); 
			CompFactory.getInstance().registerClazz("RollTextField",RollTextField);			
			
			
			var mj_hall:BullHallView = CompFactory.getInstance().creatComponent("comp_HallView", Common.SwfName); 
			LayerManager.getInstance().layerBottom.addChild(mj_hall as DisplayObject);
			LayerManager.getInstance().root.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}