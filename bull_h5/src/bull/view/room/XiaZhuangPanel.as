package bull.view.room
{
	import com.IProtobuf.Long;
	import laya.events.Event;
	import ui.ui.room.BankerSettleUI
	
	public class XiaZhuangPanel extends BankerSettleUI
	{								
		private var _data:Array=[];		
		
		public function XiaZhuangPanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();	
			
			this.visible = false;			
			
			close_btn.on(Event.CLICK, this, onClick);
			ok_btn.on(Event.CLICK, this, onClick);			
			
		}

		protected function onClick(event:Event):void
		{
			this.visible = false;
		}		
		
		public function show(value:Array,totalAmount:Long):void
		{
			this.visible = true;			
			xiazhuang_list.array = value;			
			
			//TODO 幣值符號
			var win:Number=0;
			if( Common.isCoin )
			{
				win = totalAmount.toNumber();
			}
			else  win = totalAmount.toNumber() / 100;
			
			total_txt.text = GameUtil.formatMoney(win);			
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
						   
			view.bankerResultPanel.show(data);
					
		}
		

	}
}