package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.core.XYTextField;
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	public class TextArea extends XYSprite
	{
		private var _marginTop:int = 4;
		private var _marginBottom:int = 4;
		private var _marginLeft:int = 4;
		private var _marginRight:int = 4;
		
		private var _input:XYTextField = null;
		
		private var _background:DisplayObject = null;
		
		private var _scrollBar:VScrollBar = null;
		
		private var _scrollBarWidth:Number = 20;
		
		public function TextArea()
		{
			_width = 180;
			_height = 180;
			
			_input = new XYTextField();
			_input.autoSize = TextFieldAutoSize.NONE;
			_input.multiline = true;
			_input.wordWrap = true;
			_input.width = _width;
			_input.height = _height;
			_input.type = TextFieldType.INPUT;
			_input.addEventListener(Event.CHANGE, inputHandler);
			addChildSuper(_input);
			
			_scrollBar = new VScrollBar();
			_scrollBar.positionMin = 1;
			_scrollBar.setMouseWheelTarget(this);
			_scrollBar.addEventListener(ScrollBarEvent.SCROLL, scrollHandler);
			
			redraw();
		}
		
		public function set text(value:String):void
		{
			_input.text = value;
		}
		
		public function get text():String
		{
			return _input.text;
		}
		
		public function set textColor(value:uint):void
		{
			_input.textColor = value;
		}
		
		public function get textColor():uint
		{
			return _input.textColor;
		}
		
		public function set textStroke(value:Boolean):void
		{
			_input.stroke = value;
		}
		
		public function get textStroke():Boolean
		{
			return _input.stroke;
		}
		
		public function set textStrokeColor(value:uint):void
		{
			_input.strokeColor = value;
		}
		
		public function get textStrokeColor():uint
		{
			return _input.strokeColor;
		}
		
		public function getScrollBar():ScrollBarBase
		{
			return _scrollBar;
		}
		
		public function set scrollBarWidth(value:Number):void
		{
			_scrollBarWidth = value;
			redraw();
		}
		
		public function get scrollBarWidth():Number
		{
			return _scrollBarWidth;
		}
		
		public function set marginTop(value:int):void
		{
			_marginTop = value;
			redraw();
		}
		
		public function get marginTop():int
		{
			return _marginTop;
		}
		
		public function set marginBottom(value:int):void
		{
			_marginBottom = value;
			redraw();
		}
		
		public function get marginBottom():int
		{
			return _marginBottom;
		}
		
		public function set marginLeft(value:int):void
		{
			_marginLeft = value;
			redraw();
		}
		
		public function get marginLeft():int
		{
			return _marginLeft;
		}
		
		public function set marginRight(value:int):void
		{
			_marginRight = value;
			redraw();
		}
		
		public function get marginRight():int
		{
			return _marginRight;
		}
		
		public function setBackground(bg:DisplayObject):void
		{
			if(_background != null)
			{
				if(_background.parent == this)
				{
					removeChildSuper(_background);
				}
				_background = null;
			}
			if(bg != null)
			{
				_background = bg;
				addChildSuper(_background);
				redraw();
			}
		}
		
		public function getBackground():DisplayObject
		{
			return _background;
		}
		
		override protected function redraw():void
		{
			if(_background != null)
			{
				_background.width = _width;
				_background.height = _height;
			}
			
			_scrollBar.width = _scrollBarWidth;
			
			_input.x = _marginLeft;
			_input.y = _marginTop;
			_input.width = _width - _marginLeft - _marginRight - (_scrollBar.parent == null ? 0 : _scrollBarWidth);
			_input.height = _height - _marginTop - _marginBottom;
			addChildSuper(_input);
			
			_scrollBar.x = _width - _scrollBar.width;
			_scrollBar.height = _height;
			_scrollBar.pageSize = _height * 2;
		}
		
		private function inputHandler(event:Event):void
		{
			if(_input.maxScrollV > 1)
			{
				if(_scrollBar.parent == null)
				{
					addChildSuper(_scrollBar);
					redraw();
				}
				
				_scrollBar.positionMax = _input.maxScrollV;
			}
			else
			{
				if(_scrollBar.parent == this)
				{
					removeChildSuper(_scrollBar);
					redraw();
				}
			}
		}
		
		private function scrollHandler(event:ScrollBarEvent):void
		{
			_input.scrollV = int(event.position);
		}
		
		override public function destroy():void
		{
			if(_input != null)
			{
				_input.removeEventListener(Event.CHANGE, inputHandler);
				_input = null;
			}
			if(_scrollBar != null && _scrollBar.parent == null)
			{
				_scrollBar.destroy();
				_scrollBar = null;
			}
			_background = null;
			super.destroy();
		}
	}
}