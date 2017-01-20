package bull.view.alert
{
	import ui.ui.alert.RulePanelUI;
	
	public class RulePanel extends RulePanelUI
	{
		public function RulePanel()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();				
		}
		
		
		public function update_data(data:Array):void
		{
			trace("RulePanel ================steeing");
			list.array = data;
		}
	}
}