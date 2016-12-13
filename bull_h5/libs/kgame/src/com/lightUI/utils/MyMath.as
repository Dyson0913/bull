package com.lightUI.utils
{
	/**
	 * @author light
	 * 创建时间：2015-9-21 上午9:44:04
	 * 
	 */
	public class MyMath
	{
		public static function getPersent(num1:Number,num2:Number):String{
			return  Math.ceil((num1/num2)*100)+"%";
		}
		
		public static function randomIntRange(minNum:Number, maxNum:Number):int
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		public static function randomFromChange(...arg):void{
			
		}
		
		public static function randomFrom(...arg):*{
			return arg[randomIntRange(0,arg.length)];
		}
		
		public static function randomFromArray(arg:Array):*{
			return arg[randomIntRange(0,arg.length-1)];
		}
		
		public static function between(num:Number,n1:Number,n2:Number):Boolean{
			if(n2>n1){
				var temp:Number = n1;
				n1 = n2;
				n2 = temp;
			}
			if(num<=n1 && num>=n2) return true;
			return false;
		}
		
		public static function sun(...arg):Number{
			var sun:Number = 0;
			for (var i:int = 0; i < arg.length; i++) 
			{
				sun += arg[i];
			}
			return sun;
			
		}
	}
}