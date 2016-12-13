package com.lightUI.manager.dragManager
{
	import com.lightUI.events.LightEvent;
	
	public class DragEvent extends LightEvent
	{
		public static const DRAG_START:String = "dragStart";//////////////////////开始拖动
		public static const DRAG_ON:String = "dragOn";///////////////////////////
		public static const DRAG_STOP:String = "dragStop";///////////////////////停止
		public static const DRAG_OVER:String = "dragOver";///////////////////////拖动到目标区域上方
		public static const DRAG_OUT:String = "dragOut";/////////////////////////移出目标区域
		public static const DRAG_DROP:String = "dragDrop";///////////////////////落下
		public static const DRAG_ACCEPT:String = "dragAccept";///////////////////被目标接收
//		public static const DRAG_COMPLETE:String = "dragComplete";///////////////机
		
		public function DragEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
	}
}