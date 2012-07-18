package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYTextField;

	public class LabelButton extends ButtonBase
	{
		private var _outLabel:XYTextField = null;
		
		private var _overLabel:XYTextField = null;
		
		private var _downLabel:XYTextField = null;
		
		private var _disabledLabel:XYTextField = null;
		
		public function LabelButton()
		{
			_outLabel = new XYTextField();
			_outLabel.text = "LabelButton";
			_outLabel.textColor = 0xFF0000;
			
			_overLabel = new XYTextField();
			_overLabel.text = "LabelButton";
			_overLabel.textColor = 0xDD0000;
			
			_downLabel = new XYTextField();
			_downLabel.text = "LabelButton";
			_downLabel.textColor = 0xAA0000;
			
			_disabledLabel = new XYTextField();
			_disabledLabel.text = "LabelButton";
			_disabledLabel.textColor = 0x444444;
			
			setOutSkin(_outLabel);
			setOverSkin(_overLabel);
			setDownSkin(_downLabel);
			setDisabledSkin(_disabledLabel);
		}
		
		public function set stroke(bool:Boolean):void
		{
			_outLabel.stroke = bool;
			_overLabel.stroke = bool;
			_downLabel.stroke = bool;
			_disabledLabel.stroke = bool;
		}
		
		public function get stroke():Boolean
		{
			return _outLabel.stroke;
		}
		
		public function set strokeColor(value:uint):void
		{
			_outLabel.strokeColor = value;
			_overLabel.strokeColor = value;
			_downLabel.strokeColor = value;
			_disabledLabel.strokeColor = value;
		}
		
		public function get strokeColor():uint
		{
			return _outLabel.strokeColor;
		}
		
		public function set label(str:String):void
		{
			_outLabel.text = str;
			_overLabel.text = str;
			_downLabel.text = str;
			_disabledLabel.text = str;
		}
		
		public function get label():String
		{
			return _outLabel.text;
		}
		
		public function set fontSize(value:uint):void
		{
			_outLabel.fontSize = value;
			_overLabel.fontSize = value;
			_downLabel.fontSize = value;
			_disabledLabel.fontSize = value;
		}
		
		public function get fontSize():uint
		{
			return _outLabel.fontSize;
		}
		
		public function set outColor(color:uint):void
		{
			_outLabel.textColor = color;
		}
		
		public function get outColor():uint
		{
			return _outLabel.textColor;
		}
		
		public function set overColor(color:uint):void
		{
			_overLabel.textColor = color;
		}
		
		public function get overColor():uint
		{
			return _overLabel.textColor;
		}
		
		public function set downColor(color:uint):void
		{
			_downLabel.textColor = color;
		}
		
		public function get downColor():uint
		{
			return _downLabel.textColor;
		}
		
		public function set disabledColor(color:uint):void
		{
			_disabledLabel.textColor = color;
		}
		
		public function get disabledColor():uint
		{
			return _disabledLabel.textColor;
		}
		
		override public function destroy():void
		{
			_overLabel = null;
			_outLabel = null;
			_downLabel = null;
			_disabledLabel = null;
		}
	}
}