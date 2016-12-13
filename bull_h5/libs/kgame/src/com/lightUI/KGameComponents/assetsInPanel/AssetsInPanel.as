package com.lightUI.KGameComponents.assetsInPanel
{
	import laya.events.Event;
	
	import ui.ui.assetsInPanel.AssetsInPanelUI;

//	[Event(name="ok", type="KGameComponents.assetsInPanel.AssetsInEvent")]
//	[Event(name="cancel", type="KGameComponents.assetsInPanel.AssetsInEvent")]
	
	public class AssetsInPanel extends AssetsInPanelUI
	{
		public var vo:AssetsVO = new AssetsVO();
		
		
		
		
		/**
		 * 弹出淡入面板 
		 * @param min	最小带入
		 * @param max	最大带入
		 * @param currency			CurrencyType.CASH
		 * @param amount_default	默认带入
		 * @param cash		现金总量
		 * @param coin		虚拟币总量
		 * @param nm		尼玛
		 * @param cash_step		现金步长
		 * @param coin_step		虚拟币步长
		 * 
		 */		
		public function assetsIn(min:Number
									  ,max:Number
									   ,currency:Number
										,amount_default:Number
										 ,cash:Number = 0
										  ,coin:Number = 0
										   ,nm:Number = 0
											,cash_step:Number = 1
											 ,coin_step:Number = 1):void{
			
			largePanel.clear();
			smallPanel.clear();
			vo.clear();
			vo.min = min;
			vo.max = max;
			vo.currency = currency;
			vo.amount_default = amount_default;
			vo.cash = cash;
			vo.coin = coin;
			vo.nm = nm;
			vo.cash_step = cash_step;
			vo.coin_step = coin_step;
			
			hideAll();
			if(currency == CurrencyType.CASHANDNM){
				largePanel.showMe(vo);
			}else{
				smallPanel.showMe(vo);
			}
		}
		
		public function AssetsInPanel():void{

			smallPanel.ok_btn.on(Event.MOUSE_DOWN,this, onOk);
			smallPanel.cancel_btn.on(Event.MOUSE_DOWN,this,onCancel);
			smallPanel.close_btn.on(Event.MOUSE_DOWN,this,onCancel);
			
			largePanel.btn_ok.on(Event.MOUSE_DOWN,this, onOk);
			largePanel.btn_canel.on(Event.MOUSE_DOWN,this,onCancel);
			largePanel.btnClose.on(Event.MOUSE_DOWN,this,onCancel);
		}
		
		private function onOk():void{
			event(AssetsInEvent.OK,vo);
		}
		
		private function onCancel():void{
			event(AssetsInEvent.CANCEL);
		}
		
		private function hideAll():void{
			if(largePanel.visible) largePanel.visible = false;
			if(smallPanel.visible) smallPanel.visible = false;
		}
		
		
		override public function destroy(destroyChild:Boolean=true):void{
			super.destroy(destroyChild);
			
			smallPanel.ok_btn.off(Event.MOUSE_DOWN,this, onOk);
			smallPanel.cancel_btn.off(Event.MOUSE_DOWN,this,onCancel);
			smallPanel.close_btn.off(Event.MOUSE_DOWN,this,onCancel);
			
			largePanel.btn_ok.on(Event.MOUSE_DOWN,this, onOk);
			largePanel.btn_canel.on(Event.MOUSE_DOWN,this,onCancel);
			largePanel.btnClose.on(Event.MOUSE_DOWN,this,onCancel);
			
			largePanel = null;
			smallPanel = null;
			vo = null;
		}
		
//		public function set tip(value:String):void{
//			largePanel.tip = value;
//		}
//		public function get tip():String{
//			return largePanel.tip;
//		}
		
		public function set roomName(value:String):void{
			//largePanel.roomName = value;
			smallPanel.roomName = value;
		}
		public function get roomName():String{
			//return roomName_txt.text;
			//return largePanel.roomName;
			return smallPanel.roomName;
		}
		
		public function close():void
		{
			// TODO Auto Generated method stub
			largePanel.close();
			smallPanel.close();
		}
	}
}