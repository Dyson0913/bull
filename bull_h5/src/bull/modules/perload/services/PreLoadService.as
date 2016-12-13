package bull.modules.perload.services
{
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	//import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	import com.lightUI.events.ScenceManagerEvent;
	import com.lightUI.manager.scence.ScenceInfo;
	
	import laya.net.Loader;
	import laya.utils.Handler;
	
	import bull.events.BullNotification;
	//import light.car.modules.common.model.CarProtoModel;
	import bull.modules.common.model.data.ConfigData;
	import bull.view.alert.MusicSetPanel;
	import bull.view.alert.RulePanel;
	//import light.car.view.hall.Hall;
	//import light.car.view.room.CarScene;
	import bull.view.smallLoading.SmallLoading;
	import bull.view.tipsLoad.TipsLoadPanel;
	
	public class PreLoadService extends Model implements IModel
	{
		
		public static const NAME:String = "perLoadService";
		public function PreLoadService(proxyName:String=null)
		{
			proxyName = proxyName?proxyName:NAME;
			super(proxyName);
			
			
			//加载配置文件			
			trace("加载配置文件");
			loadConfig();
		}
		
		private var _configURL:String = "res/config/config.json";
		private function loadConfig():void {
			trace("=======2");
			Light.loader.load([{url:_configURL,type:Loader.JSON}],Handler.create(this,onConfigLoaded));
		}
		private function onConfigLoaded():void{
			//加载url配置文件
			trace("加载url配置文件");			
			var bullConfig:ConfigData = getSingleton(ConfigData.NAME) as ConfigData;
			bullConfig.configData = Light.loader.getRes(_configURL);			
			loadURLConfig();
		}
		
		private function loadURLConfig():void {			
			Light.loader.URLM.addEventListener(LightEvent.COMPLETE,this, onConfigURLLoaded);
			Light.loader.URLM.loadConfig("res/config/BullURL.json");
		}
		private function onConfigURLLoaded(e:LightEvent):void {			
			Light.scence.init(Light.loader.URLM.config.scence);			
			//加载smallLoading
			loadSmallLoading();
		}
		
		private function loadSmallLoading():void{
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["smallLoading"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["smallLoading"]);
			//
			Light.scence.addScence("smallLoading",["SmallLoading"],Light.layer.scence).regView("SmallLoading",SmallLoading);
			Light.scence.creat();
			
			
		}
		
		private function loadTipLoad():void{
			
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["tipsLoadPanel"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["tipsLoadPanel"]);
			
			//"tipsLoadPanel"
			Light.scence.addScence("tipsLoadPanel",["TipsLoadPanel"],Light.layer.scence).regView("TipsLoadPanel",TipsLoadPanel);
			Light.scence.creat();
			
		}
		
		private function loadGameConfig():void{
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["config"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["config"]);
			
			Light.scence.addScence("config",[],null,ScenceInfo.KEPT_PERSCENCE);
			Light.scence.creat();
		}
		
		private function laodCommon():void
		{
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["common"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["common"]);
			//
			Light.scence.addScence("common",["MusicSetPanel","RulePanel"],null,ScenceInfo.KEPT_PERSCENCE)
				.regView("MusicSetPanel",MusicSetPanel)
				.regView("RulePanel",RulePanel);
			Light.scence.creat();
		}
		
		public function loadHall():void{
			sentNotification(BullNotification.Change_Scene, BullNotification.Scene_Hall);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["hall"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["hall"]);
			//
			//Light.scence.addScence("hall",["Hall"],Light.layer.scence,ScenceInfo.HIDE_PERSCENCE)
				//.regView("Hall",Hall);
			//Light.scence.creat();
		}
		
		public function loadRoom():void{
			sentNotification(BullNotification.Change_Scene, BullNotification.Scene_Game);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress,["room"]);
			Light.scence.addEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate,["room"]);
			
			//Light.scence.addScence("room",["CarScene","AssetsInPanel"],Light.layer.scence,ScenceInfo.HIDE_PERSCENCE)
				//.regView("CarScene",CarScene)
				//.regView("AssetsInPanel",AssetsInPanel);
			//Light.scence.creat();
		}
		
		private function loadProto():void{
			trace("loadProto")
			//var carProto:CarProtoModel = getModel(CarProtoModel.NAME) as CarProtoModel;
			//carProto.loadProtoFile(new Handler(this,protoLoaded));
		}
		private function protoLoaded():void{
			trace("protoLoaded");
			//loadHall();
		}

		private function onProgress(scenceName:String,e:ScenceManagerEvent):void{
			trace("onProgress",scenceName,e.data);
			switch(scenceName)
			{				
				case "config":
//				case "hall":
					sentNotification(BullNotification.LOAD_DATA_MESSAGE, {"scenceName":scenceName, "value":e.data});
					trace("----------------------sentNotification: "+scenceName+" value: "+e.data);
					break;
				case "room":
					sentNotification(BullNotification.LOAD_DATA_MESSAGE, {"scenceName":scenceName, "value":e.data});
					trace("----------------------sentNotification: "+scenceName+" value: "+e.data);
					break;
			}
		}
		private function onComplate(scenceName:String,e:ScenceManagerEvent):void{
			trace("onComplate 切换了场景",e.data)
			Light.scence.removeEventListener(ScenceManagerEvent.SCENCE_PROGRESS,this, onProgress);
			Light.scence.removeEventListener(ScenceManagerEvent.SCENCE_COMPLETE,this, onComplate);
			
			switch(scenceName)
			{
				case "smallLoading":
					loadTipLoad();
					break;
				case "tipsLoadPanel":
					trace("tipsLoadPanel");					
					loadGameConfig();
					break;
				case "hall":
					trace("sentNotification",BullNotification.SOCKET_CONNECT);
					sentNotification(BullNotification.HALL_SOCKET_CONNECT);
					break;
				case "config":
					trace("config",Light.loader.getRes("error_code"));
					trace("language",Light.loader.getRes("language"));
					//trace("clipConfig",Light.loader.getRes("clipConfig"));
					Light.error.init(Light.loader.getRes("error_code"));
					Light.language.init(Light.loader.getRes("language"));
					Light.scence.removeScence("config");
					laodCommon();
					break;
				case "common":
					Light.scence.removeScence("common");
					loadProto();
					break;
				case "room":
					trace("sentNotification",BullNotification.ROOM_SOCKET_CONNECT);
					trace("assetIn atlas: "+Light.loader.getRes("assetsIn"));
					sentNotification(BullNotification.ROOM_SOCKET_CONNECT);
					break;
				default:
					break;
			}
			//sentNotification(CarNotification.SCENCE_CHANGE,scenceName);
		}
		
		
		private function remove():void{
			//Light.scence.removeScence("room",false);
			Light.layer.loadingMask.clear();
		}
	}
}