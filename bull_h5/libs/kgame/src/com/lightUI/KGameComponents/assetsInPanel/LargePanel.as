package com.lightUI.KGameComponents.assetsInPanel
{
	import com.lightUI.utils.FormartUtils;
	
	import laya.events.Event;
	
	import ui.ui.assetsInPanel.LargePanelUI;
	
	public class LargePanel extends LargePanelUI
	{
		private var _vo:AssetsVO;
		
		public function LargePanel()
		{ 
			super();
			init();
		}
		
		private function init():void{
			roomName_txt.mouseEnabled = false;
			range_txt.mouseEnabled = false;
			total_cash_txt.mouseEnabled = false;
			total_nm_txt.mouseEnabled = false;
			amount_total_txt.mouseEnabled = false;
			cash_txt.mouseEnabled = false;
			nm_txt.mouseEnabled = false;
			tips_txt.mouseEnabled = false;
		}
		
		public function showMe(vo:AssetsVO):void{
			this.visible = true;
			
			nm_slider.slider.on(Event.CHANGE,this, onNmChange);
			cash_slider.slider.on(Event.CHANGE,this, onCashChange);
			
			_vo = vo;
			updataView();
			popupCenter =true;
			popup();
		}
		
		private function updataView():void{
			
			//如果默认带入小于 最小带入  返回错误
			if(_vo.amount_default < _vo.min) throw new Error("默认带入不能小于最小带入","0");
			
			//如果资金总额 小于 最小带入 返回错误
			if(_vo.nm + _vo.cash < _vo.min) throw new Error("资金不足请","1");
			
			
			range_txt.text = "("+formartMoney(_vo.min)+"--"+formartMoney(_vo.max)+")";
			total_cash_txt.text = formartMoney(_vo.cash);
			total_nm_txt.text = formartMoney(_vo.nm);
			
			cash_slider = initClider(cash_slider,_vo.cash,_vo.min,_vo.max,_vo.cash_step,_vo.amount_default);
			nm_slider = initClider(nm_slider,_vo.nm,_vo.min,_vo.max,_vo.cash_step,_vo.amount_default);
		}
		
		private function initClider(slider:AssetsInSlider, money:Number, min:Number, max:Number,step:Number,defaul:Number):AssetsInSlider{
			
			slider.slider.min = 0;
			
			slider.canEdit = true;
			
			if(money == 0){
				trace("关闭拖动条");
				slider.canEdit = false;
				
				slider.slider.max = 1;
				slider.slider.tick = step;
				slider.slider.value = 0;
			}else if(money < max){
				//slider.slider.minimum = min;
				slider.slider.max = money;
				slider.slider.tick = step;
				slider.slider.value = defaul;
			}else if(money >= max){
				//slider.slider.minimum = min;
				slider.slider.max = max;
				slider.slider.tick = step;
				slider.slider.value = defaul;
			}
			return slider;
		}
		
		
		private function onNmChange():void{
			
			nm_txt.text = formartMoney(nm_slider.slider.value);
			_vo.amount_nm = nm_slider.slider.value;
			
			_vo.amount_total = _vo.amount_cash + _vo.amount_nm;
			
			
			if(!cash_slider.canEdit){
				if(_vo.amount_total < _vo.min){
					nm_slider.slider.value = lessValue(_vo.min);
				}
			}else{
				if(_vo.amount_total < _vo.min){
					if(_vo.cash + _vo.amount_nm >= _vo.min) cash_slider.slider.value = lessValue(_vo.min - _vo.amount_nm);
				}else if(_vo.amount_total > _vo.max){
					cash_slider.slider.value = lessValue(_vo.max - _vo.amount_nm);
				}
			}
			
			//trace("onNmChange",_vo.amount_total,_vo.max)
			//			if(_vo.amount_total > _vo.max){
			//				cash_slider.slider.lessValue = _vo.max - _vo.amount_nm;
			//				//_vo.amount_total = _vo.max;
			//				//trace("change: ",_vo.max , _vo.amount_nm)
			//			}
			
			//trace("onNmChange",_vo.amount_cash,_vo.amount_nm,_vo.amount_total)
			amount_total_txt.text = formartMoney(_vo.amount_total);
			
			trace("onNmChange ",_vo.amount_cash,_vo.amount_nm)
		}
		
		private function lessValue(value:Number):Number{
			return Math.floor(value);
		}
		
		private function onCashChange():void{
			
			cash_txt.text = formartMoney(cash_slider.slider.value);
			_vo.amount_cash = cash_slider.slider.value;
			
			_vo.amount_total = _vo.amount_cash + _vo.amount_nm;
			
			
			if(!nm_slider.canEdit){
				if(_vo.amount_total < _vo.min){
					cash_slider.slider.value = lessValue(_vo.min);
				}
			}else{
				if(_vo.amount_total < _vo.min){
					//cash_slider.slider.lessValue = _vo.min;
					if(_vo.nm + _vo.amount_cash >= _vo.min) nm_slider.slider.value = lessValue(_vo.min - _vo.amount_cash);
				}else if(_vo.amount_total > _vo.max){
					nm_slider.slider.value = lessValue(_vo.max - _vo.amount_cash);
				}
			}
			
			
			//			if(_vo.amount_total > _vo.max){
			//				nm_slider.slider.lessValue = _vo.max - _vo.amount_cash;
			//				//_vo.amount_total = _vo.max;
			//			}
			
			//trace("onCashChange",_vo.amount_cash,_vo.amount_nm,_vo.amount_total)
			amount_total_txt.text = formartMoney(_vo.amount_total);
			
			//amount_total_txt.text = String(_vo.amount_cash + _vo.amount_nm);
			
			trace("onCashChange",_vo.amount_cash,_vo.amount_nm)
		}
		
		/**
		 * 两位小数标准显示  金币尼玛的话 要除以100
		 * @param num
		 * @param type
		 * @return 
		 * 
		 */		
		public function formartMoney(num:Number,type:int = 0):String{
			var re:String = String(num);
			if(type != CurrencyType.COIN){
				re = FormartUtils.pointNumber(num);
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
			tips_txt.text = value;
		}
		public function get tip():String{
			return tips_txt.text;
		}
		
		public function clear():void{
			nm_slider.slider.off(Event.CHANGE,this, onNmChange);
			cash_slider.slider.off(Event.CHANGE,this, onCashChange);
			
			
			amount_total_txt.text = formartMoney(0);
			cash_txt.text = formartMoney(0);
			nm_txt.text = formartMoney(0);
			
			cash_slider.clear();
			nm_slider.clear();
		}

		public function get vo():AssetsVO
		{
			return _vo;
		}

		public function set vo(value:AssetsVO):void
		{
			_vo = value;
		}

	}
}