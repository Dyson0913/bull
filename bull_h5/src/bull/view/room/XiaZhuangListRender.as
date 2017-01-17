package bull.view.room
{
	import com.lightUI.events.LightEvent;
	import conf.SBankerCalcInfo;
	import laya.display.Animation;
	
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.ui.List;

	import conf.ENBullType;
	
	public class XiaZhuangListRender extends Box
	{
		private var _bg:Animation;
		
		private var index_txt:Label;
		
		private var _player0_txt:Label;
		private var _player1_txt:Label;
		private var _player2_txt:Label;
		private var _player3_txt:Label;
		
		private var amount_txt:Label;
		private var rundID_txt:Label;		
		
		public function XiaZhuangListRender()
		{
			super();
			this.once(Event.ADDED,this, onAdded);
		}
		
		private function onAdded():void{
			_bg = getChildByName("bg") as Animation;
			index_txt = getChildByName("index_txt") as Label;;
			_player0_txt = getChildByName("player0_txt") as Label;
			_player1_txt = getChildByName("player1_txt") as Label;
			_player2_txt = getChildByName("player2_txt") as Label;
			_player3_txt = getChildByName("player3_txt") as Label;		
			amount_txt = getChildByName("amount_txt") as Label;
			rundID_txt = getChildByName("rundID_txt") as Label;			
			
			hideAllState();
		}
		
		private function hideAllState():void {				
			index_txt.text = "";
			_player0_txt.text = "";
			_player1_txt.text = "";
			_player2_txt.text = "";
			_player3_txt.text = "";
			amount_txt.text = "";
			rundID_txt.text = "";
		}
		
		
		override public function set dataSource(value:*):void{			
						
			if (value == null) return;			
			trace("==============="+value);
			var data:Object = value;
			var idx:int = data.idx;
			var money:String = data.money;
			var info:SBankerCalcInfo = data.info;
			_bg.index = (index + 1 % 2);			
			
			
			index_txt.text = "第" + (idx + 1) +"局";			
			_player0_txt.text = type_to_String(info._1_type);
			_player1_txt.text = type_to_String(info._2_type);
			_player2_txt.text = type_to_String(info._3_type);
			_player3_txt.text = type_to_String(info._4_type);
			
			amount_txt.text = money;
			rundID_txt.text = info.round_id;
			
		}
		
		private function type_to_String(type:int):String
		{
			var s:String ="";
			if( type == conf.ENBullType.BULL_TYPE_NOP) s ="无牛";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE1) s ="牛1";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE2) s ="牛2";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE3) s ="牛3";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE4) s ="牛4";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE5) s ="牛5";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE6) s ="牛6";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE7) s ="牛7";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE8) s ="牛8";
			else if( type == conf.ENBullType.BULL_TYPE_SINGLE9) s ="牛9";
			else if( type == conf.ENBullType.BULL_TYPE_DOUBLE) s ="牛牛";
			else if( type == conf.ENBullType.BULL_TYPE_FLOWER) s ="五花牛";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR1) s ="四炸1";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR2) s ="四炸2";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR3) s ="四炸3";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR4) s ="四炸4";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR5) s ="四炸5";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR6) s ="四炸6";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR7) s ="四炸7";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR8) s ="四炸8";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR9) s ="四炸9";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR10) s ="四炸10";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR11) s ="四炸11";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR12) s ="四炸12";
			else if( type == conf.ENBullType.BULL_TYPE_FOUR13) s ="四炸13";
			else if( type == conf.ENBullType.BULL_TYPE_MINI) s ="五小牛";
			
			return s;
			
		}
		
		
	}
}