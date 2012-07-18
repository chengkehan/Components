package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.event.ToggleEvent;

	public class ToggleButton extends Button
	{
		protected var _selected:Boolean = false;
		
		protected var _group:ToggleButtonGroup = null;
		
		public function ToggleButton()
		{
		}
		
		public function setGroup(group:ToggleButtonGroup):void
		{
			if(_group != group)
			{
				if(_group != null)
				{
					_group.removeButton(this);
					_group = null;
				}
				if(group != null)
				{
					_group = group;
					_group.addButton(this);
				}
			}
		}
		
		public function getGroup():ToggleButtonGroup
		{
			return _group;
		}
		
		public function set selected(bool:Boolean):void
		{
			if(bool != _selected)
			{
				selectedChange(bool);
			}
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		override protected function mouseOutStateChangeInvoke():void
		{
			if(_selected)
			{
				// Do nothing
			}
			else
			{
				super.mouseOutStateChangeInvoke();
			}
		}
		
		override protected function mouseOverStateChangeInvoke():void
		{
			if(_selected)
			{
				// Do nothing
			}
			else
			{
				super.mouseOverStateChangeInvoke();
			}
		}
		
		override protected function mouseUpStateChangeOverInvoke():void
		{
			if(_selected)
			{
				// Do nothing
			}
			else
			{
				super.mouseUpStateChangeOverInvoke();
			}
		}
		
		override protected function mouseUpStateChangeOutInvoke():void
		{
			if(_selected)
			{
				// Do nothing
			}
			else
			{
				super.mouseUpStateChangeOutInvoke();
			}
		}
		
		override protected function mouseDownStateChangeInvoke():void
		{
			if(!_enabled)
			{
				return;
			}
			
			mouseDownstateChangeInvokeInvoke();
		}
		protected function mouseDownstateChangeInvokeInvoke():void
		{
			selectedChange(!_selected)
		}
		
		internal function selectedChange(bool:Boolean, groupAgainst:Boolean = true):void
		{
			var selectedLast:Boolean = _selected;
			_selected = bool;
			if(_selected)
			{
				state = DOWN_STATE;
			}
			else
			{
				state = OUT_STATE;
			}
			
			if(groupAgainst && _group != null)
			{
				_group.againstOtherButtons(this);
			}
			
			dispatchEvent(new ToggleEvent(ToggleEvent.CHANGE, false, false, _selected, selectedLast));
		}
		
		override public function destroy():void
		{
			setGroup(null);
			super.destroy();
		}
	}
}