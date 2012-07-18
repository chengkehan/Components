package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;

	public class HScrollBar extends ScrollBarBase
	{
		public function HScrollBar()
		{
			_width = 200;
			_height = 20;
			_arrowSize = 20;
			_pageSize = 400;
			_positionMin = 0;
			_positionMax = 100;
			redraw();
		}
		
		override public function set width(value:Number):void
		{
			value = Math.max(_arrowSize * 2 + BAR_MIN_SIZE, value);
			super.width = value;
		}
		
		override protected function redraw():void
		{
			super.redraw();
			
			_minArrow.height = _height;
			_minArrow.width = _arrowSize;
			_maxArrow.height = _height;
			_maxArrow.width = _arrowSize;
			_track.height = _height;
			_track.width = _width;
			_maxArrow.x = _width - _arrowSize;
			redrawBar();
		}
		
		override protected function redrawBar():void
		{
			var barMaxWidth:Number = _width - _arrowSize * 2;
			var barWidth:Number = Math.max(Math.min(barMaxWidth, barMaxWidth * (_width / _pageSize)), BAR_MIN_SIZE);
			_bar.width = barWidth;
			_bar.height = _height;
			if(_positionMax - _positionMin == 0)
			{
				_bar.x = 0;
			}
			else
			{
				_bar.x = _arrowSize + (barMaxWidth - barWidth) * ((_position - _positionMin) / (_positionMax - _positionMin));
			}
			limitBarPos();
		}
		
		override protected function scrollInvoke():void
		{
			var positionPrev:Number = _position;
			
			if(_scrollState == SCROLL_STATE_MAX || _scrollState == SCROLL_STATE_WHEEL_MAX)
			{
				_bar.x += _lineScrollSize;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_MIN || _scrollState == SCROLL_STATE_WHEEL_MIN)
			{
				_bar.x -= _lineScrollSize;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_DRAG)
			{
				_bar.x = mouseX - _barDragDx;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_SLIDE)
			{
				if(_trackSlideDx >= _bar.x && _trackSlideDx <= _bar.x + _bar.width)
				{
					stopScroll();
					return;
				}
				else
				{
					var barCX:Number = _bar.x + _bar.width * .5;
					if(_trackSlideDx > barCX)
					{
						_bar.x += _pageScrollSize;
					}
					else
					{
						_bar.x -= _pageScrollSize;
					}
					limitBarPos();
					calculatePosition();
				}
			}
			else
			{
				// Do nothing
			}
			
			if(_position != positionPrev)
			{
				dispatchEvent(new ScrollBarEvent(ScrollBarEvent.SCROLL, false, false, _position));
			}
		}
		
		private function calculatePosition():void
		{
			var barMaxWidth:Number = _width - _arrowSize * 2;
			if(barMaxWidth - _bar.width == 0)
			{
				_position = _positionMin;
			}
			else
			{
				_position = _positionMin + (_positionMax - _positionMin) * ((_bar.x - _arrowSize) / (barMaxWidth - _bar.width));
				_position = Math.min(Math.max(_position, _positionMin), _positionMax);
			}
		}
		
		private function limitBarPos():void
		{
			_bar.x = Math.min(Math.max(_bar.x, _arrowSize), _width - _arrowSize - _bar.width);
		}
	}
}