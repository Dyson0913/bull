package BullHall.manager
{
	import kg.utils.Log;

	public class Loger
	{
		public static var _ins:Loger;
		public function Loger( obj:Object )
		{
		}
		public static function get():Loger
		{
			if( _ins == null )
				_ins = new Loger(new Object);
			return _ins;
		}
		
		public function logPrint(... guards):void
		{
			if( !Log.debug )
				return;
			Log.log("[Flash Hall] "+guards.toString());
		}
		
		public function logPrintOjb(obj:Object):void
		{
			var objStr:String = " {";
			for (var key:String in obj) 
			{
				objStr += ( key+":"+obj[key]+",");
			}
			objStr+="}";
			logPrint(objStr);
		}
		
	}
}