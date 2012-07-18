package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.lang.utils.Common;
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.core.XYTextField;
	
	import flash.display.DisplayObject;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	public class TextInput extends XYSprite
	{
		public function TextInput()
		{
			_width = 100;
			_height = 30;
			initializeTF();
			redraw();
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Margin
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _marginTop:int = 4;
		private var _marginBottom:int = 4;
		private var _marginLeft:int = 4;
		private var _marginRight:int = 4;
		
		public function get marginTop():int
		{
			return _marginTop;
		}
		
		public function set marginTop(value:int):void
		{
			_marginTop = value;
			redraw();
		}
		
		public function get marginBottom():int
		{
			return _marginBottom;
		}
		
		public function set marginBottom(value:int):void
		{
			_marginBottom = value;
			redraw();
		}
		
		public function get marginLeft():int
		{
			return _marginLeft;
		}
		
		public function set marginLeft(value:int):void
		{
			_marginLeft = value;
			redraw();
		}
		
		public function get marginRight():int
		{
			return _marginRight;
		}
		
		public function set marginRight(value:int):void
		{
			_marginRight = value;
			redraw();
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// TextField
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _tf:XYTextField = null;
		
		public function set text(str:String):void
		{
			_tf.text = str == null ? Common.EMPTY_STRING : str;
		}
		
		public function get text():String
		{
			return _tf.text;
		}
		
		public function set textStroke(value:Boolean):void
		{
			_tf.stroke = value;
		}
		
		public function get textStroke():Boolean
		{
			return _tf.stroke;
		}
		
		public function set textStrokeColor(value:uint):void
		{
			_tf.strokeColor = value;
		}
		
		public function get textStrokeColor():uint
		{
			return _tf.strokeColor;
		}
		
		public function set textColor(value:uint):void
		{
			_tf.textColor = value;
		}
		
		public function get textColor():uint
		{
			return _tf.textColor;
		}
		
		public function set fontSize(value:uint):void
		{
			_tf.fontSize = value;
		}
		
		public function get fontSize():uint
		{
			return _tf.fontSize;
		}
		
		public function set displayAsPassword(bool:Boolean):void
		{
			_tf.displayAsPassword = bool;
		}
		
		public function get displayAsPassword():Boolean
		{
			return _tf.displayAsPassword;
		}
		
		private function initializeTF():void
		{
			_tf = new XYTextField();
			_tf.autoSize = TextFieldAutoSize.NONE;
			_tf.type = TextFieldType.INPUT;
			addChildSuper(_tf);
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Background
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _background:DisplayObject = null;
		
		public function setBackground(value:DisplayObject):void
		{
			if(_background != null)
			{
				if(_background.parent == this)
				{
					removeChildSuper(_background);
				}
				_background = null;
			}
			if(value != null)
			{
				_background = value;
				addChildSuper(_background);
				redraw();
			}
		}
		
		public function getBackground():DisplayObject
		{
			return _background;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Refresh
		//------------------------------------------------------------------------------------------------------------------------------
		
		override protected function redraw():void
		{
			if(_background != null)
			{
				_background.width = _width;
				_background.height = _height;
			}
			
			_tf.x = _marginLeft;
			_tf.y = _marginTop;
			_tf.width = _width - _marginLeft - _marginRight;
			_tf.height = _height - _marginTop - _marginBottom;
			addChildSuper(_tf);
			
			if(enabled)
			{
				_tf.type = TextFieldType.INPUT;
				_tf.selectable = true;
			}
			else
			{
				_tf.type = TextFieldType.DYNAMIC;
				_tf.selectable = false;
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// IDispose
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function destroy():void
		{
			_tf = null;
			_background = null;
			super.destroy();
		}
	}
}