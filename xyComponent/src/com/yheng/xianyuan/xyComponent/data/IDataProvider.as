package com.yheng.xianyuan.xyComponent.data
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	
	import flash.events.IEventDispatcher;
	
	public interface IDataProvider extends IEventDispatcher, IDestroy
	{
		function get length():int;
		
		function get(index:int):*;
			
		function update(index:int, data:Object):void;
		
		function push(data:Object):void;
		
		function pop():*;
		
		function shift():*;
		
		function unshift(data:Object):void;
		
		function remove(index:int):*;
		
		function insert(data:Object, index:int):void;
		
		function reverse():IDataProvider;
		
		function clone():IDataProvider;
	}
}