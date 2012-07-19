package com.yheng.xianyuan.xyComponent.control
{
	public class DropDown extends DropDownListBase
	{
		public function DropDown()
		{
			
		}
		
		override protected function redraw():void
		{
			_down.width = _width;
		}
	}
}