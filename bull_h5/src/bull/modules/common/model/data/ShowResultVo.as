package bull.modules.common.model.data
{
	public class ShowResultVo
	{
		private var _runIndex:uint;
		private var _winIndex:uint;
		
		private var _myMoney:Number;
		private var _myWinClip:Number;
		private var _list:Array; //前5名
		
		public function ShowResultVo()
		{
		}

		public function get winIndex():uint
		{
			return _winIndex;
		}

		public function set winIndex(value:uint):void
		{
			_winIndex = value;
		}

		public function get runIndex():uint
		{
			return _runIndex;
		}

		public function set runIndex(value:uint):void
		{
			_runIndex = value;
		}

		public function get myWinClip():Number
		{
			return _myWinClip;
		}

		public function set myWinClip(value:Number):void
		{
			_myWinClip = value;
		}
		
		public function get list():Array
		{
			return _list;
		}
		
		public function set list(value:Array):void
		{
			_list = value;
		}

		public function get myMoney():Number
		{
			return _myMoney;
		}

		public function set myMoney(value:Number):void
		{
			_myMoney = value;
		}


	}
}