package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;

	public class VScrollBar extends ScrollBarBase
	{
		public function VScrollBar()
		{
			_width = 20;
			_height = 200;
			_arrowSize = 20;
			_pageSize = 400;
			_positionMin = 0;
			_positionMax = 100;
			redraw();
		}
		
		override public function set height(value:Number):void
		{
			value = Math.max(_arrowSize * 2 + BAR_MIN_SIZE, value);
			super.height = value;
		}
		
		override protected function redraw():void
		{
			super.redraw();
			
			_minArrow.width = _width;
			_minArrow.height = _arrowSize;
			_maxArrow.width = _width;
			_maxArrow.height = _arrowSize;
			_track.width = _width;
			_track.height = _height;
			_maxArrow.y = _height - _arrowSize;
			redrawBar();
		}
		
		override protected function redrawBar():void
		{
			var barMaxHeight:Number = _height - _arrowSize * 2;
			var barHeight:Number = Math.max(Math.min(barMaxHeight, barMaxHeight * (_height / _pageSize)), BAR_MIN_SIZE);
			_bar.height = barHeight;
			_bar.width = _width;
			if(_positionMax - _positionMin == 0)
			{
				_bar.y = 0;
			}
			else
			{
				_bar.y = _arrowSize + (barMaxHeight - barHeight) * ((_position - _positionMin) / (_positionMax - _positionMin));
			}
			limitBarPos();
		}
		
		override protected function scrollInvoke():void
		{
			var positionPrev:Number = _position;
			
			if(_scrollState == SCROLL_STATE_MAX || _scrollState == SCROLL_STATE_WHEEL_MAX)
			{
				_bar.y += _lineScrollSize;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_MIN || _scrollState == SCROLL_STATE_WHEEL_MIN)
			{
				_bar.y -= _lineScrollSize;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_DRAG)
			{
				_bar.y = mouseY - _barDragDy;
				limitBarPos();
				calculatePosition();
			}
			else if(_scrollState == SCROLL_STATE_SLIDE)
			{
				if(_trackSlideDy >= _bar.y && _trackSlideDy <= _bar.y + _bar.height)
				{
					stopScroll();
					return;
				}
				else
				{
					var barCY:Number = _bar.y + _bar.height * .5;
					if(_trackSlideDy > barCY)
					{
						_bar.y += _pageScrollSize;
					}
					else
					{
						_bar.y -= _pageScrollSize;
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
			var barMaxHeight:Number = _height - _arrowSize * 2;
			if(barMaxHeight - _bar.height == 0)
			{
				_position = _positionMin;
			}
			else
			{
				_position = _positionMin + (_positionMax - _positionMin) * ((_bar.y - _arrowSize) / (barMaxHeight - _bar.height));
				_position = Math.min(Math.max(_position, _positionMin), _positionMax);
			}
		}
		
		private function limitBarPos():void
		{
			_bar.y = Math.min(Math.max(_bar.y, _arrowSize), _height - _arrowSize - _bar.height);
		}
	}
}