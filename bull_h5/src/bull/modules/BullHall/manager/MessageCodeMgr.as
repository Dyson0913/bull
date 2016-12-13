package BullHall.manager
{
	public class MessageCodeMgr
	{
		private var _xmlErrorCode:XML;
		private var _xmlMessageCode:XML;
		
		private static  var _singleton:Boolean=true;
		private static  var _instance:MessageCodeMgr;
		public function MessageCodeMgr():void{
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():MessageCodeMgr {
			if (!_instance) {
				_singleton=false;
				_instance=new MessageCodeMgr();
				_singleton=true;
			}
			return _instance;
		}
		
		public function parseXMLErrorCode(xml:XML):void{
			_xmlErrorCode = xml;
		}
		public function parseXMLMessageCode(xml:XML):void{
			_xmlMessageCode = xml;
			_xmlMessageCode.ignoreWhitespace=false;
			_xmlMessageCode.prettyPrinting=false;
		}
		
		public function getError(key:String):String{
			return _xmlErrorCode.record.(Value == key).Description_ZH;
		} 
		public function getMessage(key:String):String{
			var result:String = _xmlMessageCode.record.(Value == key).Description_ZH;
			result = result.replace(/\\n/g,"\n");
			return result;
		}
	}
}
