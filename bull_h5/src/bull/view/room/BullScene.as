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
		
		
		public function BullScene()
		{
			super();			
			this.on(Event.ADDED, this,onAdded);
		}
		
		private function onAdded():void {
			this.off(Event.ADDED,this,onAdded);
			
			_betsBox = new Sprite();
			addChildAt(_betsBox, getChildIndex(viewArea));
			
			trace("gameview init");
		}
		
		public function showme():void{
			trace("showme showme");
			
			
			//向左滑入
			Tween.to(viewRecord, { x:viewRecord.x + 173 }, 1000, Ease.backIn);			
			//向上滑入
			Tween.to(viewHead, { y:viewHead.y  -96 }, 1000, Ease.backIn);												
			Tween.to(ViewBetGroup, { y:ViewBetGroup.y -96 }, 1000, Ease.backIn);
			Tween.to(viewSelectClip, { y:viewSelectClip.y -138 }, 1000, Ease.backIn);			
			//向下滑入
			Tween.to(viewBankerPanel, { y:viewBankerPanel.y +76 }, 1000, Ease.backIn);			
		
		}
		
		public function hideme():void{
			trace("hideme")
			
			//clear();
			btn_display(false);
			
			viewRecord.x = -173;
			viewHead.y = 816;			
			viewBankerPanel.y = -81;
			ViewBetGroup.y = 805;
			viewSelectClip.y = 803;
		}
		
		public function btn_display(show:Boolean):void
		{
			btnBg.visible = setupBtn.visible = helpBtn.visible = CarryInBtn.visible = PlayerListBtn.visible = show; 
		}
		
		
		public function start():void
		{
			trace("start");
			
			
			
			//中途進入元件處理			
			viewBetTime.hide();
			viewPoker.hide();
			viewArea.hide();
			DisplayUtil.removeAllChildren(_betsBox);
		}
		
		public function banker():void
		{
			trace("banker");
			
			//下注區閃櫟
			viewArea.set_ready(true, 20000);
			
			//中途進入元件處理
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
			
			
			
			viewArea.set_fellow_coin(viewSelectClip["mcSelect_0"]);			
			viewBetTime.set_data([_roomData.LeftTime]);
			
			//中途進入元件處理
			viewPoker.hide();
			
		}
		
		public function betCheck():void
		{
			trace("betCheck");
			
			//中途進入元件處理
			viewBetTime.hide();
			viewPoker.hide();
			viewArea.disable_zone();
		}
		
		public function deal():void
		{
			trace("deal");			
			
			//中途進入元件處理
			viewBetTime.hide();
			viewArea.disable_zone();
		}
		
		public function end():void
		{
			trace("end");
			
			//中途進入元件處理
			viewBetTime.hide();
			viewArea.disable_zone();
		}
		
		private function onReturnClick(e:Event):void
		{			
			
		}
		
		/**
		 * 初始化选择筹码 
		 */		
		public function initSelectClip(join_group:int):void
		{			
			_betSplitUtil = _roomData.chipTool;
			var clipConfigs:Array = [];
			//TODO join group
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
			//_betsBox.addChildAt(chip,getChildIndex(viewArea));
			Tween.to(chip,{x:viewArea.x + pos.x,y:viewArea.y+pos.y},500,Ease.cubicOut,Handler.create(this,onFlySelfCompleteHandler,[chip]));
			
			//SoundManager.playSound(SoundPath.Sound_sound_jetton);
		}
		
		private function onFlySelfCompleteHandler(chip:Chip):void {
			trace("onFlySelfCompleteHandler ");
			//updateMyBetAmountByID(chip.vo.type);
			//updateTotalBetAmountByID(chip.vo.type);
			addChip(chip);
			//updateBtnStatus();
			
			//如果是自己投的解开状态
			//if(chip.vo.isSelf) roomData.xutou = false;
		}
		
		public function addChip(chip:Chip):void{			
			if(chip.vo.isSelf) _selfChips.push(chip);
		}
		
		public function flySelfChipBack():void{
			trace("flySelfChipBack", _selfChips.length);
			var chip:Chip;
			for (var i:int = 0; i < _selfChips.length; i++) 
			{
				chip = _selfChips[i];
				Tween.to(chip,{x:637,y:923},500,Ease.cubicOut,Handler.create(this,onFlySelfBackCompleteHandler,[chip]));
				//SoundManager.playSound(SoundPath.Sound_sound_jetton);
			}
		}
		
		private function onFlySelfBackCompleteHandler(chip:Chip):void{
			if(chip.parent) chip.parent.removeChild(chip);
			_selfChips = [];
			//updateBtnStatus();
			//cz_btn.disabled = true;
		}
		
		public function flayChipOther(chip:Chip,pos:Point):void
		{						
			chip.x = 1419;
			chip.y = 194;
			_betsBox.addChild(chip);
			Tween.to(chip, { x:viewArea.x + pos.x, y:viewArea.y + pos.y }, 500, Ease.cubicOut, Handler.create(this, onFlyOtherCompleteHandler, [chip]));
			//SoundManager.playSound(SoundPath.Sound_sound_jetton);
			return;		
		}
		
		private function onFlyOtherCompleteHandler(chip:Chip):void {
			trace("onFlyOtherCompleteHandler");
			//显示总的下注额变动
			//updateTotalBetAmountByID(chip.vo.type);
			
			//if(!chip.vo.isSelf)
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
			//_roomData.on(RoomData.START_BET,this,onStartBet);
			//_roomData.on(RoomData.END_BET,this,onEndBet);
			//_roomData.on(RoomData.LOTTERY_DRAW,this, onLotteryDraw);
			//
			//_roomData.on(RoomData.UPDATA,this,onUpData);
			//_roomData.on(RoomData.ADD_BET,this, onAddBet);
			//_roomData.on(RoomData.REMOVE_BET,this, onRemoveBet);
			//_roomData.on(RoomData.CANCEL_BET_SELF, this, onCancelBetSelf);
			//_roomData.on(RoomData.ADD_BET_SELF, this, onAddBetSelf);
		}
		
		public function clear():void {
		
		}
		
	}
}