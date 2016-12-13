package com.lightUI.manager.timer
{
	public class TImerFunInfo
	{
		public var caller:*;
		public var fun:Function;
		public var delay:int;
		public var loop:int;
		public var params:Array;
		
		public var currLoop:int = 0;
		
		public function TImerFunInfo(caller:*,fun:Function,params:Array,delay:int = -1, loop:int = 0):void{
			trace("TImerFunInfo",fun)
			this.caller = caller;
			this.fun = fun;
			this.delay = delay;
			//this.timer = timer;
			this.loop = loop;
			this.params = params;
		}
	}
}