package BullHall.command
{
	
	
	import BullHall.manager.LayerManager;
	import BullHall.service.HallConfigService;
	import BullHall.service.SharedObjectService;
	import BullHall.service.WebService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class StartUpCommand extends Command
	{
		[Inject]
		public var webInfoService:WebService;
		
		[Inject]
		public var configService:HallConfigService;
		
		[Inject]
		public var cookie:SharedObjectService;
		
		[Inject]
		public var event:IEventDispatcher;
		
		override public function execute():void
		{
			webInfoService.parseInfo(LayerManager.getInstance().root.stage.loaderInfo,parseWebInfoOver);
			cookie.init();
		}
		
		private function parseWebInfoOver():void{
			configService.getConfig();
		}
		
	}
}