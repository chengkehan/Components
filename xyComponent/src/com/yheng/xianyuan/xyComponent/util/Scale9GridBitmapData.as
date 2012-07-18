package com.yheng.xianyuan.xyComponent.util
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	
	import flash.display.BitmapData;

	public class Scale9GridBitmapData implements IDestroy, IXYBitmapData
	{
		private var _topLeft:BitmapData = null;
		
		private var _top:BitmapData = null;
		
		private var _topRight:BitmapData = null;
		
		private var _left:BitmapData = null;
		
		private var _center:BitmapData = null;
		
		private var _right:BitmapData = null;
		
		private var _bottomLeft:BitmapData = null;
		
		private var _bottom:BitmapData = null;
		
		private var _bottomRight:BitmapData = null;
		
		public function Scale9GridBitmapData(id:Number,
											 topLeft:BitmapData, top:BitmapData, topRight:BitmapData, 
											 left:BitmapData, center:BitmapData, right:BitmapData, 
											 bottomLeft:BitmapData, bottom:BitmapData, bottomRight:BitmapData)
		{
			_id = id;
			_topLeft = topLeft;
			_top = top;
			_topRight = topRight;
			_left = left;
			_center = center;
			_right = right;
			_bottomLeft = bottomLeft;
			_bottom = bottom;
			_bottomRight = bottomRight;
		}

		public function get topLeft():BitmapData
		{
			return _topLeft;
		}

		public function get top():BitmapData
		{
			return _top;
		}

		public function get topRight():BitmapData
		{
			return _topRight;
		}

		public function get left():BitmapData
		{
			return _left;
		}

		public function get center():BitmapData
		{
			return _center;
		}

		public function get right():BitmapData
		{
			return _right;
		}

		public function get bottomLeft():BitmapData
		{
			return _bottomLeft;
		}

		public function get bottom():BitmapData
		{
			return _bottom;
		}

		public function get bottomRight():BitmapData
		{
			return _bottomRight;
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
			return BitmapDataType.NINE;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// IDestroy
		//------------------------------------------------------------------------------------------------------------------------------
		
		public function destroy():void
		{
			_topLeft = null;
			_top = null;
			_topRight = null;
			_left = null;
			_center = null;
			_right = null;
			_bottomLeft = null;
			_bottom = null;
			_bottomRight = null;
		}
	}
}