package {	
	
	import bull.BullConfigure;
	import laya.display.Stage;
	import laya.utils.Stat;
	import laya.webgl.WebGL;
	import com.lightUI.core.Light;
	
	import bull.core.BullLayerManager;
	import bull.core.BullURLManager;
	
	import bull.BullFacade;
	
	
	
	public class Main {
		
		public function Main() {
			//初始化引擎
			//Laya.init(600, 400);			
			
			//加载引擎需要的资源
			//Laya.loader.load([{url: "res/atlas/comp.json", type: Loader.ATLAS}], Handler.create(this, onLoaded));
			
			Laya.init(1420, 800, WebGL);
			//不缩放   到时候采取的适配模式 应该是 左右居中  按照高度等比例缩放
			Laya.stage.scaleMode = Stage.SCALE_SHOWALL;
			//选择横屏模式
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			//设置水平对齐
			Laya.stage.alignH = "center";
			//设置垂直对齐
			Laya.stage.alignV = "middle";
			
			Stat.show();					
			
			Light.layer = BullLayerManager.getInstance();
			Light.init(Laya.stage);
			var fa:BullFacade = BullFacade.getInstance();
			fa.configure(new BullConfigure());
			fa.startup( this );
			
		}
		
	}
}