package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	import laya.ui.Image;
	
	import laya.utils.Tween;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.BetAreaViewUI
	
	
	public class BetAreaView extends BetAreaViewUI
	{		
		private var zone_flash_times:int = 0;
		private var _moveIn_zone_idx:int;
		private var _zone_topthree:Array = [];
		
		public var dragChip:Chip = new Chip();
		
		public function BetAreaView() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			for (var i:int = 0; i < 4; i++)
			{				
				this["total_amount_" + i]["bg_ani"].index = i;
			}	
			
			hide();
			
			_arrows.visible = false;
			dragChip.visible = false;
		}
		
		private function onScenedown(e:Event):void
		{
			var sName:String = e.target.name;
			var pattern:RegExp = /Scene_/;
			sName = sName.replace(pattern, "");	
			var idx:int = parseInt(sName);
			
			
			//閃一下
			this["zone_" + idx].visible = true;
			
			Tween.to(this["zone_" + idx], {  },50, Ease.linearNone,Handler.create(this,up,[idx]));
			
			//下注
			event(LightEvent.ITEM_CLICK,idx);
		}
		
		private function up(idx:int):void
		{
			this["zone_" + idx].visible = false;
		}
		
		private function onSceneOver(e:Event):void
		{			
			
			var sName:String = e.target.name;			
			var pattern:RegExp = /Scene_/;
			sName = sName.replace(pattern, "");	
			var idx:int = parseInt(sName);
			
			//前三名面牌
			this["Rankp_" + idx].visible = true;
			updata_topThree(idx);
			_moveIn_zone_idx = idx;
			
			//跟隨ocin
			//dragChip.visible = true;
			//_arrows.visible = true;
			//
			//
			//_arrows.x = this.mouseX;
			//_arrows.y = this.mouseY;
			//dragChip.x = _arrows.x +20;
			//dragChip.y = _arrows.x +30;
			//this.on(Event.MOUSE_MOVE,this, dragChipHandler);
			
		}
		
		private function onSceneOut(e:Event):void
		{									
			this["Rankp_" + _moveIn_zone_idx].visible = false;			
			stopDragChip();
			
		}
		
		
		private function dragChipHandler():void{
			_arrows.x = this.mouseX;
			_arrows.y = this.mouseY;
			dragChip.x = _arrows.x +20;
			dragChip.y = _arrows.x +30;
		}
		
		private function stopDragChip():void{
			_arrows.visible = false;
			dragChip.visible = false;
			this.off(Event.MOUSE_MOVE,this, dragChipHandler);
		}
		
		public function set_ready():void
		{			
			hide();
			
			this.visible = true;
			zone_flash_times = 0;
			for (var i:int = 0; i < 4; i++)
			{				
				this["total_amount_" + i].visible = false;
				this["zone_" + i].visible = false;
				this["self_amount_" + i].visible = false;
			}			
			
			Laya.timer.loop(500, this, timerHandler);
			
		}
		
		public function timerHandler():void
		{
			zone_flash_times++;
			if (zone_flash_times == 4)
			{
				//閃爍結束
				Laya.timer.clear(this, timerHandler);
				
			}
			
			for (var i:int = 0; i < 4; i++)
			{								
				this["zone_" + i].visible = !this["zone_" + i].visible;
			}	
		}
		
		public function openbet():void
		{
			for (var i:int = 0; i < 4; i++)
			{					
				this["Scene_" + i].on(Event.MOUSE_DOWN, this, onScenedown);
				this["Scene_" + i].on(Event.MOUSE_MOVE, this, onSceneOver);	
				this["Scene_" + i].on(Event.MOUSE_OUT, this, onSceneOut);	
			}
		}
		
		public function bet_limit(isSysbanker:Boolean,limit:String):void
		{
			//玩家當庄才顥示
			BetLimit.visible = !isSysbanker;
			BetLimit.amount.font = "LimitFont";
			BetLimit.amount.text  = limit;
		}
		
		public function tablelimit_updata(percent:Number,rest:String):void
		{
			if ( BetLimit.visible)
			{
				BetLimit.amount.text = rest;
				if ( percent > 0.5) 
				{
					BetLimit.Green.width = 146 * percent;
					BetLimit.Hint.visible = false;
				}
				else
				{
					BetLimit.Green.visible = false;
					BetLimit.Red.width = 73 * (percent * 2);					
					BetLimit.Hint.visible = true;
					Tween.to(BetLimit.Hint, {  },50, Ease.linearNone,Handler.create(this,shine));
				}
			}
		}
		
		private function shine():void
		{
			BetLimit.Hint.visible = false;
		}
		
		public function update_total(idx:int,amount:Number,display:String ):void
		{
			if ( amount != 0)
			{
				//總數更新
				this["total_amount_" + idx]["title"].visible = true;
				this["total_amount_" + idx].visible = true;
				this["total_amount_" + idx]["amount"].text = display;
			}
			else
			{
				this["total_amount_" + idx]["title"].visible = false;
				this["total_amount_" + idx].visible = false;
			}
		}
		
		public function update_self(idx:int, amount:Number,display:String ):void
		{
			if ( amount != 0)
			{
				//自己下注更新				
				this["self_amount_" + idx]["amount"].font = "mybetFont";
				this["self_amount_" + idx].visible = true;
				this["self_amount_" + idx]["amount"].text = display;
			}
			else
			{
				this["self_amount_" + idx].visible = false;				
			}
		}
		
		public function zone_light(idx:int):void
		{
			for (var i:int = 0; i < 4; i++)
			{	
				if ( idx == i) this["total_amount_" + i]["light"].visible = true;
				else this["total_amount_" + i]["light"].visible = false;
			}	
		}
		
		public function hide():void
		{
			for (var i:int = 0; i < 4; i++)
			{												
				this["Scene_" + i].off(Event.MOUSE_DOWN, this, onScenedown);				
				this["Scene_" + i].off(Event.MOUSE_MOVE, this, onSceneOver);	
				this["Scene_" + i].off(Event.MOUSE_OUT, this, onSceneOut);
				
				//總數
				this["total_amount_" + i]["title"].visible = false;
				this["total_amount_" + i].visible = false;
				this["total_amount_" + i]["amount"].text = "";	
				
				//自己下注				
				this["self_amount_" + i].visible = false;
				this["self_amount_" + i]["amount"].text = "";
				this["Tips_" + i].alpha = 0;
				
				this["Rankp_" + i]["rank_info_" + 0].visible = false;
				this["Rankp_" + i]["rank_info_" + 1].visible = false;
				this["Rankp_" + i]["rank_info_" + 2].visible = false;
			}	
			BetLimit.visible = false;
			
		}
		
		public function disable_zone():void
		{
			for (var i:int = 0; i < 4; i++)
			{												
				this["Scene_" + i].off(Event.MOUSE_DOWN, this, onScenedown);
				this["Scene_" + i].off(Event.MOUSE_MOVE, this, onSceneOver);	
				this["Scene_" + i].off(Event.MOUSE_OUT, this, onSceneOut);
				
				this["Rankp_" + i].visible = false;
				
			}	
			
			BetLimit.visible = false;
			stopDragChip();
		}
		
		public function get_zone(i:int):Image
		{
			return this["zone_" + i];
		}
		
		public function set_fellow_coin(chip:Image):void
		{
			dragChip.source = chip.source;
		}
		
		
		public function Error_tip(error_msg:String,po:int):void			
		{				
			trace("error_msg ="+error_msg + "  po " + po);			
			
			//動態加長 4 -> 115 + 22
			this["Tips_" + po].width = 115 + (error_msg.length -4) * 22;
			
			this["Name_" + po].text = error_msg;
			this["Name_" + po].alpha = 1;
			this["Tips_" + po].alpha = 1;
			Tween.to(this["Tips_" + po], { alpha:0 }, 3000, Ease.linearNone );
			Tween.to(this["Name_" + po], { alpha:0 }, 3000, Ease.linearNone );			
		}
		
		public function set_zoneTopThree(data:Array):void
		{
			_zone_topthree = data;
		}
		
		private function updata_topThree(idx:int):void
		{
			if ( _zone_topthree.length == 0) 
			{				
				return;
			}
			
			var data:Array  = _zone_topthree[idx];
			trace("data =" + data.length);
			//提示字消失
			if (data.length != 0) this["Rankp_" + idx]["Text_NoOne_bet"].text = "";
			else this["Rankp_" + idx]["Text_NoOne_bet"].text = "无人下注，请下注。";
			
			for (var i:int = 0; i < data.length; i++)
			{
				//沒資料hide
				if ( i >= data.length)
				{
					this["Rankp_" + idx]["rank_info_" + i].visible = false;
				}
				else
				{
					var ob:Object = data[i];
					this["Rankp_" + idx]["rank_info_" + i].visible = true;
					this["Rankp_" + idx]["rank_info_" + i]["rank"].index = i;
					this["Rankp_" + idx]["rank_info_" + i]["Vip"].visible = false;
					this["Rankp_" + idx]["rank_info_" + i]["Name"].text = ob["name"];
					this["Rankp_" + idx]["rank_info_" + i]["Light"].visible = ob["light"];
					this["Rankp_" + idx]["rank_info_" + i]["Money"].text = ob["money"];					
				}
			}
			
		}
		
		
		private function test():void
		{
			//view.BetZoneBoard.set_data([200]);
		}			
		
	}

}