package BullHall.view
{
	
	
	import BullHall.utils.FormartUtils;
	
	import conf.ENRoomType;
	
	import kg.components.button.Button;
	import kg.components.tabBar.TabBar;
	import kg.core.LUIComponent;
	import kg.core.assetsloader.LightAssetManager;
		
	
	public class BullHallView extends LUIComponent
	{
		public var viewMarquee:Marquee;
		public var btnPageLeft:Button;
		public var btnPageRight:Button;
		
		public var mcMoney:Button;
		public var mcMoneyG:Button;
		
		public var typeTabBar_tb:TabBar;
				
		public var mcRoomItem0:RoomItem;
		public var mcRoomItem1:RoomItem;		
		
		public var items:Array;		
		public var select_type:int;
		public var Table_info:Array;
		
		public function BullHallView()
		{
			super();
			items = [];
			Table_info = [];
		}
		
		override protected function creatChild():void
		{
			super.creatChild();
			items.push(mcRoomItem0);
			items.push(mcRoomItem1);
			
			mcRoomItem0.name = "0";
			mcRoomItem1.name = "1";
			//btnPageLeft.addEventListener(MouseEvent.CLICK, onPageClick, false, 0, true);
//			btnPageRight.addEventListener(MouseEvent.CLICK, onPageClick, false, 0, true);
			
			mcMoney.addEventListener(MouseEvent.CLICK, onMoneyClick, false, 0, true);
			mcMoneyG.addEventListener(MouseEvent.CLICK, onMoneyGClick, false, 0, true);			
			//mcMoney.toggle = true;
			//mcMoneyG.toggle = true;
			
			//typeTabBar_tb.setSize(typeTabBar_tb.width,typeTabBar_tb.height)
			//typeTabBar_tb.updataView();
			initList();
		}
		
		protected function onMoneyClick(event:MouseEvent):void
		{
			mcRoomItem0.bg_change(3);
			mcRoomItem1.bg_change(4);
			
			mcRoomItem0.GbtnJoin.visible = false;
			mcRoomItem1.GbtnJoin.visible = false;
			mcRoomItem0.btnJoin.visible = true;
			mcRoomItem0.btnJoin.visible = true;
			
			select_type = conf.ENRoomType.ROOM_TYPE_CASH_NM;
			updateList([Table_info[2],Table_info[3]]);
		}
		
		public  function select_Coin():void
		{
			mcRoomItem0.bg_change(1);
			mcRoomItem1.bg_change(2);
			mcRoomItem0.GbtnJoin.visible = true;
			mcRoomItem1.GbtnJoin.visible = true;
			mcRoomItem0.btnJoin.visible = false;
			mcRoomItem0.btnJoin.visible = false;		
			
			
			select_type = conf.ENRoomType.ROOM_TYPE_COIN;
			updateList([Table_info[0],Table_info[1]]);
		}
		
		public  function select_Money():void
		{
			mcRoomItem0.bg_change(3);
			mcRoomItem1.bg_change(4);
			
			mcRoomItem0.GbtnJoin.visible = false;
			mcRoomItem1.GbtnJoin.visible = false;
			mcRoomItem0.btnJoin.visible = true;
			mcRoomItem0.btnJoin.visible = true;
			
			select_type = conf.ENRoomType.ROOM_TYPE_CASH_NM;
			updateList([Table_info[2],Table_info[3]]);
		}
		
		
		
		
		protected function onMoneyGClick(event:MouseEvent):void
		{
			mcRoomItem0.bg_change(1);
			mcRoomItem1.bg_change(2);
			mcRoomItem0.GbtnJoin.visible = true;
			mcRoomItem1.GbtnJoin.visible = true;
			mcRoomItem0.btnJoin.visible = false;
			mcRoomItem0.btnJoin.visible = false;		
			
			select_type = conf.ENRoomType.ROOM_TYPE_COIN;
			updateList([Table_info[0],Table_info[1]]);
		}
		
		
		public function initList():void
		{			
			
			mcRoomItem0.bg_change(1);
			mcRoomItem1.bg_change(2);
			mcRoomItem0.GbtnJoin.visible = true;
			mcRoomItem1.GbtnJoin.visible = true;
			
			select_type = conf.ENRoomType.ROOM_TYPE_COIN;
			
			LightAssetManager.getInstance().sound = true;
			LightAssetManager.getInstance().music = true;
		}
		
		public function update(arr:Array):void
		{
			Table_info = arr;
		}
		
		public function updateList(arr:Array):void
		{		
			var i:int;
			for ( i = 0; i < items.length; i++ ) 
			{
				var roomItem:RoomItem= items[i];				
				roomItem.update_info(arr[i]);				
			}
			
		}
		
	}
}