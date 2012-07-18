package com.yheng.xianyuan.xyComponent.core
{
	import flash.display.BitmapData;
	
	public class XYBitmapData extends BitmapData
	{
		public function XYBitmapData(width:int, height:int, transparent:Boolean=true, fillColor:uint=4.294967295E9)
		{
			super(width, height, transparent, fillColor);
		}
	}
}