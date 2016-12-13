package com.lightUI.manager.scence
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.core.Light;
	import com.lightUI.events.ScenceManagerEvent;
	
	import laya.display.Sprite;
	import laya.utils.ClassUtils;
	import laya.utils.Dictionary;
	import laya.utils.Handler;

	/**
	 * 场景管理器 
	 * @author light-k
	 * 
	 */	
	public class ScenceManager extends EventDispatcher
	{
		private var _scenceMap:Dictionary = new Dictionary();////当前所有场景
		
		private var _scenceInfo:Object;
		
		public function init(sinfo:Object):void{
			_scenceInfo = sinfo;
		}
		
		
		private var _scenceCreatTempList:Array = [];/////////////////////////////等待被创建的场景列表备份
		private var _scenceCreatList:Array = [];//////////////////等待被创建的场景列表
		private var _isLoading:Boolean = false;///////////////////是否是在加载中
		private var _onComplete:Handler;
		private var _onProgress:Handler;
		
		
		
		/**
		 *  
		 * @param name			要添加的场景名字 
		 * @param views			要添加的视图UI
		 * @param parent		被添加到的层级
		 * @param treat			对前场景的处理方式       ScenceInfo.KEPT_PERSCENCE 0  ScenceInfo.HIDE_PERSCENCE 1 ScenceInfo.REMOVE_PERSCCENCE 2
		 * @return 
		 * 
		 */			
		public function addScence(name:String,views:Array,parent:Sprite,treat:int = 0):ScenceManager{
			parent = parent?parent:Laya.stage;
//			parent = parent?parent:Light.layer.scence;	位置错乱
			
			var info:ScenceInfo = getScenceInfo(name);
			
			if(info == null){
				info = new ScenceInfo(name,_scenceInfo[name],views,parent,treat);
			}
			
			_scenceCreatList.push(info);
			_scenceCreatTempList.push(info);
			return this;
		}
		public function creat(progress:Handler = null, complete:Handler = null):void{
			if(_scenceCreatList.length == 0) return;
			if(_isLoading) throw new Error("还有场景没加载完");
			
			_onComplete = complete;
			_onProgress = progress;
			
			_isLoading = true;
			
			//trace("_scenceCreatTempList",_scenceCreatTempList)
			
			loadAssets(_scenceCreatList[0]);
		}
		private function creatScence(scence:ScenceInfo):void{
			
			treatPerScence(scence.treatPerScence);
			if(scence.state == ScenceInfo.HIDE){
				//trace(scence.name+"已存在");
				showScence(scence);
			}else{
				newScence(scence);
			}
			//trace("已经创建了一个场景",scence.state,scence.name)
		}
		private function treatPerScence(treat:int):void{
			if(treat == ScenceInfo.HIDE_PERSCENCE){
				hidePerScence();
			}else if(treat == ScenceInfo.REMOVE_PERSCCENCE){
				
			}else if(treat == ScenceInfo.KEPT_PERSCENCE){
				
			}
		}
		private function hidePerScence():void{
			var l:int;
			var mui:Sprite;
			for each (var scence:ScenceInfo in _scenceMap.values) 
			{
				if(scence.state == ScenceInfo.HIDE) continue;
				hideScence(scence);
			}
		}
		
		
		private function newScence(scence:ScenceInfo):void{
			var l:int = scence.viewNames.length;
			var viewname:String;
			var view:Sprite;
			for (var i:int = 0; i < l; i++) 
			{
				viewname = scence.viewNames[i];
				view = ClassUtils.getInstance(viewname);
				view.name = viewname;
				//trace("creatScence",viewname)
				dispatchEvent(new ScenceManagerEvent(ScenceManagerEvent.UI_CREATED,view));
				scence.views.push(view);
				scence.parent.addChild(view);
				view.event(ScenceManagerEvent.UI_SHOW);
			}
			_scenceMap.set(scence.name,scence);
			scence.state = ScenceInfo.CREATED;
			//scence.state = ScenceInfo.SHOW;
		}
		private function hideScence(scence:ScenceInfo):void{
			trace("hideScence",scence.name)
			var mui:Sprite;
			var l:int = scence.views.length;
			for (var i:int = 0; i < l; i++) 
			{
				mui = scence.views[i];
				if(mui.parent) mui.parent.removeChild(mui);
				mui.event(ScenceManagerEvent.UI_HIDE);
			}
			scence.state = ScenceInfo.HIDE;
		}
		private function showScence(scence:ScenceInfo):void{
			var mui:Sprite;
			var l:int = scence.views.length;
			for (var i:int = 0; i < l; i++) 
			{
				mui = scence.views[i];
				scence.parent.addChild(mui);
				mui.event(ScenceManagerEvent.UI_SHOW);
			}
			scence.state = ScenceInfo.SHOW;
		}
		private function destroyScence(scence:ScenceInfo):void{
			var mui:Sprite;
			var l:int = scence.views.length;
			for (var i:int = 0; i < l; i++) 
			{
				mui = scence.views[i];
				mui.event(ScenceManagerEvent.UI_DESTROY);
				if(mui.parent) mui.parent.removeChild(mui);
			}
			scence.destroy();
			scence.state = ScenceInfo.DESTROY;
		}
		
		
		private function loadAssets(info:ScenceInfo):void{
			var assets:Array = info.assets;
			var loads:Array = [];
			for (var i:int = 0; i < assets.length; i++) 
			{
				loads.push(Light.loader.URLM.getURLInfo(assets[i]));
			}
			//trace("loadAssets",loads);
			Light.loader.load(loads,Handler.create(this,onAssetsLoaded,[info],true),Handler.create(this,onProgress,[info],false));
		}
		private function onAssetsLoaded(info:ScenceInfo):void{
		Light.loader.offAll();
			creatScence(info);
			//trace("创建完一个 ",info)
			_scenceCreatList.shift();
			if(_scenceCreatList.length > 0) loadAssets(_scenceCreatList[0]);
			else{
				trace("全部加载完成");
				
				_isLoading = false;
				_scenceCreatList = [];
				_scenceCreatTempList = [];
				
//				_onComplete = null;
//				_onProgress = null;
				
				
				if(_onComplete) _onComplete.run();
				dispatchEvent(new ScenceManagerEvent(ScenceManagerEvent.SCENCE_COMPLETE,info.name));
				
				
			}
		}
		private function onProgress(info:ScenceInfo,pro:Number):void{
			//trace("加载了总文件的==>:"+info.assets.length*pro/_totalAssets+"%")
			var total:int = 0;
			var curr:int = 0;
			var l:int = _scenceCreatTempList.length;
			var sinfo:ScenceInfo;
			for (var i:int = 0; i < l; i++) 
			{
				sinfo = _scenceCreatTempList[i];
				total += sinfo.assets.length;
				//trace("info.state",sinfo.state,sinfo.name,_scenceCreatTempList.length)
				if(sinfo.state == ScenceInfo.CREATED) curr += sinfo.assets.length;
			}
			var num:Number = (curr + info.assets.length*pro)/total;
			if(_onProgress) _onProgress.runWith(num);
			dispatchEvent(new ScenceManagerEvent(ScenceManagerEvent.SCENCE_PROGRESS,num));
			//trace("加载了总文件的==>:",num,info.state);
		}
		
		public function regView(name:String , clazz:Class):ScenceManager{
			ClassUtils.regClass(name,clazz);
			return this;
		}
		
		public function removeScence(name:String, destroy:Boolean = false):void{
			var info:ScenceInfo = _scenceMap.get(name);
			if(!info) {
				trace("你想要移除的场景("+name+")不存在");
				return;
			}
			
			if(destroy) {
				info.destroy();
				_scenceMap.remove(name);
			}
			else hideScence(info);
		}
		
		public function getScenceInfo(name:String):ScenceInfo{
			return _scenceMap.get(name);
		}
	}
}