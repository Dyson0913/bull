package bull.modules.common.model.data
{
	/**
	 * 玩家第一次进入游戏，保存玩家初始化数据 
	 */	
	public class StartStatusVo
	{
		private var _myBetClips:Array = [0,0,0,0];		
		/** 断线重连记录所有人下注 */
		private var _allBetClips:Array = [0,0,0,0];		
		
		public function StartStatusVo()
		{
		}

		public function get allBetClips():Array
		{
			return _allBetClips;
		}

		public function set allBetClips(value:Array):void
		{
			_allBetClips = value;
		}

		/** 断线重连记录我的下注 */
		public function get myBetClips():Array
		{
			return _myBetClips;
		}

		/**
		 * @private
		 */
		public function set myBetClips(value:Array):void
		{
			_myBetClips = value;
		}


	}
}