package com.yheng.xianyuan.xyComponent.util
{
	import com.yheng.xianyuan.xyComponent.core.XYBitmapData;
	
	import flash.display.BitmapData;
	
	public class NormalBitmapData extends XYBitmapData implements IXYBitmapData
	{
		public function NormalBitmapData(id:Number, width:int, height:int, transparent:Boolean=true, fillColor:uint=4.294967295E9)
		{
			super(width, height, transparent, fillColor);
			_id = id;
		}

		//------------------------------------------------------------------------------------------------------------------------------
		// IXYBitmapData
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _id:Number = 0;
		
		public function get id():Number
		{
			return _id;
		}

		public function get bitmapDataType():int
		{
			return BitmapDataType.SINGLE;
		}
	}
}