package bull.view.room
{
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Point;
	import laya.ui.Image;
	
	import com.lightUI.comman.bet.BetInfoVO;
	import com.lightUI.comman.bet.BetSplit;
	import bull.modules.common.model.data.RoomData;
	
	import bull.modules.common.model.data.vo.ChipVO;
	import bull.modules.common.model.data.vo.ClipConfigVo;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;	
	
	
	import laya.media.SoundManager;
	import bull.core.SoundPath;
	
	import bull.utils.BetAreaUtil;
	import ui.ui.room.BullSceneUI;
	
	import com.lightUI.utils.DisplayUtil;
	

	public class BullScene extends BullSceneUI
	{		
		private var _roomData:RoomData;
		private var _betSplitUtil:BetSplit;
		
		private var _selfChips:Array = [];////////////////////记录自己的筹码   每次下注结束后清零
		private var _otherChips:Array = [];////////////////////记录自己的筹码   每次下注结束后清零
		private var _betsBox:Sprite;
		
		public var pop_window:Sprite = null;
		private var _check_dot_msg:String = "确认下注中";
		private var _check_dot_diplay_msg:String = "";
		private var _check_dot_times:int = 3;
		
		public function BullScene()
		{
			super();			
			this.on(Event.ADDED, this,onAdded);
		}
		
		private function onAdded():void {
			this.off(Event.ADDED,this,onAdded);
			
			_betsBox = new Sprite();
			addChildAt(_betsBox, getChildIndex(viewArea));
		}
		
		public function showme():void{
			trace("showme showme");
			
			
			//向左滑入
			Tween.to(viewRecord, { x:0 }, 1000, Ease.backIn);			
			//向上滑入
			Tween.to(viewHead, { y:720 }, 1000, Ease.backIn);												
			Tween.to(ViewBetGroup, { y:709 }, 1000, Ease.backIn);
			Tween.to(viewSelectClip, { y:665 }, 1000, Ease.backIn);
			Tween.to(bg_board, { y:703 }, 1000, Ease.backIn);
			
			//向下滑入
			Tween.to(viewBankerPanel, { y:-5 }, 1000, Ease.backIn);			
		
		}
		
		public function hideme():void{
			trace("===============================hideme")
			
			clear();
			btn_display(false);
			
			viewRecord.x = -173;
			viewHead.y = 816;			
			viewBankerPanel.y = -81;
			ViewBetGroup.y = 805;
			viewSelectClip.y = 803;
			bg_board.y = 800;
			
			
			Laya.timer.clearAll(this);
			SoundManager.stopAll();
			Tween.clearAll(this);			
			
			
		}
		
		public function btn_display(show:Boolean):void
		{
			btnBg.visible = setupBtn.visible = helpBtn.visible = CarryInBtn.visible = PlayerListBtn.visible = show; 
		}
		
		
		public function start():void
		{
			trace("start")			
			
			//其它玩家當庄,非系統
			//TODO CHECK
			if( !_roomData.IsSysBanker() &&  (_roomData.banker_id.toNumber() != _roomData.uid))
			{
				phase_tip("等待玩家连庄",1);
			}
			
			//中途進入元件處理
			ViewWinLostEffect.hide();			
			viewBetTime.hide();
			viewPoker.hide();
			viewArea.hide();			
			ViewBetGroup.disapear();
			DisplayUtil.removeAllChildren(_betsBox);
			
			//有人下注再播			
			if( roomData.is_someOnebet() ) SoundManager.playSound(SoundPath.Coin);
		}
		
		public function banker():void
		{
			trace("banker");
			
			//下注區閃櫟
			viewArea.set_ready();
			
			//中途進入元件處理
			ViewWinLostEffect.hide();
			ViewBetGroup.disapear();
			viewBetTime.hide();
			viewPoker.hide();
			viewArea.hide();
			DisplayUtil.removeAllChildren(_betsBox);
		}
		
		public function bet():void
		{
			trace("bet");
			_roomData.Zone_self_bet = [0, 0, 0, 0];
			_roomData.Zone_Total_bet = [0, 0, 0, 0];
			
			//自己坐庄 			
			if( roomData.banker_id.toNumber() == roomData.uid)
			{
				phase_tip("等待其他玩家下注！",0);
				
				//上庄玩家注區不能下注,COIN 灰掉
				viewSelectClip.set_gray(true);
				
				
			}	
			else if ( roomData.Total_money == 0)
			{
				//觀局模式,不能下注
				trace("觀局模式");
				viewSelectClip.set_gray(true);				
			}
			else
			{
				trace("玩家正常下注模式");
				//選第一個COIN
				viewArea.set_fellow_coin(viewSelectClip["mcSelect_0"]);	
				viewArea.openbet();
				
				phase_tip("",0);
				
				viewSelectClip.set_gray(false);
				
				ViewBetGroup.appear(_roomData.Has_bet);
			}			
			
			
			//顥示限額
			viewArea.bet_limit(_roomData.IsSysBanker(),_roomData.appearMoney(_roomData.GetMoney(_roomData.room_info.room_limit)));
				
			//開始倒數
			viewBetTime.set_data([_roomData.LeftTime]);
			
			//本局限額
			roomData.rest_betlimit = roomData.GetMoney(roomData.room_info.room_limit);
			
			SoundManager.playSound(SoundPath.player_action);
			
			//中途進入元件處理
			ViewWinLostEffect.hide();
			viewPoker.hide();
			
		}
		
		public function betCheck():void
		{
			trace("betCheck");
			ViewBetGroup.disapear();
			
			//中途進入元件處理
			ViewWinLostEffect.hide();
			viewBetTime.hide();
			viewPoker.hide();
			viewArea.disable_zone();
			ViewBetGroup.disapear();
			
			
			//TODO ...						
			_check_dot_diplay_msg = _check_dot_msg;
			phase_tip(_check_dot_diplay_msg, 0);	
			_check_dot_times = 3;
			Laya.timer.loop(1000, this, timerHandler);
			
			
		}
		
		public function timerHandler():void
		{
			_check_dot_times -= 1;	
			
			_check_dot_diplay_msg += ".";
			
			phase_tip(_check_dot_diplay_msg, 0);
			if (_check_dot_times == 0)
			{
				Laya.timer.clear(this, timerHandler);
			}
			
		}
		
		public function deal():void
		{
			trace("deal");			
			
			_check_dot_diplay_msg = _check_dot_msg;
			
			//中途進入元件處理
			ViewWinLostEffect.hide();
			viewBetTime.hide();
			viewPoker.hide();			
			viewArea.disable_zone();
			ViewBetGroup.disapear();
			
			phase_tip("開牌中", 0);
		}
		
		public function end():void
		{
			trace("end");
			
			phase_tip("本局结束，即将开始下一局！",0);
			
			//中途進入元件處理
			viewBetTime.hide();
			viewArea.disable_zone();
			
		}
		
		public function phase_tip(msg:String,sec:Number = 0.5):void			
		{
			Hint.alpha = 0;
			Hint.text = msg;
			if( sec !=0)
			{								
				Tween.to(Hint, { alpha:1 }, sec * 1000, Ease.backIn, Handler.create(this, tip_apear));				
			}
			else
			{
				Hint.alpha = 1;
				Hint.text = msg;
			}
			
		}
		
		private function tip_apear():void		
		{
			Tween.to(Hint,{alpha:0},500,Ease.backIn);			
		}
		
		/**
		 * 初始化选择筹码 
		 */		
		public function initSelectClip(join_group:int):void
		{			
			_betSplitUtil = _roomData.chipTool;
			var clipConfigs:Array = [];
			
			var dataSelectClip:ClipConfigVo = roomData.getClipBets(join_group);
			if(dataSelectClip){
				for (var i:int = 0; i < dataSelectClip.selectClips.length; i++) 
				{
					clipConfigs.push(new BetInfoVO(parseInt(dataSelectClip.selectClips[i]),dataSelectClip.clipConfigs[i]));
				}
			}
			//trace("clipConfigs ==> ",clipConfigs);
			_betSplitUtil.betConfig = clipConfigs;
			//trace(" after clipConfigs ==> ", _betSplitUtil.betConfig);
			
			
			viewSelectClip.set_data(dataSelectClip.selectClips);			
		}
		
		public function flySelfChip(chip:Chip,pos:Point):void{
			chip.x = 657;
			chip.y = 647;
			_betsBox.addChild(chip);			
			Tween.to(chip,{x:viewArea.x + pos.x,y:viewArea.y+pos.y},500,Ease.cubicOut,Handler.create(this,onFlySelfCompleteHandler,[chip]));
			
			SoundManager.playSound(SoundPath.Coin);			
		}
		
		private function onFlySelfCompleteHandler(chip:Chip):void {			
			addChip(chip);		
		}
		
		public function addChip(chip:Chip):void{			
			if(chip.vo.isSelf) _selfChips.push(chip);
		}
		
		public function flySelfChipBack():void{
			var chip:Chip;
			for (var i:int = 0; i < _selfChips.length; i++) 
			{
				chip = _selfChips[i];
				Tween.to(chip,{x:637,y:923},500,Ease.cubicOut,Handler.create(this,onFlySelfBackCompleteHandler,[chip]));				
			}
			SoundManager.playSound(SoundPath.Coin);
		}
		
		private function onFlySelfBackCompleteHandler(chip:Chip):void{
			if(chip.parent) chip.parent.removeChild(chip);
			_selfChips = [];
		}
		
		public function flayChipOther(chip:Chip,pos:Point):void
		{						
			chip.x = 1419;
			chip.y = 194;
			_betsBox.addChild(chip);
			Tween.to(chip, { x:viewArea.x + pos.x, y:viewArea.y + pos.y }, 500, Ease.cubicOut, Handler.create(this, onFlyOtherCompleteHandler, [chip]));
			SoundManager.playSound(SoundPath.Coin);
			return;		
		}
		
		private function onFlyOtherCompleteHandler(chip:Chip):void {
			trace("onFlyOtherCompleteHandler");
			addOthersChip(chip);
		}
		
		private function addOthersChip(chip:Chip):void{
			_otherChips.push(chip);
		}
		
		
		public function removeOthersChip(chipVO:ChipVO):void 
		{
			for(var i:int =0; i<_otherChips.length; i++){
				
				var chip:Chip = _otherChips[i]; 				
				if(chip.vo.type == chipVO.type){
					if (chip.parent) 
					{
						chip.parent.removeChild(chip);
						break;
					}
				}
			}
		} 
		
		
		public function get roomData():RoomData
		{
			return _roomData;
		}
		public function set roomData(value:RoomData):void
		{
			_roomData = value;
		}
		
		public function clear():void {
			
			//自己有下注,不清
			_selfChips.length = 0;					
			_otherChips.length = 0;
			DisplayUtil.removeAllChildren(_betsBox);
		}
		
	}
}