package bull.core
{
	import laya.media.SoundManager;
	import laya.net.LocalStorage;

	public class ShareObjectMgr
	{
		private static var Ins:ShareObjectMgr = null;
		public static function get():ShareObjectMgr
		{
			if(Ins == null)
				Ins = new ShareObjectMgr(new Object());
			return Ins;
		}
		
		private var _uid:String;
		private var data:MusicVo = null;
		public function ShareObjectMgr(obj:Object)
		{
			_uid = "";
			data = new MusicVo();
		}
		
		public function init(uid:String):void
		{
			_uid = uid;
			data = LocalStorage.getJSON(musicKey) as MusicVo;
			if( data == null )
				data = new MusicVo(); //取默认
			SoundManager.autoStopMusic = false;
			SoundManager.musicMuted = music;
			SoundManager.soundMuted = sound;
			if( sound )
				SoundManager.stopAll();
			trace("初始化音乐开关：music:",(data.isOpenMusic?"关":"开")," sound:",data.isOpenSound?"关":"开");
		}
		
		public function get music():Boolean
		{
			return data.isOpenMusic;
		}
		
		public function get sound():Boolean
		{
			return data.isOpenSound;
		}
		
		/**
		 * 设置音乐音效 
		 * @param m 背景音乐是否开启
		 * @param s 音效是否开启
		 */		
		public function setMusic( m:Boolean ):void
		{
			if( m != data.isOpenMusic )
			{
				data.isOpenMusic = m;
				SoundManager.musicMuted = m;
			}
			trace("设置音乐开关：music:",(data.isOpenMusic?"关":"开")," sound:",data.isOpenSound?"关":"开");
			if( _uid != "" )
				LocalStorage.setJSON(musicKey,data);
		}
		public function setSound( s:Boolean ):void
		{
			if( s != data.isOpenSound )
			{
				data.isOpenSound = s;
				SoundManager.soundMuted = s;
				if( s )
					SoundManager.stopAllSound();
			}
			trace("设置音乐开关：music:",(data.isOpenMusic?"关":"开")," sound:",data.isOpenSound?"关":"开");
			if( _uid != "" )
				LocalStorage.setJSON(musicKey,data);
		}
		
		public function get musicKey():String
		{
			return "music_"+_uid;
		}
	}
}

class MusicVo
{
	public var isOpenMusic:Boolean;
	public var isOpenSound:Boolean;
	function MusicVo(){
		isOpenMusic = false;
		isOpenSound = false;
	}
}