package bull.view.room
{
	import com.lightUI.core.Light
	import ui.ui.room.NetConnectViewUI;
	
	/**
	 * 网络端口，提示断线重连
	 * 备注：继承的 LUIComponent的View只有在加到舞台后才会调用creatChild()，
	 *       因此在show的时候先调用创建实例组件，并判断只允许调用creatChild一次
	 */	
	public class NetConnectView extends NetConnectViewUI
	{		
	
		public var _init_text:String;
		public var _checkCount:int;
		
		public function NetConnectView(skinclazz:Class=null)
		{
			super();
			this.x = 1400/2;//( Common.GameWidth - this.width ) >> 1;
			this.y = 800/2;//( Common.GameHeight - this.height ) >> 1; 
		}
		
		override protected function createChildren():void
		{
			super.createChildren();		
			_init_text = txtName.text;	
		}
		
		public function show():void
		{	
			Light.timer.setInterval(this, dotdotdot, 1000, null);
			
			//LayerManager.getInstance().showPopUp(this);
			Light.layer.loadingMask.lock("lostConnect");
			checkCount = 100;
			txtName.text = _init_text;	
			
			//TweenLite.to(this, _checkCount, {checkCount:0,  ease:Linear.easeNone,delay:1});
		}
		
		public function get checkCount():int
		{
			return _checkCount;
		}
		
		public function set checkCount(value:int):void
		{
			if( value != _checkCount )
			{
				_checkCount = value;
				if( checkCount % 3 ==0) txtName.text = _init_text;
				txtName.text +=".";				
			}
		}
		
		private function dotdotdot():void
		{
			checkCount --;
			if( checkCount % 3 ==0) txtName.text = _init_text;
			txtName.text +=".";	
		}
		
		public function hide():void
		{
			Light.layer.loadingMask.unLock("lostConnect");
			//LayerManager.getInstance().hidePopUp(this);
		}
		
	}
}