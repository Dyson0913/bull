package BullHall.command
{
	
	
	import BullHall.event.BullHallEvent;
	import BullHall.model.HallAppMedel;
	import BullHall.service.LocalcnnService;
	import BullHall.service.SharedObjectService;
	
	import kg.core.assetsloader.LightAssetManager;

	public class LocalConnectCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var localCnn:LocalcnnService;
		
		[Inject]
		public var cookie:SharedObjectService;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case BullHallEvent.SOUND_CONTROL:
					soundControl(e.data);
					break;
			}
		}
		
		public function soundControl(data:Object):void{
			var localParam:Object = {cmd:"soundControl"};
			
			LightAssetManager.getInstance().music = data.music;
			LightAssetManager.getInstance().sound = data.sound;
			
			cookie.music = data.music.toString();
			cookie.sound = data.sound.toString();
			
			localParam.music = data.music;
			localParam.sound = data.sound;
			
			localCnn.send(JSON.stringify(localParam),appMedel.app_id);
		}
	}
}