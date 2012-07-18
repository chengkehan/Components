package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	
	import flash.utils.Dictionary;

	public class ToggleButtonGroup implements IDestroy
	{
		protected var _btns:Dictionary/*key ToggleButton, value ToggleButton*/ = null;
		
		public function ToggleButtonGroup()
		{
			_btns = new Dictionary();
		}
		
		internal function addButton(btn:ToggleButton):void
		{
			if(btn != null)
			{
				_btns[btn] = btn;
			}
		}
		
		internal function removeButton(btn:ToggleButton):void
		{
			delete _btns[btn];
		}
		
		internal function againstOtherButtons(thisBtn:ToggleButton):void
		{
			for each(var btn:ToggleButton in _btns)
			{
				if(btn != thisBtn)
				{
					btn.selectedChange(false, false);
				}
			}
		}
		
		public function destroy():void
		{
			DestroyUtil.breakVector(_btns);
			_btns = null;
		}
	}
}