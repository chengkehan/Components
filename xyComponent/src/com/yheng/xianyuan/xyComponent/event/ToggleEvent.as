package com.yheng.xianyuan.xyComponent.event
{
	import flash.events.Event;
	
	public class ToggleEvent extends Event
	{
		public static const CHANGE:String = "change";
		
		public var selectedLast:Boolean = false;
		
		public var selected:Boolean = false;
		
		public function ToggleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, selected:Boolean = false, selectedLaset:Boolean = false)
		{
			super(type, bubbles, cancelable);
			this.selected = selected;
			this.selectedLast = selectedLaset;
		}
		
		override public function clone():Event
		{
			return new ToggleEvent(type, bubbles, cancelable, selected, selectedLast);
		}
	}
}