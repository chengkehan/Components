package com.yheng.xianyuan.xyComponent.event
{
	import flash.events.Event;
	
	public class DataProviderEvent extends Event
	{
		public static const ADD:String = "add";
		
		public static const REMOVE:String = "remove";
		
		public static const UPDATE:String = "update"
		
		public var data:Object = null;
		
		public var index:int = 0;
		
		public function DataProviderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:Object = null, index:int = 0)
		{
			super(type, bubbles, cancelable);
			this.data = data;
			this.index = index;
		}
		
		override public function clone():Event
		{
			return new DataProviderEvent(type, bubbles, cancelable, data, index);
		}
	}
}