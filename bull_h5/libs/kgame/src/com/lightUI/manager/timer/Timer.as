package com.lightUI.manager.timer
{
	import com.lightUI.utils.DictionaryUtils;
	
	import laya.utils.Dictionary;
	/**
	 * 由于laya自带的timer在浏览器最小化的情况下 会进入暂停休眠状态   所以封装一个自己的timer类  此类在最小化时候不会被暂停 
	 * @author light-k
	 * 
	 */
	public class Timer
	{
//		private var _timerDic:Dictionary = new Dictionary();/////////////以 delay 为key 保存着timer对象
//		private var _funDic:Dictionary = new Dictionary();///////////////以timer为key保存 funInfo对象  二级以fun为key 保存执行函数
		
		private var _timeoutDic:Dictionary = new Dictionary();//////////setTimeout
		private var _intervalDic:Dictionary = new Dictionary();/////////intervalDic
		
		
		
		
		
		
		private var _frameDic:Dictionary = new Dictionary();////////以Function为key保存着funInfo对象
		
		private var _frameStep:Number = 1;///////////////////////////////速度步长  和  _frameSpeed参数相关
		private var _frameRate:Number;
		private var _frameInterval:Number;
		private var _frameIndex:int;///////////////////////循环的索引  用来消除用
		private var _frameCunt:int = 0;
		
		public function Timer(frameRate:int = 60)
		{
			this.frameRate = frameRate;
			
		}
		
		/**
		 * 注册每帧被调用的函数  
		 * @param fun
		 * @param totleFrame
		 * @param params
		 * 
		 */		
		public function registeFrameLoop(caller:*,method:Function,totleFrame:int = -1,...params):void{
			if(DictionaryUtils.isEmpty(_frameDic)){
				//第一个进来  开启enterFrame
				__JS__("this._frameIndex = setInterval(this.onEnterFrame.bind(this),this._frameInterval)");
			}
			var info:TImerFunInfo = new TImerFunInfo(caller,method,params,-1,totleFrame);
			_frameDic.set(method,info);
		}
		private function onEnterFrame():void{
			//trace("onEnterFrame",_frameCunt,_frameStep)
			if(_frameCunt++ % _frameStep == 0){
				var finfo:TImerFunInfo;
				for (var i:int = 0; i < _frameDic.keys.length; i++) 
				{
					finfo = _frameDic.get(_frameDic.keys[i]);
					finfo.fun.apply(finfo.caller,finfo.params);
					
					//trace(finfo.currLoop,finfo.loop)
					if(finfo.loop >= 0  && ++finfo.currLoop >= finfo.loop){
						removeFrameLoop(finfo.fun);
					}
				}
			}
		}
		public function removeFrameLoop(method:Function):void{
			//trace("removeEnterFrame")
			_frameDic.remove(method);
			if(DictionaryUtils.isEmpty(_frameDic)) {
				__JS__("clearInterval(this._frameIndex)");
			}
		}
		
		/**
		 * 设置一个间隔调用的函数 
		 * @param caller	方法域
		 * @param method	需要被调用的方法方法
		 * @param delay		间隔时间
		 * @param param
		 * 
		 */		
		public function setInterval(caller:*,method:Function,interval:Number,param:Object):int{
			var index:int;
			__JS__("index = setInterval(function(){method.bind(caller)(param)},interval)");
			_intervalDic.set(index,index);
			return index;
		}
		public function clearInterval(index:int):void{
			__JS__("clearInterval(index)");
		}
		public function clearAllIntercal():void{
			for each(var interval:uint in _intervalDic) 
			{
				clearInterval(interval);
				_intervalDic.remove(interval);
			}
		}
		
		
		/**
		 * 设置一个延迟调用的函数 
		 * @param caller	方法域
		 * @param method	延迟调用的方法 
		 * @param delay		延迟时间
		 * @param param		需要船传递的参数
		 * @return 			返回的索引   可以用clearTimeout消除
		 * 
		 */		
		public function setTimeout(caller:*,method:Function,delay:Number,param:Object):int{
			var interval:int;
			__JS__("interval = setTimeout(function(){method.bind(caller)(param)},delay)");
			_timeoutDic.set(interval,interval);
			return interval;
		}
		
		public function clearTimeout(index:int):void{
			__JS__("clearTimeout(index)");
		}
		
		public function clearAllTimeout():void{
			for each(var interval:uint in _timeoutDic) 
			{
				clearTimeout(interval);
				//delete(_timeoutDic[interval]);
				_timeoutDic.remove(interval);
			}
		}
		

		public function get frameRate():Number
		{
			return _frameRate;
		}

		public function set frameRate(value:Number):void
		{
			_frameRate = value;
			_frameInterval = 1000/_frameRate;
		}
	}
}