package bull.view.room
{
	import com.netease.protobuf.UInt64;
	
	


	public class GameUtil
	{
		public static function removeFromStage(dis:DisplayObject):void
		{
			if(dis.parent)
			{
				dis.parent.removeChild(dis);
			}
		}
		
		public static function clearDisplayChildren(dis:DisplayObjectContainer):void
		{
			if(dis)
			{
				while(dis.numChildren>0)
				{
					dis.removeChildAt(0);
				}
			}
		}
		
		public static function formatMoney1(num:Number):String
		{
			if( Common.isCoin )
				return num +"";
			else
				return num.toFixed(2);
		}
		public static function formatMoney(num:Number):String
		{
			if( Common.isCoin )
				return num.toString();
			else
				return "¥"+num.toFixed(2);
		}
		public static function formatMoneyBet(num:Number):String
		{
			if( Common.isCoin )
				return (num+"").replace(".","?");
			else
				return ("Y"+num.toFixed(2)).replace(".","?");
		}
		
		/**
		 * 如果是现金，转化为分为单位，发送给服务器
		 * @param uin64
		 * @return 
		 */
		public static function setUint64Money(num:Number):UInt64
		{
			if( Common.isCoin )
				return UInt64.parseUInt64(num+"");
			else
				return UInt64.parseUInt64(num*100+"");
		}
		/**
		 * 如果是现金，转化为元 ，前端现金用元做单位
		 * @param uin64
		 * @return 
		 */		
		public static function getUint64Money(uin64:UInt64):Number
		{
			if( Common.isCoin )
				return uin64.toNumber();
			else
				return uin64.toNumber()/100; 
		}
		/**
		 * 将服务发送过来的Money结构，转化成Number,并且如果是现金，转化成前端的金币单位元
		 * @param money
		 * @return 
		 */		
		public static function getMoney(money:Money):Number
		{
			if( Common.isCoin ) 
				return ( money.hasCoin ? money.coin.toNumber() : 0 ) ;
			else
				return ( money.hasCash ? money.cash.toNumber()/100 : 0 ) + ( money.hasNm ? money.nm.toNumber()/100 : 0 );
		}
		
		public static function getMoneyByType(num:Number, isCoin:Boolean):Number
		{
			if( isCoin )
				return num;
			else
				return num/100; 
		}
		
		public static function gc():void
		{
			try{   
				//Loger.get().logPrint("强制垃圾回收前："+ (System.privateMemory / 1024 / 1024).toFixed(2) + "M" );
				Loger.get().logPrint("强制垃圾回收前："+ (System.totalMemory / 1024 / 1024).toFixed(2) + "M" ); 
				new LocalConnection().connect("foo");  
				new LocalConnection().connect("foo"); 
				Loger.get().logPrint("强制垃圾回收后："+ (System.totalMemory / 1024 / 1024).toFixed(2) + "M"); 
			}catch(error : Error){   
				Loger.get().logPrint("强制垃圾回收后："+ (System.totalMemory / 1024 / 1024).toFixed(2) + "M");
			}  
		}
		
		
		
	}
}