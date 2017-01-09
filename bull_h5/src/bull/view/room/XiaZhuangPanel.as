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
			
			//view.bankerResultPanel.show(roomData.Banker_calcu_info.banker_calc_info_s,roomData.Banker_calcu_info.total_win_money);
					
		}
		

	}
}