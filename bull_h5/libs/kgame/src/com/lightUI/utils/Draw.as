package com.lightUI.utils
{
	import com.lightUI.core.Light;
	
	import laya.display.Sprite;
	import laya.maths.Rectangle;
	import laya.utils.Color;
	
	public class Draw
	{
		
		public static function drawRect(rect:Rectangle, color:Color = null):Sprite{
			
			color = color?color:Color.create(0xff0000);
			
			var re:Sprite = new Sprite();
			//re.graphics.drawRect(rect.x,re.y,re.width,re.height,color);
			//re.graphics.drawRect(0,0,Light.root.stage.width, Light.root.height,Color.create(0xff0000));
			re.graphics.drawRect(rect.x,rect.y,rect.width,rect.height,color);
			return re;
		}
		
		public static function drawCircle(x:Number,y:Number,r:Number,color:Color = null):Sprite{
			
			color = color?color:Color.create(0xff0000);
			var re:Sprite = new Sprite();
			re.graphics.drawCircle(x,y,r,color);
			return re;
		}
		
		public static function drawCircleBoder(x:Number,y:Number,r:Number,thickness:int = 1,color:Color = null):Sprite{
			color = color?color:Color.create(0xff0000);
			var re:Sprite = new Sprite();
			re.graphics.drawCircle(x,y,r,null,color,thickness);
			return re;
		}
		
		public static function drawBoder(rect:Rectangle, thickness:int, color:Color = null):Sprite{
			color = color?color:Color.create(0xff0000);
			var re:Sprite = new Sprite();
			re.graphics.drawRect(rect.x,rect.y,rect.width,rect.height,null,color,thickness);
			return re;
		}
	}
}