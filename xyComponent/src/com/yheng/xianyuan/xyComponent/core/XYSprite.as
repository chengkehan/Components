package com.yheng.xianyuan.xyComponent.core
{
	import com.codeTooth.actionscript.lang.errors.AbstractError;
	import com.codeTooth.actionscript.lang.exceptions.IllegalOperationException;
	import com.codeTooth.actionscript.lang.exceptions.UnsupportedException;
	import com.codeTooth.actionscript.lang.utils.destroy.IDestroy;
	import com.yheng.xianyuan.xyComponent.util.ListenerHandler;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class XYSprite extends Sprite implements IDestroy
	{
		public function XYSprite()
		{
			tabChildrenSuper = false;
			tabEnabledSuper = false;
			initializeListener();
			
			if(XYComponent.getPopUpContainer() == null)
			{
				addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			}
		}
		
		private function addToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			XYComponent.initialize(stage);
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Enabled
		//------------------------------------------------------------------------------------------------------------------------------
		
		protected var _enabled:Boolean = true;
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void
		{
			if(value != _enabled)
			{
				_enabled = value;
				redraw();
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Listener
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _listenerHandler:ListenerHandler = null;
		
		public function addActionListener(listener:Function):void
		{
			throw new UnsupportedException();
		}
		
		public function removeActionListener(listener:Function):void
		{
			throw new UnsupportedException();
		}
		
		private function initializeListener():void
		{
			_listenerHandler = new ListenerHandler(this);
		}
		
		private function destroyListener():void
		{
			if(_listenerHandler != null)
			{
				_listenerHandler.destroy();
				_listenerHandler = null;
			}
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

		//------------------------------------------------------------------------------------------------------------------------------
		// XYWH
		//------------------------------------------------------------------------------------------------------------------------------
		
		protected var _width:Number = 0;
		
		protected var _height:Number = 0;

		public function setWH(width:Number, height:Number):void
		{
			this.width = width;
			this.height = height;
		}
		
		public function setXY(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function setXYWH(x:Number, y:Number, width:Number, height:Number):void
		{
			setXY(x, y);
			setWH(width, height);
		}
		
		override public function get width():Number
		{
			return _width;
		}

		override public function set width(value:Number):void
		{
			if(value != _width)
			{
				_width = value;
				redraw();
			}
		}

		override public function get height():Number
		{
			return _height;
		}

		override public function set height(value:Number):void
		{
			if(value != _height)
			{
				_height = value;
				redraw();
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// KeyboardInteractive
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function set tabEnabled(enabled:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		protected function set tabEnabledSuper(enanbled:Boolean):void
		{
			super.tabEnabled = enanbled;
		}
		
		override public function set tabChildren(enabled:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		protected function set tabChildrenSuper(enanbled:Boolean):void
		{
			super.tabChildren = enanbled;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// MouseInteractive
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function set mouseEnabled(enabled:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		override public function set mouseChildren(enable:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		protected function set mouseChildrenSuper(value:Boolean):void
		{
			super.mouseChildren = value;
		}
		
		protected function set mouseEnabledSuper(value:Boolean):void
		{
			super.mouseEnabled = value;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Children
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			throw new UnsupportedException();
			return null;
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			throw new UnsupportedException();
			return null;
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			throw new UnsupportedException();
			return null;
		}
		
		override public function removeChildAt(index:int):DisplayObject
		{
			throw new UnsupportedException();
			return null;
		}
		
		override public function setChildIndex(child:DisplayObject, index:int):void
		{
			throw new UnsupportedException();
			return null;
		}
		
		protected function addChildSuper(child:DisplayObject):DisplayObject
		{
			return super.addChild(child);
		}
		
		protected function addChildSuperEx(child:DisplayObject):void
		{
			if(child.parent != this)
			{
				addChildSuper(child);
			}
		}
		
		protected function addChildAtSuper(child:DisplayObject, index:int):DisplayObject
		{
			return super.addChildAt(child, index);
		}
		
		protected function removeChildSuper(child:DisplayObject):DisplayObject
		{
			return super.removeChild(child);
		}
		
		protected function removeChildSuperEx(child:DisplayObject):void
		{
			if(child.parent == this)
			{
				removeChildSuper(child);
			}
		}
		
		protected function removeChildAtSuper(index:int):DisplayObject
		{
			return super.removeChildAt(index);
		}
		
		protected function setChildIndexSuper(child:DisplayObject, index:int):void
		{
			super.setChildIndex(child, index);
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Refresh
		//------------------------------------------------------------------------------------------------------------------------------
		
		protected function redraw():void
		{
			throw new AbstractError();
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// IDestroy
		//------------------------------------------------------------------------------------------------------------------------------
		
		public function destroy():void
		{
			removeChildren();
			
			if(parent != null)
			{
				parent.removeChild(this);
			}
			
			destroyListener();
		}
		
		private function removeChildren():void
		{
			var length:int = numChildren;
			for (var i:int = numChildren - 1; i >= 0; --i)
			{
				var obj:DisplayObject = removeChildAtSuper(i);
				if(obj is XYSprite)
				{
					XYSprite(obj).destroy();
				}
			}
		}
	}
}