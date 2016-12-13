package com.lightUI.components.tipsLoadPanel
{
	import laya.ui.Label;
	import laya.ui.ProgressBar;
	import laya.ui.View;

	/**
	 * 带tips的加载面板 
	 * @author light-k
	 * 
	 */	
	public class TipsLoadPanel extends View
	{
		
		public var tip_txt:Label;
		public var bar:ProgressBar;
		public var msg_txt:Label;
		
		private var _tips:Array;
		private var _tipIndex:int = 0;
		
		public function TipsLoadPanel()
		{
			super();
		}
		
		public function show(value:Number):void{
			bar.value = value;
		}
		
		public function showMessage(msg:String):void{
			msg_txt.text = msg;
		}
		
		public function showTips(tips:Array):void{
			_tips = tips;
			Laya.timer.loop(2000,this,showTip);
		}
		
		private function showTip():void{
			if(_tipIndex >= _tips.length) _tipIndex = 0;
			tip_txt.text = _tips[_tipIndex++];
		}
		
	}
}