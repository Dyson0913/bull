package bull.modules.common.model.data
{
	/**
	 * 历史记录数据 
	 */	
	public class RecordVo
	{
		/** 各花色500局贏次數 */
		public var Win:Array;
		
		/** 各花色500局輸次數 */
		public var Lost:Array;
				
		public var Spade_Recode:Array;
		public var Heart_Recode:Array;
		public var Club_Recode:Array;
		public var Diamond_Recode:Array;
		
		public function RecordVo()
		{
			Win = [];
			Lost = [];
			Spade_Recode =[];
			Heart_Recode = [];
			Club_Recode =[];
			Diamond_Recode = [];
		} 
	}
}