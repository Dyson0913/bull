package bull.events
{
	import com.iflash.events.Event;
	
	public class BullSceneEvent extends Event
	{
		public static const START_BET:String = "startBet";
		
		public function BullSceneEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}