package bull.view.tipsLoad
{
	
	import com.lightMVC.interfaces.INotification;
	import com.lightUI.core.Light;
	
	import laya.display.BitmapFont;
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.resource.Texture;
	
	import ui.ui.tipsLoad.tipsLoadPanelUI;
	
	public class TipsLoadPanel extends tipsLoadPanelUI
	{
		private var _tips:Array;
		private var _tipIndex:uint;		
		private var num:int;
		private var start:Boolean =false;
		public function TipsLoadPanel()
		{
			super();			
		}
		
		public function show(value:int):void {
			
			
			msg_txt.text = String(value * 100);
			
			//0~1			
			loading_percent.width = 893 * value;			
			
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