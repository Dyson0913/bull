package com.iflash.events
{
	import laya.display.Sprite;
	import laya.events.EventDispatcher;
	import laya.utils.Dictionary;
	
	
	public class EventDispatcher extends laya.events.EventDispatcher
	{
		public function EventDispatcher()
		{
			super();
		}
		
		public function addEventListener(type:String, caller:*, listener:Function,arge:Array = null,useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			this.on(type,caller,listener,arge);
		}
		
		public function addEventListenerOnce(type:String, caller:*, listener:Function,arge:Array = null):void{
			this.once(type,caller,listener,arge);
		}
		
		public function removeEventListener(type:String,caller:*, listener:Function, useCapture:Boolean=false):void
		{
			//this.removeEventListener(type,listener);
			this.off(type,caller,listener);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			event.target = this as Sprite;
			return this.event(event.type,event);
		}
		
		private var _eventMap:Dictionary = new Dictionary();
		/**
		 * 延迟发送事件  可以把相同的事件合并为一次发送  最典型的应用场景是 数据模型里每一个属性设置后都派发一次change事件  但如果一次性设置几个属性的话 可以合并为一个change事件发送 
		 * @param event
		 * 
		 */		
		public function dispatchEventDelay(event:Event):void{
			_eventMap[event.type] = event;
			Laya.timer.once(1,this,delayDispatch);
		}
		private function delayDispatch():void{
			for each (var event:Event in _eventMap) 
			{
				dispatchEvent(event);
				delete _eventMap[event.type];
			}
		}
	}
}