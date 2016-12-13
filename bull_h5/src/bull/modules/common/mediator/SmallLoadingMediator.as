package bull.modules.common.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	
	import laya.display.Sprite;
	
	public class SmallLoadingMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "smallLoadingMediator";
		public function SmallLoadingMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;			
		}
	}
}