package com.lightUI.manager.loader  
{
	import laya.net.Loader;
	import laya.net.URL;
	import laya.utils.Byte;
	import laya.utils.Handler;

	
	public class UpdateManager 
	{
		
		private static var m_ins : UpdateManager = null;
		public var mAstDic:Object = new Object();
		private var completeH : * = null;
		private var progressH : * = null;
		
		public function UpdateManager() 
		{
		}
		
		public static function Instance() : UpdateManager {
			if ( m_ins == null ) {
				m_ins = new UpdateManager();
				return m_ins;
			}
			return m_ins;
		}
		
		public function LoadFile( _fname : String, _complete : Handler, _progress : Handler ) : void {		
			completeH = _complete;
			progressH = _progress;
			Laya.loader.load( _fname, new Handler( this, onComplete),new Handler(this,getProgress), Loader.BUFFER );	
			return;
		}
		
		private function onComplete( _rdata : * ) : void
		{
			var _byte:Byte = new Byte( _rdata );
			var t_strFileHeader:String = _byte.readUTFBytes(4);
			
			if ( t_strFileHeader != "fst" )
			{
				//trace("error::fileNameAndSize::onComplete:file header error");
				return;
			}
			var t_dwVersion : uint = _byte.getUint32();
			if ( t_dwVersion != 100 )
			{
				//trace("error::version error");
				return;
			}
			
			t_dwVersion = _byte.getUint32();
			var   t_dwHash : uint;
			var   t_dwTime : uint;
			for ( var t_i : int = 0; t_i < t_dwVersion; t_i ++ )
			{
				t_dwHash = _byte.getUint32();
				t_dwTime = _byte.getUint32();
				
				mAstDic[t_dwHash] = t_dwTime;
			}

			trace("onComplete ==> " )
			URL.customFormat = UpdateManager.customUrl;//重写了引擎URL.customFormat方法，在每次加载文件时都会到这里来校验文件的更新程度			
			if ( completeH ) {
				Handler(completeH).run();
				Handler(completeH).clear();
			}			
			
		}
		
		private function getProgress(v:Number):void
		{
			if (progressH)
				progressH.runWith(v);
		}
		
		/**
		 * 文件更新相关，修改服务器请求.
		 * @param	_url
		 * @param	_bpath
		 * @return
		 */
		public static function customUrl( _url : String, _bpath : String ) : String {	
			
			//trace("11111")
			//throw new Error("sssssssss");
			if (!_url) return _url;
			var t_res : uint = m_ins.getFileModtime( _url );
			if ( t_res ) {
				_url = _url + "?" + t_res;
			}
			
			//trace("customUrl ",_url)
			return _url;

		}
		
		
		public function getFileModtime(_str:String):int
		{
			var t_str:String = _str.toLowerCase();
			var tHash:uint = string_hash(t_str);
			return mAstDic[tHash];
		}
		
		private function string_hash( _str : String ) : uint
		{
			var t_dw : uint = 0;
			var t_iChar : int = 0;
			for ( var t_i : int = 0; t_i < _str.length; t_i ++ )
			{
				t_iChar = _str.charCodeAt( t_i );
				t_dw = ((t_dw<<5)-t_dw) + t_iChar ;
			}
			
			// 把有符号整数变为无符号整数：
			t_dw = t_dw >>> 0;
			
			return t_dw;			
		}
		
	}

}