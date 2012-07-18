package com.yheng.xianyuan.xyComponent.core
{
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.xyComponent.util.ListenerHandler;
	
	import flash.events.EventDispatcher;
	
	public class XYListener extends EventDispatcher implements IDestroy
	{
		private var _listenerHandler:ListenerHandler = null;
		
		public function XYListener()
		{
			_listenerHandler = new ListenerHandler(this);
		}
		
		public function removeAllEventListeners():void
		{
			_listenerHandler.removeAllListeners();
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean = false):void
		{
			_listenerHandler.addListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			_listenerHandler.removeListener(type, listener, useCapture);
		}
		
		override public function hasEventListener(type:String):Boolean
		{
			return _listenerHandler.hasEventListener(type);
		}
		
		internal_xyComponent function addEventListenerSuper(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference)
		}
		
		internal_xyComponent function removeEventListenerSuper(type:String, listener:Function, useCapture:Boolean = false):void
		{
			super.removeEventListener(type, listener, useCapture);
		}
		
		public function destroy():void
		{
			if(_listenerHandler != null)
			{
				_listenerHandler.destroy();
				_listenerHandler = null;
			}
		}
	}
}