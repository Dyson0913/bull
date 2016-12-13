package BullHall.view
{
	
	
	import kg.components.rollTextField.RollTextField;
	import kg.core.LUIComponent;
	

	public class Marquee extends LUIComponent
	{
		
		public var label_txt:RollTextField;
		
		public function Marquee()
		{
		
		} 	
			
		override protected function creatChild():void{
			super.creatChild();	
			label_txt.direction = RollTextField.LEFT;				
			label_txt.addEventListener(Event.COMPLETE,onLabelTxtComplete);
       }
		
        private function onLabelTxtComplete(e:Event):void{
			
			label_txt.clear();
			label_txt.addMsg("測試跑馬燈~~~~~~燈~~~~燈",0);	
		}
			
		public function show(board_des:String,level:int):void{
			label_txt.addMsg(board_des,level);			
		}		
		
	}
}