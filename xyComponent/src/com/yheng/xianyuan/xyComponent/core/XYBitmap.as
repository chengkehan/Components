package com.yheng.xianyuan.xyComponent.core
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class XYBitmap extends Bitmap
	{
		public function XYBitmap(bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
	}
}