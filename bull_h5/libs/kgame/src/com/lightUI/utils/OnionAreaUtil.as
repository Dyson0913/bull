package com.lightUI.utils
{
	import laya.maths.Point;
	import laya.maths.Rectangle;

	public class OnionAreaUtil
	{
		private var _odds:Array = [];
		private var _oddLength:int;
		
		public function OnionAreaUtil(odds:Array = null)
		{
		}
		
		public function setOdds(...arg):void{
			var sun:Number = MyMath.sun.apply(this,arg);
			var totle:Number = 0;
			var l:int = arg.length;
			for (var i:int = 0; i < l; i++) 
			{
				totle += arg[i]/sun;
				_odds.push(totle);
			}
			_oddLength = _odds.length;
		}
		
		public function getRandom():int{
			var random:Number = Math.random();
			var re:int = -1;
			var startFlg:Number = 0;
			var endFlg:Number;
			var l:int = _odds.length;
			for (var i:int = 0; i < l; i++) 
			{
				endFlg = _odds[i];
				if(random < endFlg && random >= startFlg) return i;
			}
			return re;
		}
		
		private var _radius:Number = -1;
		private var _steep_r:Number;
		public function getRandomByCircle(r:Number):Point{
			if(r != _radius){
				_radius = r;
				_steep_r = _radius/_oddLength;
			}
			
			var re:Point = new Point();
			//随机角度
			var rth:int = MyMath.randomIntRange(0,360);
			var random:int = getRandom();
			
			var steep_r:Number = r/_oddLength;
			var start:Number = steep_r*random;
			var end:Number = start + steep_r;
			
			var rr:int = MyMath.randomIntRange(start,end);
			re.x = rr * Math.cos(rth);
			re.y = rr * Math.sin(rth);
			return re;
		}
	}
}