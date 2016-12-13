package com.lightUI.utils
{
	import laya.display.Sprite;

	public class DisplayUtil
	{
		public static function removeAllChildren(container:Sprite):void{
			var l:int = container.numChildren;
			for (var i:int = 0; i < l; i++) 
			{
				container.removeChildAt(0);
			}
		}
	}
}