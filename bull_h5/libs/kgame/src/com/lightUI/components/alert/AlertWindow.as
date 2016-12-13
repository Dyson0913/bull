package com.lightUI.components.alert
{
	import com.lightUI.components.alert.IAlertWindow;
	import com.lightUI.events.WindowEvent;
	
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.ui.Button;
	
	import ui.ui.alert.AlertPanelUI;
	
	public class AlertWindow extends AlertWindowUI implements IAlertWindow
	{
		private var _data:Object;
		
		public function AlertWindow()
		{
			super();
			init();
		}
		
		private function init():void{
			var l:int = this.numChildren;
			var child:Sprite;
			
			trace("adfadfasdfasf");
			
			for (var i:int = 0; i < l; i++) 
			{
				child = this.getChildAt(i) as Sprite;
				
				if(this.getChildAt(i) is Button){
					child.on(Event.MOUSE_DOWN,this,onClick);
				}
			}
		}
		
		private function onClick(e:Event):void{
			//trace("onClick",e.target.name)
			this.event(WindowEvent.CLOSE,e.target.name);
		}
		
		public function set title(value:String):void{
			title_label.text = value;
		}
		
		public function set msg(value:String):void{
			msg_label.text = value;
		}
		
		public function set data(value:Object):void{
			_data = value;
		}
		
		public function get data():Object{
			return _data;
		}
	}
}
