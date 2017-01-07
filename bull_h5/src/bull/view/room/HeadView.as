package bull.view.room
{
	import laya.events.Event;
	
	import laya.utils.Handler;
	import ui.ui.room.HeadViewUI
	
	public class HeadView extends HeadViewUI
	{						
		private var _CarryInClickHandler:Handler;
		
		public function HeadView()
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			txtName.text = "";
			txtMoney.text = "";
			mcMoneyIcon.visible = false;
			mcVip.visible = false;
			
			bp_vip.label = "";			
			btnAdd.on(Event.CLICK, this, onClick);
		}
		
		protected function onClick(event:Event):void
		{
			if( _CarryInClickHandler )
			{
				_CarryInClickHandler.method.apply(_CarryInClickHandler.args);
				
			}
			
		}		
		
		public function setName(str:String):void
		{
			txtName.text = str;
		}
		public function setMoney(num:Number):void
		{
			txtMoney.text = GameUtil.formatMoney1(num); 
		}
		public function setMoneyT(num:uint):void
		{
			mcMoneyIcon.visible = true;
		}
		
		public function setVip(vipLevel:int):void
		{
			if( vipLevel >0)
			{
				mcVip.visible = true;
				bp_vip.text = vipLevel.toString();
			}
			
		}
		
		public function setHead(str:String):void
		{			
			mcHead.source = str;			
			
		}
		
		public function addCarryClick( ClickHandler:Handler ):void
		{
			_CarryInClickHandler = ClickHandler;
		}
	}
}