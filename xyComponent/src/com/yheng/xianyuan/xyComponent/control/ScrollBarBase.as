package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;
	
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.codeTooth.actionscript.lang.errors.AbstractError;
	
	public class ScrollBarBase extends XYSprite
	{
		protected const BAR_MIN_SIZE:Number = 10;
		
		protected const SCROLL_STATE_STOP:int = 1;
		protected const SCROLL_STATE_MIN:int = 2;
		protected const SCROLL_STATE_MAX:int = 3;
		protected const SCROLL_STATE_DRAG:int = 4;
		protected const SCROLL_STATE_SLIDE:int = 5;
		protected const SCROLL_STATE_WHEEL_MIN:int = 6;
		protected const SCROLL_STATE_WHEEL_MAX:int = 7;
		
		protected var _scrollState:int = SCROLL_STATE_STOP;
		
		protected var _minArrow:ButtonBase = null;
		
		protected var _maxArrow:ButtonBase = null;
		
		protected var _bar:ButtonBase = null;
		
		protected var _track:ButtonBase = null;
		
		protected var _arrowSize:Number = 0;
		
		protected var _pageSize:Number = 0;
		
		protected var _positionMax:Number = 0;
		
		protected var _positionMin:Number = 0;
		
		protected var _position:Number = 0;
		
		protected var _barDragDx:Number = 0;
		
		protected var _barDragDy:Number = 0;
		
		protected var _lineScrollSize:Number = 5;
		
		protected var _pageScrollSize:Number = 10;
		
		protected var _trackSlideDx:Number = 0;
		
		protected var _trackSlideDy:Number = 0;
		
		private var _mouseWheelTarget:InteractiveObject = null;
		
		private var _stage:Stage = null;
		
		public function ScrollBarBase()
		{
			_track = new ButtonBase();
			addChildSuper(_track);
			
			_bar = new ButtonBase();
			addChildSuper(_bar);
			
			_minArrow = new ButtonBase();
			addChildSuper(_minArrow);
			
			_maxArrow = new ButtonBase();
			addChildSuper(_maxArrow);
			
			_minArrow.addEventListener(MouseEvent.MOUSE_DOWN, minArrowHandler);
			_maxArrow.addEventListener(MouseEvent.MOUSE_DOWN, maxArrowHandler);
			_bar.addEventListener(MouseEvent.MOUSE_DOWN, barMouseDownHandler);
			_track.addEventListener(MouseEvent.MOUSE_DOWN, trackMouseDownHandler);
			addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
			
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		public function setMouseWheelTarget(target:InteractiveObject):void
		{
			if(target != _mouseWheelTarget)
			{
				if(_mouseWheelTarget != null)
				{
					_mouseWheelTarget.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
					_mouseWheelTarget = null;
				}
				
				if(target != null)
				{
					_mouseWheelTarget = target;
					_mouseWheelTarget.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				}
			}
		}
		
		public function getMouseWheelTarget():InteractiveObject
		{
			return _mouseWheelTarget;
		}
		
		public function set lineScrollSize(value:Number):void
		{
			_lineScrollSize = value;
		}
		
		public function get lineScrollSize():Number
		{
			return _lineScrollSize;
		}
		
		public function set pageScrollSize(value:Number):void
		{
			_pageScrollSize = value;
		}
		
		public function get pageScrollSize():Number
		{
			return _pageScrollSize;
		}
		
		public function getMinArrow():ButtonBase
		{
			return _minArrow;
		}
		
		public function getMaxArrow():ButtonBase
		{
			return _maxArrow;
		}
		
		public function getBar():ButtonBase
		{
			return _bar;
		}
		
		public function getTrack():ButtonBase
		{
			return _track;
		}
		
		public function set positionMax(value:Number):void
		{
			if(value != _positionMax)
			{
				_positionMax = Math.max(value, _positionMin, _position);
				redrawBar();
			}
		}
		
		public function get positionMax():Number
		{
			return _positionMax;
		}
		
		public function set positionMin(value:Number):void
		{
			if(value != _positionMin)
			{
				_positionMin = Math.min(value, _positionMax, _position);
				redrawBar();
			}
		}
		
		public function get positionMin():Number
		{
			return _positionMin;
		}
		
		public function set position(value:Number):void
		{
			if(value != _position)
			{
				_position = Math.min(Math.max(value, _positionMin), _positionMax);
				redrawBar();
				dispatchEvent(new ScrollBarEvent(ScrollBarEvent.SCROLL, false, false, _position));
			}
		}
		
		public function get position():Number
		{
			return _position;
		}
		
		public function set pageSize(value:Number):void
		{
			if(value != _pageSize)
			{
				_pageSize = value;
				redraw();
			}
		}
		
		public function set arrowSize(vaule:Number):void
		{
			if(vaule != _arrowSize)
			{
				_arrowSize = vaule;
				redraw();
			}
		}
		
		public function get arrowSize():Number
		{
			return _arrowSize;
		}
		
		override public function set enabled(value:Boolean):void
		{
			super.enabled = value;
			
			if(!_enabled)
			{
				stopScroll();
			}
		}
		
		protected function redrawBar():void
		{
			throw new AbstractError();
		}
		
		protected function stopScroll():void
		{
			_scrollState = SCROLL_STATE_STOP;
			removeEventListener(Event.ENTER_FRAME, scrollHandler);
			removeStageListener();
		}
		
		override protected function redraw():void
		{
			_track.enabled = _enabled;
			_bar.enabled = _enabled;
			_minArrow.enabled = _enabled;
			_maxArrow.enabled = _enabled;
		}
		
		private function addToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			_stage = stage;
		}
		
		private function minArrowHandler(event:MouseEvent):void
		{
			if(!_enabled)
			{
				return;
			}
			
			if(_scrollState == SCROLL_STATE_STOP)
			{
				_scrollState = SCROLL_STATE_MIN;
				addEventListener(Event.ENTER_FRAME, scrollHandler);
				_stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			}
		}
		
		private function maxArrowHandler(event:MouseEvent):void
		{
			if(!_enabled)
			{
				return;
			}
			
			if(_scrollState == SCROLL_STATE_STOP)
			{
				_scrollState = SCROLL_STATE_MAX;
				addEventListener(Event.ENTER_FRAME, scrollHandler);
				_stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			}
		}
		
		private function scrollHandler(event:Event):void
		{
			scrollInvoke();
		}
		
		protected function scrollInvoke():void
		{
			throw new AbstractError();
		}
		
		private function stageMouseUpHandler(event:MouseEvent):void
		{
			stopScroll();
		}
		
		private function barMouseDownHandler(event:MouseEvent):void
		{
			if(!_enabled)
			{
				return;
			}
			
			if(_scrollState == SCROLL_STATE_STOP)
			{
				_scrollState = SCROLL_STATE_DRAG;
				_barDragDx = mouseX - _bar.x;
				_barDragDy = mouseY - _bar.y;
				addEventListener(Event.ENTER_FRAME, scrollHandler);
				_stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			}
		}
		
		private function trackMouseDownHandler(event:MouseEvent):void
		{
			if(!_enabled)
			{
				return;
			}
			
			if(_scrollState == SCROLL_STATE_STOP)
			{
				_scrollState = SCROLL_STATE_SLIDE;
				_trackSlideDx = mouseX;
				_trackSlideDy = mouseY;
				addEventListener(Event.ENTER_FRAME, scrollHandler);
				_stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			}
		}
		
		private function removeStageListener():void
		{
			if(_stage != null)
			{
				_stage.removeEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
			}
		}
		
		private function mouseWheelHandler(event:MouseEvent):void
		{
			if(!_enabled)
			{
				return;
			}
			
			if(_scrollState == SCROLL_STATE_STOP)
			{
				if(event.delta > 0)
				{
					_scrollState = SCROLL_STATE_WHEEL_MIN;
					scrollInvoke();
					_scrollState = SCROLL_STATE_STOP;
				}
				else if(event.delta < 0)
				{
					_scrollState = SCROLL_STATE_WHEEL_MAX;
					scrollInvoke();
					_scrollState = SCROLL_STATE_STOP;
				}
				else
				{
					// Do nothing
				}
			}
		}
		
		override public function destroy():void
		{
			removeStageListener();
			_stage = null;
			setMouseWheelTarget(null);
			_minArrow = null;
			_maxArrow = null;
			_bar = null;
			_track = null;
			super.destroy();
		}
	}
}