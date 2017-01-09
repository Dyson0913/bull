package bull.view.room
{	
	
	import laya.events.Event;
	import ui.ui.room.PlayerListUI	
	
	public class PlayerListPanel extends PlayerListUI
	{
		
		public function PlayerListPanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();	
			
			this.visible = false;
			clostBtn.on(Event.CLICK, this, onClick);
		}

		protected function onClick(event:Event):void
		{			
			this.visible = false;			
			
		}		
		
		public function show(data:Array):void
		{
			this.visible = true;			
			list.array = data;	
		}
		
		private function test():void
		{
		var data:Array = [ { "uid":123, "money":1000, "is_light":true, "win_money":100, "name":"dyson01" }, 
			               { "uid":456, "money":-2000, "is_light":true, "win_money":1000,"name":"dyson02" },
						   { "uid":789, "money":2000, "is_light":false, "win_money":2000,"name":"dyson03" },
						   { "uid":1000, "money":3000, "is_light":true, "win_money":3000, "name":"dyson04"},
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson05" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson06" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson07" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson08" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson09" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson10" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson11" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson12" },
						   { "uid":1000, "money":100, "is_light":true, "win_money":4000,"name":"dyson13" }
						   ];
						   
			view.ViewPlayerList.show(data);
					
		}
		
	}
}