package bull.view.room
{
	import laya.events.Event;
	
	import laya.utils.Handler;
	import ui.ui.room.HeadViewUI
	
	public class HeadView extends HeadViewUI
	{
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
			
			bp_vip.text = "";			
			btnAdd.on(Event.CLICK, this, onClick);
			btnAdd.on(Event.MOUSE_OVER, this, onOver);
			btnAdd.on(Event.MOUSE_OUT, this, onOut);
		}
		
		protected function onClick(event:Event):void
		{
			
		}		
		
		protected function onOver(event:Event):void
		{
			carry_tips.visible = true;			
		}		
		
		protected function onOut(event:Event):void
		{
			carry_tips.visible = false;
		}		
		
		public function setName(str:String):void
		{
			txtName.text = str;
		}
		public function setMoney(num:String):void
		{
			txtMoney.text = num
		}
		public function setMoneyT(value:Boolean):void
		{
			mcMoneyIcon.visible = value;
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
			mcHead.loadImage(str, 0, 0, 68, 67);
		}		
	}
}