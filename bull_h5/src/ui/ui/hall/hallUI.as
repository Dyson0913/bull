/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.hall {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class hallUI extends View {
		public var backLobby:Button;
		public var btnBg:Image;
		public var optionBtn:Button;
		public var setupBtn:Button;
		public var helpBtn:Button;
		public var Ginit:Image;
		public var GHigh:Image;
		public var GBtn:Button;
		public var MBtn:Button;
		public var GLowEnter:Button;
		public var GHighEnter:Button;
		public var Minit:Image;
		public var MHigh:Image;
		public var MLowEnter:Button;
		public var MHighEnter:Button;
		public var LowRoomLimit:Text;
		public var HighRoomLimit:Text;
		public var LowRoomBet:Text;
		public var HighRoomBet:Text;

		public static var uiView:Object ={"type":"View","props":{"width":1420,"text":"房间限红:","height":800},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"res/hall/bg.jpg","name":"bg"}},{"type":"Button","props":{"y":0,"x":0,"var":"backLobby","skin":"res/alert/backLobbyBtn.png"}},{"type":"Image","props":{"y":3,"x":605,"skin":"res/hall/logo.png","name":"logo"}},{"type":"Image","props":{"y":106,"x":1340,"width":79,"var":"btnBg","skin":"res/share/btn_bg.png","height":195,"sizeGrid":"14,27,16,21"}},{"type":"Button","props":{"y":75,"x":1333,"var":"optionBtn","skin":"res/alert/optionBtn.png"}},{"type":"Button","props":{"y":158,"x":1345,"var":"setupBtn","skin":"res/alert/setup.png"}},{"type":"Button","props":{"y":223,"x":1345,"var":"helpBtn","skin":"res/alert/helpBtn.png"}},{"type":"Image","props":{"y":172,"x":158,"var":"Ginit","skin":"res/hall/img_Ginit.png"}},{"type":"Image","props":{"y":173,"x":771,"var":"GHigh","skin":"res/hall/img_GHigh.png"}},{"type":"Button","props":{"y":-1,"x":1046,"var":"GBtn","skin":"res/hall/GBtn.png"}},{"type":"Button","props":{"y":-2,"x":1232,"var":"MBtn","skin":"res/hall/MBtn.png"}},{"type":"Button","props":{"y":734,"x":328,"var":"GLowEnter","skin":"res/hall/GEnter.png"}},{"type":"Button","props":{"y":736,"x":956,"var":"GHighEnter","skin":"res/hall/GEnter.png"}},{"type":"Image","props":{"y":134,"x":377,"skin":"res/hall/borad_bg.png","name":"boardbg"}},{"type":"Image","props":{"y":137,"x":418,"skin":"res/hall/LP.png","name":"Lp"}},{"type":"Button","props":{"y":169,"x":156,"skin":"res/hall/fullState.png","name":"fullstate_low"}},{"type":"Button","props":{"y":171,"x":774,"skin":"res/hall/fullState.png","name":"fullstate_high"}},{"type":"Image","props":{"y":171,"x":157,"var":"Minit","skin":"res/hall/img_Minit.png"}},{"type":"Image","props":{"y":172,"x":772,"var":"MHigh","skin":"res/hall/img_MHigh.png"}},{"type":"Button","props":{"y":733,"x":326,"var":"MLowEnter","skin":"res/hall/MEnter.png"}},{"type":"Button","props":{"y":737,"x":957,"var":"MHighEnter","skin":"res/hall/MEnter.png"}},{"type":"Image","props":{"y":423,"x":176,"skin":"res/share/tip_bg.png"}},{"type":"Image","props":{"y":422,"x":795,"skin":"res/share/tip_bg.png"}},{"type":"Text","props":{"y":432,"x":210,"width":55,"text":"房间限红:","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#cd615f","bold":true}},{"type":"Text","props":{"y":431,"x":815,"width":55,"text":"房间限红:","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#cd615f","bold":true}},{"type":"Text","props":{"y":462,"x":192,"width":55,"text":"投注额:","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#cd615f","bold":true}},{"type":"Text","props":{"y":461,"x":801,"width":55,"text":"投注额:","scaleY":1.6,"scaleX":1.6,"height":15,"color":"#cd615f","bold":true}},{"type":"Text","props":{"y":427,"x":305,"width":75,"var":"LowRoomLimit","text":"2000","scaleY":2,"scaleX":2,"height":15,"color":"#f3e9e9","bold":false}},{"type":"Text","props":{"y":427,"x":909,"width":76,"var":"HighRoomLimit","text":"2000","scaleY":2,"scaleX":2,"height":15,"color":"#f3e9e9","bold":false}},{"type":"Text","props":{"y":457,"x":268,"width":75,"var":"LowRoomBet","text":"2000","scaleY":2,"scaleX":2,"height":15,"color":"#f3e9e9","bold":false}},{"type":"Text","props":{"y":457,"x":875,"width":75,"var":"HighRoomBet","text":"2000","scaleY":2,"scaleX":2,"height":15,"color":"#f3e9e9","bold":false}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);
		}
	}
}