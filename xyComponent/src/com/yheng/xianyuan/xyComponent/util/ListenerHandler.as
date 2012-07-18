package com.yheng.xianyuan.xyComponent.util
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.xyComponent.core.internal_xyComponent;

	public class ListenerHandler implements IDestroy
	{
		private var _target:Object = null;
		
		private var _items:Vector.<Item> = null;
		
		public function ListenerHandler(target:Object)
		{
			if(target == null)
			{
				throw new NullPointerException("Null input target parameter.");
			}
			
			_target = target;
			_items = new Vector.<Item>();
		}
		
		public function getTarget():Object
		{
			return _target;
		}
		
		public function addListener(type:String, listener:Function, useCapture:Boolean, priority:int = 0, useWeakReference:Boolean = false):void
		{
			var item:Item = new Item();
			item.type = type;
			item.listener = listener;
			item.useCapture = useCapture;
			_items.push(item);
			_target.internal_xyComponent::addEventListenerSuper(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeListener(type:String, listener:Function, useCapture:Boolean = false):Boolean
		{
			var length:uint = _items.length;
			for (var i:int = 0; i < length; i++) 
			{
				var item:Item = _items[i];
				if(item.type == type && item.listener == listener && item.useCapture == useCapture)
				{
					_target.internal_xyComponent::removeEventListenerSuper(item.type, item.listener, item.useCapture);
					item.destroy();
					_items.splice(i, 1);
					return true;
				}
			}
			
			return false;
		}
		
		public function hasEventListener(type:String):Boolean
		{
			for each(var item:Item in _items)
			{
				if(item.type == type)
				{
					return true;
				}
			}
			
			return false;
		}
		
		public function removeAllListeners():void
		{
			for each(var item:Item in _items)
			{
				_target.internal_xyComponent::removeEventListenerSuper(item.type, item.listener, item.useCapture);
			}
			DestroyUtil.destroyVector(_items);
		}
		
		
		public function destroy():void
		{
			if(_items != null)
			{
				removeAllListeners();
				_items = null;
				_target = null;
			}
		}
	}
}


import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;

class Item implements IDestroy
{
	public var type:String = null;
	
	public var listener:Function = null;
	
	public var useCapture:Boolean = false;
	
	public function destroy():void
	{
		type = null;
		listener = null;
	}
}