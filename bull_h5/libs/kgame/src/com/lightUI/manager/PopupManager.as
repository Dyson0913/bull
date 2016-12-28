package com.lightUI.manager
{
	import com.lightUI.core.Light;
	import com.lightUI.utils.Draw;
	
	import laya.debug.tools.MouseEventAnalyser;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Rectangle;
	import laya.ui.Dialog;
	import laya.utils.Color;
	import laya.utils.Dictionary;

	public class PopupManager
	{
		public function PopupManager()
		{
		}
		
		public static var objDic:Dictionary = new Dictionary();
		
		public static function addPopUp(window:Sprite,
										parent:Sprite = null,
										modal:Boolean = false,modalColor:Color = null,modalAlpha:Number = 0.60):void
		{
			modalColor = modalColor?modalColor:Color.create(0xff0000);
			
			parent = parent?parent:Light.root;
			if(modal){
				
				trace("addPopUp test")
				
				var sp:Sprite = Draw.drawRect(new Rectangle(0,0,Light.root.stage.width, Light.root.height),modalColor);
				//sp.graphics.drawCircle(100,100,50,Color.create("0xff0000"));
				//sp.graphics.drawRect(0,0,Light.root.stage.width, Light.root.height,Color.create("0xff0000"));
				sp.alpha = modalAlpha;;
				parent.addChild(sp);
				parent.addChild(window);
				
				sp.width = Light.root.stage.width;
				sp.height = Light.root.stage.height;
				
				sp.mouseEnabled = true;
				
				
				objDic[window] = sp;
			}else{
				parent.addChild(window);
				objDic[window] = window;
			}
		}
		
		private function test():void{
			
		}
		
		public static function removePopUp(popUp:Sprite):void
		{
			var sp:Sprite = objDic[popUp];
			delete objDic[popUp];
			if(popUp.parent) {
				popUp.parent.removeChild(popUp);
			}
			if(sp && sp.parent){
				sp.parent.removeChild(sp);
			}
		}
		
		public static function centerPopUp(popUp:Sprite,rect:Rectangle = null):void
		{
			if(rect != null){
				popUp.x = (rect.width - popUp.width)/2;
				popUp.y = (rect.height - popUp.height)/2;
			}else{
				if((popUp.parent as Sprite).width == 0 && (popUp.parent as Sprite).height == 0){
					popUp.x = (Light.root.width - popUp.width)/2;
					popUp.y = (Light.root.height - popUp.height)/2;
				}else{
					popUp.x = ((popUp.parent as Sprite).width - popUp.width)/2;
					popUp.y = ((popUp.parent as Sprite).height - popUp.height)/2;
				}
			}
		}
		
		public static function bringToFront(popUp:Sprite):void
		{
			
		}
	}
}