package BullHall.view
{
	
	
	import BullHall.utils.MoneyUtils;
	
	import conf.ENMoneyType;
	import conf.ENRoomType;
	
	import kg.components.button.Button;
	import kg.core.LUIComponent;
	import kg.core.timer.TimerManager;
	
	public class RoomItem extends LUIComponent
	{
		public var mcBg:MovieClip;
		public var mcHot:MovieClip;		
		public var mcType:MovieClip;			
		
		public var txtRoombetLimit:TextField;
		public var txtPlaybetLimit:TextField;
		
		public var btnJoin:Button;
		public var GbtnJoin:Button;
		
		public var light_0:MovieClip;
		public var light_1:MovieClip;
		public var light_2:MovieClip;
		public var light_3:MovieClip;
		public var light_4:MovieClip;
		public var light_5:MovieClip;
		public var light_6:MovieClip;
		public var light_7:MovieClip;
		public var light_8:MovieClip;
		public var light_9:MovieClip;
		public var light_10:MovieClip;
		public var light_11:MovieClip;
		public var light_12:MovieClip;
		public var light_13:MovieClip;
		public var light_14:MovieClip;
		public var light_15:MovieClip;
		public var light_16:MovieClip;
		public var light_17:MovieClip;
		public var light_18:MovieClip;
		public var light_19:MovieClip;
		public var light_20:MovieClip;
		public var light_21:MovieClip;
		public var light_22:MovieClip;
		public var light_23:MovieClip;
		public var light_24:MovieClip;
		public var light_25:MovieClip;
		public var light_26:MovieClip;
		public var light_27:MovieClip;
		public var light_28:MovieClip;
		public var light_29:MovieClip;
		public var light_30:MovieClip;
		public var light_31:MovieClip;
		public var light_32:MovieClip;
		public var light_33:MovieClip;
		public var light_34:MovieClip;
		public var light_35:MovieClip;
		public var light_36:MovieClip;
		public var light_37:MovieClip;
		public var light_38:MovieClip;
		public var light_39:MovieClip;
		public var light_40:MovieClip;
		public var light_41:MovieClip;
		public var light_42:MovieClip;
		public var light_43:MovieClip;
		public var light_44:MovieClip;
		public var light_45:MovieClip;
		public var light_46:MovieClip;
		public var light_47:MovieClip;
		public var light_48:MovieClip;
		public var light_49:MovieClip;
		public var light_50:MovieClip;
		public var light_51:MovieClip;
		public var light_52:MovieClip;
		public var light_53:MovieClip;
		public var light_54:MovieClip;
		public var light_55:MovieClip;
		public var light_56:MovieClip;
		public var light_57:MovieClip;
		public var light_58:MovieClip;
		public var light_59:MovieClip;
		public var light_60:MovieClip;
		public var light_61:MovieClip;
		public var light_62:MovieClip;
		public var light_63:MovieClip;
		public var light_64:MovieClip;
		public var light_65:MovieClip;
		public var light_66:MovieClip;
		public var light_67:MovieClip;
		public var light_68:MovieClip;
		public var light_69:MovieClip;
		public var light_70:MovieClip;
		public var light_71:MovieClip;
		public var light_72:MovieClip;
		public var light_73:MovieClip;
		public var light_74:MovieClip;
		public var light_75:MovieClip;
		public var light_76:MovieClip;
		public var light_77:MovieClip;
		public var light_78:MovieClip;
		public var light_79:MovieClip;
		public var light_80:MovieClip;
		public var light_81:MovieClip;
		public var light_82:MovieClip;
		public var light_83:MovieClip;
		public var light_84:MovieClip;
		public var light_85:MovieClip;
		public var light_86:MovieClip;
		public var light_87:MovieClip;
		public var light_88:MovieClip;
		
		
		private var _light_triger:int =0;
		
		public function RoomItem(skinclazz:Class=null)
		{
			super(skinclazz);
		}
		
		override protected function creatChild():void
		{
			super.creatChild();
			mcBg.mouseEnabled = false;
			btnJoin.buttonMode = true;			
			txtRoombetLimit.mouseEnabled  = false;
			txtPlaybetLimit.mouseEnabled  = false;		
			
			for(var i:int =0;i< 88;i++)
			{
				this["light_"+i].gotoAndStop(2);
			}
		}
		
		public function init():void
		{
			mcHot.visible = false;
			mcBg.gotoAndStop(1);
			txtRoombetLimit.text = "";
			txtPlaybetLimit.text = "";
			txtPlaybetLimit.text = "";
			
			btnJoin.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			GbtnJoin.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			
			
			
		}

		protected function onClick(event:MouseEvent):void
		{
			dispatchEvent( new MouseEvent(MouseEvent.CLICK));
		}
		
		public function bg_change(frame:int):void
		{
			mcBg.gotoAndStop(frame);
		}

		public function update_info(value:Object):void
		{						
			
//			var curPlayer:int = value["cur_player"];			
//			mcHot.gotoAndStop( (curPlayer > 50) ? 3 : (curPlayer > 10) ? 2 : 1 );
//			
//			if(curPlayer < 100) curPlayer = Math.floor(Math.random()*99);
//			txtCurPlayer.text = curPlayer.toString();
//			
			var roomLimit:int = value["roomLimit"];			
			var tableType:int = value["roomType"];
			var minBetLinit:Number = value["minBet"];
			var maxBetLinit:Number = value["maxBet"];
			var minBetStr:String;
			var maxBetStr:String;
			
			if( tableType == conf.ENRoomType.ROOM_TYPE_COIN ) {			
				minBetStr = MoneyUtils.standardNumber(minBetLinit, conf.ENRoomType.ROOM_TYPE_COIN);
				maxBetStr = MoneyUtils.standardNumber(maxBetLinit, conf.ENRoomType.ROOM_TYPE_COIN);
				txtPlaybetLimit.text =minBetStr+" - "+maxBetStr;
				txtRoombetLimit.text =roomLimit.toString();				
			}else{					
				var temp:Number = MoneyUtils.monay(minBetLinit); 
				var temp2:Number =MoneyUtils.monay(maxBetLinit); 
				minBetStr = MoneyUtils.standardNumber(temp, conf.ENRoomType.ROOM_TYPE_CASH_NM);
				maxBetStr = MoneyUtils.standardNumber(temp2, conf.ENRoomType.ROOM_TYPE_CASH_NM);
				txtPlaybetLimit.text = MoneyUtils.anteAddTag(minBetStr,conf.ENRoomType.ROOM_TYPE_CASH_NM)+" - "+ MoneyUtils.anteAddTag(maxBetStr,conf.ENRoomType.ROOM_TYPE_CASH_NM);
				
				var temp3:Number = MoneyUtils.monay(roomLimit);
				txtRoombetLimit.text =  "¥"+MoneyUtils.standardNumber(temp3,conf.ENRoomType.ROOM_TYPE_CASH_NM);
			}			
			
			//閃燈			
			TimerManager.getInstance().registeTimer(shine, 1000, 0);
		
		}		
		
		private function shine():void
		{
			if( _light_triger ==0)
			{
				_light_triger = 1;
				shine1();
			}
			else
			{
				_light_triger = 0;
				shine2();
			}
			
			
		}

		private function shine1():void
		{
			for(var j:int =1;j< 88;j+=2)
			{
				this["light_"+j].gotoAndStop(2);
			}
			
			for(var i:int =0;i< 88;i+=2)
			{
				this["light_"+i].gotoAndStop(1);
			}		
		}
		
		private function shine2():void
		{
			for(var j:int =1;j< 88;j+=2)
			{
				this["light_"+j].gotoAndStop(1);
			}
			
			for(var i:int =0;i< 88;i+=2)
			{
				this["light_"+i].gotoAndStop(2);
			}		
		}
		
	}
}