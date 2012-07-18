package com.yheng.xianyuan.xyComponent.control
{
	public class ToggleButtonColorLabelGroup extends ToggleButtonGroup
	{
		private var _normalLabelColor:uint = 0x000000;
		
		private var _selectedLabelColor:uint = 0xFF0000;
		
		public function ToggleButtonColorLabelGroup()
		{
			super();
		}
		
		public function set normalLabelColor(color:uint):void
		{
			_normalLabelColor = color;
		}
		
		public function get normalLabelColor():uint
		{
			return _normalLabelColor;
		}
		
		public function set selectedLabelColor(color:uint):void
		{
			_selectedLabelColor = color;
		}
		
		public function get selectedLabelColor():uint
		{
			return _selectedLabelColor;
		}
		
		override internal function addButton(btn:ToggleButton):void
		{
			if(btn != null)
			{
				_btns[btn] = btn;
				btn.labelColor = _normalLabelColor;
			}
		}
		
		override internal function againstOtherButtons(thisBtn:ToggleButton):void
		{
			thisBtn.labelColor = _selectedLabelColor;
			for each(var btn:ToggleButton in _btns)
			{
				if(btn != thisBtn)
				{
					btn.labelColor = _normalLabelColor;
					btn.selectedChange(false, false);
				}
			}
		}
	}
}