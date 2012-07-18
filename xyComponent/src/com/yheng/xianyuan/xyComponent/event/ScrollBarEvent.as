package com.yheng.xianyuan.xyComponent.event
{
	import flash.events.Event;
	
	public class ScrollBarEvent extends Event
	{
		public static const SCROLL:String = "scroll";
		
		public var position:Number = 0;
		
		public function ScrollBarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, position:Number = 0)
		{
			super(type, bubbles, cancelable);
			this.position = position;
		}
		
		override public function clone():Event
		{
			return new ScrollBarEvent(type, bubbles, cancelable, position);
		}
	}
}