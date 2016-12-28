package com.lightUI.KGameComponents.assetsInPanel
{
		import com.lightUI.utils.FormartUtils;
		
		import laya.events.Event;
		
		import ui.ui.assetsInPanel.SmallPanelUI;
	
	public class SmallPanel extends SmallPanelUI
	{
		public var vo:AssetsVO;
		
		public function SmallPanel()
		{
			super();
			init();
		}
		
		private function init():void{
			roomName_txt.mouseEnabled = false;
			total_txt.mouseEnabled = false;
			amount_txt.mouseEnabled = false;
			minmum_txt.mouseEnabled = false;
			maxmum_txt.mouseEnabled = false;
			total_describe_txt.mouseEnabled = false;
			amount_describe_txt.mouseEnabled = false;
			
			
		}
		
		private function onSliderChange():void{
			//amount_txt.text = slider.slider.value.toString();
			
			amount_txt.text = formartMoney(slider.slider.value,vo.currency);
			
			if(vo.currency == CurrencyType.CASH){
				vo.amount_cash = slider.slider.value;
			}else{
				vo.amount_coin = slider.slider.value;
			}
		}
		
		public function showMe(vo:AssetsVO):void{
			this.visible = true;
			
			this.vo = vo;
			
			slider.slider.on(Event.CHANGE, this, onSliderChange);
			
			if(vo.currency == CurrencyType.CASH){
				total_txt.text = formartMoney(vo.cash);
				total_describe_txt.text = "可用现金：";
				
				if(vo.max < vo.cash){
					maxmum_txt.text = "("+formartMoney(vo.max)+")";
					slider.slider.max = vo.max;
				}else{
					maxmum_txt.text = "("+formartMoney(vo.cash)+")";
					slider.slider.max = vo.cash;
				}
				
				minmum_txt.text = "("+formartMoney(vo.min)+")";
				slider.slider.min = vo.min;
				
				slider.slider.tick = vo.cash_step;
				//显示刻度线
				//slider.slider.tickInterval = vo.cash_step; 
			}else if(vo.currency == CurrencyType.COIN){
				total_txt.text = String(vo.coin);
				total_describe_txt.text = "可用G币：";
				
				if(vo.max < vo.coin){
					maxmum_txt.text = "("+String(vo.max)+")";
					slider.slider.max = vo.max;
				}else{
					maxmum_txt.text = "("+String(vo.coin)+")";
					slider.slider.max = vo.coin;
				}
				
				minmum_txt.text = "("+String(vo.min)+")";
				slider.slider.min = vo.min;
				
				slider.slider.tick = vo.coin_step;
				//slider.slider.tickInterval = vo.coin_step;
			}
			
			if(slider.slider.value == vo.amount_default)  onSliderChange()
			else  slider.slider.value = vo.amount_default;
			popupCenter =true;
			popup();
		}
		
		public function clear():void{
			slider.slider.off(Event.CHANGE, this, onSliderChange);
			slider.clear();
		}
		
		/**
		 * 两位小数标准显示
		 * @param num
		 * @param type
		 * @return 
		 * 
		 */		
		public function formartMoney(num:Number,type:int = 0):String{
			var re:String = String(num);
			if(type != CurrencyType.COIN){
				re = FormartUtils.pointNumber(num);
			}else{
				re = Math.floor(num).toString();
			}
			return re;
		}
		
		public function set roomName(value:String):void{
			roomName_txt.text = value;
		}
		public function get roomName():String{
			return roomName_txt.text;
		}
		
		public function set tip(value:String):void{
			//tips_txt.text = value;
		}
		public function get tip():String{
			return "";
		}
	}
}
