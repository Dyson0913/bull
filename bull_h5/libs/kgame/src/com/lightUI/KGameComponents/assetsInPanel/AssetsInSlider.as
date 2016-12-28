package com.lightUI.KGameComponents.assetsInPanel
{
	import com.lightUI.core.Light;
	
	import laya.events.Event;
	
	import ui.ui.assetsInPanel.AssetsInSliderUI;
	
	public class AssetsInSlider extends AssetsInSliderUI
	{
		private var _canEdit:Boolean = true;
		
		public function AssetsInSlider()
		{
			super();
			min_btn.on(Event.MOUSE_DOWN, this,minHandler);
			max_btn.on(Event.MOUSE_DOWN,this,maxHandler);
			//Light.timer.setTimeout(this,test,10,null);
			slider.on(Event.CHANGE,this, onChange);
			callLater(test);
			slider_bar.width = 0;
		}
		
		private function onChange():void{
//			trace("AssetsInSlideronChange",slider.value,slider.max,slider.min)
//			trace("AssetsInSlideronChange",slider.tick)
			slider_bar.width = (slider.value - slider.min)/(slider.max - slider.min)*188;
		}
		
		private function test():void{
			slider.bar.y += 3;
			slider_bar.x = 0;
			slider_bar.y = 0;
			slider.addChildAt(slider_bar,slider.getChildIndex(slider.bar));
		}
		
		private function minHandler():void{
			slider.value = slider.min;
		}
		
		private function maxHandler():void{
			slider.value = slider.max;
		}

		public function get canEdit():Boolean
		{
			return _canEdit;
		}

		public function set canEdit(value:Boolean):void
		{
			_canEdit = value;
			this.mouseEnabled = value;
			//slider.mouseEnabled = value;
		}
		
		public function clear():void{
			slider.value = 0;
		}
	}
}