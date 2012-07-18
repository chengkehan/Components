package com.yheng.xianyuan.xyComponent.control
{
	public class RadioButton extends CheckBox
	{
		private static var _defaultGroup:ToggleButtonGroup = new ToggleButtonGroup();
		
		public function RadioButton()
		{
			setGroup(_defaultGroup);
		}
		
		override protected function mouseDownstateChangeInvokeInvoke():void
		{
			selectedChange(true);
		}
	}
}