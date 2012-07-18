package com.yheng.xianyuan.xyComponent.control
{
	public class CheckBox extends ToggleButton
	{
		public function CheckBox()
		{
			_width = 20;
			_height = 20;
		}
		
		override protected function redrawLabel():void
		{
			if(_label != null)
			{
				_label.x = _width;
				_label.y = (_height - _label.height) * .5;
				addChildSuper(_label);
			}
		}
	}
}