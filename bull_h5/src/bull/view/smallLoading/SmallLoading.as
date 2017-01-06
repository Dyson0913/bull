package bull.view.smallLoading
{
	import laya.display.Sprite;
	
	import ui.ui.smallLoading.small_loadingUI;
	
	public class SmallLoading extends small_loadingUI
	{
		public function SmallLoading()
		{
			super();
			//anim.visible = false;
			//ani1.play();
		}
		
		public function showme(root:Sprite):void{
			//root.addChild(this);
			//ani1.play();
		}
		
		public function hideme():void{
			if(this.parent) this.parent.removeChild(this);
			//ani1.stop();
		}
	}
}