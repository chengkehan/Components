package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.yheng.xianyuan.xyComponent.core.XYTextField;

	public class Button extends ButtonBase
	{
		public function Button()
		{
			
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Label
		//------------------------------------------------------------------------------------------------------------------------------
		
		protected var _label:XYTextField = null;
		
		public function set labelStroke(value:Boolean):void
		{
			initilaizeLabel();
			_label.stroke = value;
		}
		
		public function get labelStroke():Boolean
		{
			return _label == null ? false : _label.stroke;
		}
		
		public function set labelStrokeColor(value:uint):void
		{
			initilaizeLabel();
			_label.strokeColor = value;
		}
		
		public function get labelStrokeColor():uint
		{
			return _label == null ? 0x000000 : _label.strokeColor;
		}
		
		public function set labelColor(value:uint):void
		{
			initilaizeLabel();
			_label.textColor = value;
		}
		
		public function get labelColor():uint
		{
			return _label == null ? 0x000000 : _label.textColor;
		}
		
		public function set fontSize(value:uint):void
		{
			initilaizeLabel();
			_label.fontSize = value;
			redraw();
		}
		
		public function get fontSize():uint
		{
			return _label == null ? 0 : _label.fontSize;
		}
		
		public function get label():String
		{
			return _label == null ? Common.EMPTY_STRING : _label.text;
		}
		
		public function set label(value:String):void
		{
			initilaizeLabel();
			_label.text = value == null ? Common.EMPTY_STRING : value;
			redraw();
		}
		
		private function initilaizeLabel():void
		{
			if(_label == null)
			{
				_label = new XYTextField();
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Refresh
		//------------------------------------------------------------------------------------------------------------------------------
		
		override protected function redraw():void
		{
			super.redraw();
			redrawLabel();
		}
		
		protected function redrawLabel():void
		{
			if(_label != null)
			{
				_label.x = (_width - _label.width) * .5;
				_label.y = (_height - _label.height) * .5;
				addChildSuper(_label);
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// IDispose
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function destroy():void
		{
			_label = null;
			super.destroy();
		}

	}
}