package BullHall.utils
{
	import conf.ENMoneyType;
	import conf.ENRoomType;
	

	public class MoneyUtils
	{
		public static function monay(monay:Number):Number{
			return monay/100;
		}
		
		/**
		 * 如果是现金局 则 加入 ￥前缀 
		 * @param ante
		 * @return 
		 * 
		 */		
		public static function anteAddTag(ante:String, type:uint):String{
			var re:String = String(ante);
			if(type !=conf.ENRoomType.ROOM_TYPE_COIN){
				re = "¥"+re;
			}
			return re;
		}
		
		/**
		 * 标准的两位小数显示现金  G币 整数显示  
		 * @param num
		 * @param type
		 * 
		 */			
		public static function standardNumber(num:Number,type:int):String{
			var re:String = String(num);
			if(type != conf.ENRoomType.ROOM_TYPE_COIN){
				re = FormartUtils.pointNumber2(num);
			}
			return re;
		}
		
		/**
		 * 转换小数点为？ 
		 * @param money
		 * 
		 */		
		public static function moneyReplacePoint(money:String):String{
			return money.replace(".","?")
		}
	}
}