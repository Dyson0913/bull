package bull.modules.common.model.data.vo
{

	public class ChipVO
	{
		public var value:Number;///////////////////对应的注额  
		public var type:int;////////////////////对应类型    奔驰宝马 中 对应的是8门 车标 
		public var isSelf:Boolean = false;/////是否 是自己的筹码 
		
		public function ChipVO(isSelf:Boolean = false,type:int = 0, value:Number = 0):void{
			this.isSelf = isSelf;
			this.type = type;
			this.value = value;
		}
		
		public function equals(vo:ChipVO):Boolean{
			if(this.isSelf == vo.isSelf && this.type == vo.type && this.value == vo.value) return true;
			return false;
		}
	}
}