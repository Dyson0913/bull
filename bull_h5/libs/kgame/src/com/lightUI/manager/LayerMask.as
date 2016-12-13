package com.lightUI.manager
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.events.LightEvent;
	import com.lightUI.utils.DictionaryUtils;
	
	import laya.display.Sprite;
	import laya.utils.Dictionary;

	public class LayerMask extends EventDispatcher
	{
		private var _root:Sprite
		public var lodingMask:Sprite;
		private var loadingDic:Dictionary = new Dictionary();
		
		public var limitTime:int = 20000;
		private var _interval:int = -1;
		
		public function LayerMask(){
			
		}
		
		public function init(root:Sprite):void{
			_root = root;
			//lodingMask = Draw.drawRect(new Rectangle(0,0,root.stage.stageWidth, root.stage.stageHeight),0x000000);
			lodingMask = new Sprite();
			lodingMask.graphics.drawRect(0,0,Laya.stage.width, Laya.stage.height,0x000000);
			lodingMask.alpha = .2
		}
		
		public function lock(key:String):void{
			
			
			if(loadingDic.get(key)){
				loadingDic.set(key,loadingDic.get(key)+1);
			}else{
				loadingDic.set(key,1);
			}
			if(!lodingMask.parent){
				lodingMask["showme"](Laya.stage);
				Laya.timer.once(limitTime,this,dispatchTimeOutEvent);
			}
			
			trace("LayerMask lock: ",key);
			showKeys();
		}
		
		private function dispatchTimeOutEvent():void{
			dispatchEvent(new LightEvent(LightEvent.TIME_OUT));
		}
		
		
		private function showKeys():void{
			trace("LayerMask showKeys: ",loadingDic.keys);
		}
		
		public function unLock(key:String):void{
			
			if(loadingDic.get(key)){
				loadingDic.set(key,loadingDic.get(key)-1);
				if(loadingDic.get(key) <= 0){
					loadingDic.remove(key);
				}
				if(loadingDic.keys.length == 0){
					if(lodingMask.parent){
//						if(_interval != -1){
//							clearTimeout(_interval);
//							_interval = -1;
//						}
						Laya.timer.clear(this,dispatchTimeOutEvent);
						lodingMask.parent.removeChild(lodingMask);
						lodingMask["hideme"]();
					}
				}
			}else{
				trace("没有此loading "+key);
			}
			
			trace("LayerMask unLock: ",key);
			showKeys();
		}
		
		public function clear():void{
			//DictionaryUtils.destroy(loadingDic);
			loadingDic.clear();
			if(lodingMask.parent) lodingMask.parent.removeChild(lodingMask);
			Laya.timer.clear(this,dispatchTimeOutEvent);
		}
	}
}