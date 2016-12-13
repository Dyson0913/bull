package com.lightUI.components.alert
{
	import com.lightUI.core.Light;
	import com.lightUI.events.WindowEvent;
	import com.lightUI.manager.PopupManager;
	import com.lightUI.manager.storage.Storage;
	import com.lightUI.manager.storage.StorageManager;
	
	import laya.display.Sprite;
	import laya.utils.Handler;
	
	/**
	 * 
	 * @author light-k
	 * 
	 * example
	 * 
	 * 
	 * Alert.show("adfj","ahdfha",AlertPanel,null,Handler.create(this,closeHandler),"helo_ajdhflahf");
	 * 
	 * 
	 * private function closeHandler(data:String,flg:String):void{
			if(flg == "ok_btn"){
				trace("ok按钮点击",flg,data);
			}else{
				trace("关闭按钮点击",flg,data);
			}
		}
	 * 
	 */	
	public class Alert
	{
		//private var closeDie:Dictionary = new Dictionary();
		
		public function Alert()
		{
			super();
		}
		
		/**
		 *弹出提示框 
		 * @param message		提示消息内容
		 * @param title			提示标题
		 * @param parent		提示框父容器
		 * @param windowClazz	提示框视图类
		 * @param closeHandler	关闭回调的函数
		 * @param data			需要传递的参数
		 * @param delayRemove	是否延迟自动关闭
		 * @return 
		 * 
		 */		
		public static function show(message:String = "", title:String = ""
									,windowClass:Class = null
									,parent:Sprite = null
									,closeHandler:Handler = null,data:Object = null,delayRemove:int = -1):Sprite
		{
			trace("弹出提示框");
			
			//var window:IAlertWindow = StorageManager.getInstance().creatStorage(String(windowClazz),windowClazz).getObject();0
			var window:IAlertWindow;
			var storage:Storage = StorageManager.getInstance().creatStorage(String(windowClass),windowClass);
			if(storage.length == 0){
				window = new windowClass();
			}else{
				window = storage.getObject();
			}
			
			window.data = data;
			PopupManager.addPopUp(window as Sprite,Light.root,true);
			PopupManager.centerPopUp(window as Sprite);
			
			
			window.title = title;
			window.msg = message;
			window.on(WindowEvent.CLOSE,null, function onClose(e:WindowEvent):void{
				trace("aaaaaaaa",window)
				//var w:IAlertWindow = e.currentTarget as IAlertWindow;
				window.off(WindowEvent.CLOSE,null,onClose);
				StorageManager.getInstance().getStorage(String(windowClass)).rebackObject(window);
				PopupManager.removePopUp(window as Sprite);
			});
			
			if(delayRemove > 0){
				var fun:Function = function remove(window:Sprite):void{
					if(closeHandler) window.once(WindowEvent.CLOSE,closeHandler.caller,closeHandler.method,[data]);
					window.event(WindowEvent.CLOSE);
					PopupManager.removePopUp(window);
				}
				//setTimeout(fun,delayRemove,window);
				Light.timer.setTimeout(null,fun,delayRemove,null);
			}
			
			if(closeHandler) (window as Sprite).once(WindowEvent.CLOSE,closeHandler.caller,closeHandler.method,[data]);
			
			return window as Sprite;
		}
	}
}