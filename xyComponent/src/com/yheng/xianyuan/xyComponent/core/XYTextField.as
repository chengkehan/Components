package com.yheng.xianyuan.xyComponent.core
{
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class XYTextField extends TextField
	{
		private var _stroke:Boolean = false;
		
		private var _strokeColor:uint = 0x000000;
		
		public function XYTextField()
		{
			autoSize = TextFieldAutoSize.LEFT;
		}
		
		public function set stroke(value:Boolean):void
		{
			if(value != _stroke)
			{
				_stroke = value;
				if(_stroke)
				{
					filters = [new GlowFilter(_strokeColor, 1, 2, 2, 2000)];
				}
				else
				{
					filters = null;
				}
			}
		}
		
		public function get stroke():Boolean
		{
			return _stroke;
		}
		
		public function set strokeColor(value:uint):void
		{
			if(_strokeColor != value)
			{
				_strokeColor = value;
				if(_stroke)
				{
					filters = [new GlowFilter(_strokeColor, 1, 2, 2, 2000)];
				}
			}
		}
		
		public function get strokeColor():uint
		{
			return _strokeColor;
		}
		
		public function set fontSize(value:uint):void
		{
			if(getTextFormat() == null)
			{
				setTextFormat(new TextFormat());
			}
			var format:TextFormat = getTextFormat();
			format.size = value;
			setTextFormat(format);
			defaultTextFormat = format;
		}
		
		override public function set text(value:String):void
		{
			super.text = value == null ? "" : value;
		}
		
		public function get fontSize():uint
		{
			return getTextFormat() == null ? 0 : uint(getTextFormat().size);
		}
	}
}