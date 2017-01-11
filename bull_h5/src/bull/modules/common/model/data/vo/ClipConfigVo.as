package bull.modules.common.model.data.vo
{
	public class ClipConfigVo
	{
		/** 房间类型，这个值对应 CurrencyType中的值*/
		public var type:uint;
		/** 显示选择筹码对应的筹码值， 长度为5， 第6个位置是max所以不再数组内 */
		public var selectClips:Array;
		/** 筹码配置概率 */
		public var clipConfigs:Array;
		
		public function ClipConfigVo()
		{
		}
	}
}