package bull.view.room
{
	import com.lightUI.events.LightEvent;
	import laya.display.Animation;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.ui.List;

	
	public class PlayerListRender extends Box
	{
		private var _bg:Animation;
		private var _Head:Image;
		private var _Name:Label;
		private var _Money:Label;
		
		private var _light:Image;
		
		private var _Vip:Image;
		
		public var index:int;
		
		public function PlayerListRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			_bg = getChildByName("bg") as Animation;
			_light = getChildByName("light") as Image;
			
			_Head = getChildByName("Head") as Image;
			_Vip = getChildByName("Vip") as Image;
			
			_Name = getChildByName("Name") as Label;
			_Money = getChildByName("Money") as Label;
			index = 0;
			
			hideAllState();
		}
		
		private function hideAllState():void {	
			_bg.index = 0;
			_light.visible = false;
			_Head.visible = false;			
			_Vip.visible = false;
			_Name.text = "";
			_Money.text = "";			
		}
		
		
		override public function set dataSource(value:*):void{			
						
			if(value == null) return;
			trace("value ="+value);
			var arr:Array = value;			
			_bg.index = index;
			index  = (index + 1 % 2);			
			
			_light.visible = arr["is_light"];
			_Name.text = arr["name"];
			_Money.text = arr["win_money"];
			
			_Head.visible = true;
			
			//TODO head
			//_Head.loadImage(
			//_Vip
			
			
			
		}
		
	}
}