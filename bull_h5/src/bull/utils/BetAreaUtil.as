package bull.utils
{
	import com.lightUI.utils.MyMath;
	
	import laya.maths.Point;
	import laya.maths.Rectangle;

	public class BetAreaUtil
	{
		public static function getRandomByRectangle(index:uint,rec:Rectangle):Point{
			var recX:int = rec.x;
			var recY:int = rec.y;
			var recW:int = rec.width;
			var recH:int = rec.height;
			recX += 30;
			recY += 60;
			recW -= 80;
			recH -= 110;			
			var x:Number = MyMath.randomIntRange(recX,recX + recW);
			var y:Number = MyMath.randomIntRange(recY,recY + recH);
			return new Point(x,y);
		}
		
	}
}



