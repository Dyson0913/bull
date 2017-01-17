package bull.modules.common.services
{
	import com.kgame.KGH5;
	import com.lightMVC.interfaces.IModel;
	import com.lightMVC.parrerns.Model;
	import bull.modules.common.model.param.WebParam;
	
	import conf.ENMoneyType;
	import conf.ENRoomType;
	
	import laya.utils.Browser;
	import laya.utils.Handler;
	

	public class WebService extends Model implements IModel
	{
		public var webApi:KGH5 = new KGH5();
		public static const NAME:String = "WebService";

		override public function getInjector():Array{
			return [];
		}
		
		//h5
		public function WebService(modelName:String=null, data:Object=null)
		{
			super(modelName, data);
		}
		
		
		public function getUserBalance(callback:Handler):void
		{					
			webApi.getUserBalance(callback);			
		}
		
		public function getPlayerGuideStatus(callback:Handler):void
		{					
			webApi.getPlayerGuideStatus(callback);			
		}
		
		public function recharge(type:String,callback:Handler):void
		{
			webApi.rechargeShow(type,callback);
		}
		
		static public function resolveBrowserParam():WebParam {
			
			//FOR test test
			//var param:WebParam = new WebParam();
			//param.uid = 1014495;
			//param.access_token = "7b8007aaaef180fb1c0d78bc9c4b5589";
			//return param;
			
			var browserStr:String = Browser.document.location.href.toString();
			trace("browserStr = "+browserStr);
			var askIndex:int = browserStr.indexOf("?");
			var paramAry:Array = browserStr.substr(askIndex+1).split("&");
			var param:WebParam = new WebParam();
			for (var i:int=0;i<paramAry.length;i++){
				var ary:Array = paramAry[i].split("=");
				var key:String = ary[0];
				var value:String = ary[1];
				param[key] = value;
				trace("key: "+key+",  value: "+value);
			}
			//調試數據
			if(!param.uid){
				param.uid = 1014495;
				param.access_token = "6908dfe04342b2458fb006435eab8e48";//"6908dfe04342b2458fb006435eab8e48";//"7b8007aaaef180fb1c0d78bc9c4b5589";
			}
			return param;
		}
	}
}