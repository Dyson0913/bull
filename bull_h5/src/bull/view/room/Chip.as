package bull.view.room
{
	import com.lightUI.core.Light;
	
	import laya.ui.Image;
	
	import bull.modules.common.model.data.vo.ChipVO;
	
	public class Chip extends Image
	{
		private var _vo:ChipVO = new ChipVO();

		

		
		public function Chip(isSelf:Boolean = false, type:int = 0, value:int = 0,skin:String=null)
		{
			_vo.isSelf = isSelf;
			_vo.type = type;
			_vo.value = value;
			
			super(skin);
		}
	
		
		override public function set source(value:*):void{
			super.source = value;
			this.pivotX = this.width/2;
			this.pivotY = this.height/2;
			this.scaleX = this.scaleY = 0.5;
		}
		
		public function get vo():ChipVO
		{
			return _vo;
		}
		
		public function set vo(value:ChipVO):void
		{
			vo.isSelf = value.isSelf;
			vo.type = value.type;
			vo.value = value.value;
			
			this.source = Light.loader.getRes("res/gameScene/chip_"+value.value+".png");
		}
		
		public function clear():void{
			this.source = "";
		}
	}
}