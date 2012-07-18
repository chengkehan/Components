package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import com.codeTooth.actionscript.lang.exceptions.UnsupportedException;
	
	public class ButtonBase extends XYSprite
	{
		public function ButtonBase()
		{
			mouseChildrenSuper = false;
			_width = 100;
			_height = 24;
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			
			useHandCursorSuper = true;
			buttonModeSuper = true;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// HandCursor
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function set useHandCursor(value:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		protected function set useHandCursorSuper(value:Boolean):void
		{
			super.useHandCursor = value;
		}
		
		override public function set buttonMode(value:Boolean):void
		{
			throw new UnsupportedException();
		}
		
		protected function set buttonModeSuper(value:Boolean):void
		{
			super.buttonMode = value;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// State
		//------------------------------------------------------------------------------------------------------------------------------
		
		protected const OUT_STATE:int = 1;
		
		protected const OVER_STATE:int = 2;
		
		protected const DOWN_STATE:int = 3;
		
		protected const DISABLED_STATE:int = 4;
		
		protected var _state:int = OUT_STATE;
		
		private var _stage:Stage = null;
		
		protected function set state(value:int):void
		{
			_state = value;
			redraw();
		}
		
		protected function get state():int
		{
			return _state;
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Listener
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function addActionListener(listener:Function):void
		{
			addEventListener(MouseEvent.CLICK, listener);
		}
		
		override public function removeActionListener(listener:Function):void
		{
			removeEventListener(MouseEvent.CLICK, listener);
		}
		
		private function mouseOutHandler(event:MouseEvent):void
		{
			mouseOutStateChangeInvoke();
		}
		protected function mouseOutStateChangeInvoke():void
		{
			state = OUT_STATE;
		}
		
		private function mouseOverHandler(event:MouseEvent):void
		{
			mouseOverStateChangeInvoke();
		}
		protected function mouseOverStateChangeInvoke():void
		{
			state = OVER_STATE;
		}
		
		private function mouseUpHandler(event:MouseEvent):void
		{
			removeStageListener();
			if(_overSkin == null)
			{
				mouseUpStateChangeOutInvoke();
			}
			else
			{
				if(_overSkin.getBounds(this).contains(mouseX, mouseY))
				{
					mouseUpStateChangeOverInvoke();
				}
				else
				{
					mouseUpStateChangeOutInvoke();
				}
			}
		}
		protected function mouseUpStateChangeOverInvoke():void
		{
			state = OVER_STATE;
		}
		protected function mouseUpStateChangeOutInvoke():void
		{
			state = OUT_STATE;
		}
		
		private function mouseDownHandler(event:MouseEvent):void
		{
			mouseDownStateChangeInvoke();
			
			if(stage != null && _stage == null)
			{
				_stage = stage;
				_stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			}
		}
		protected function mouseDownStateChangeInvoke():void
		{
			state = DOWN_STATE;
		}
		
		private function removeStageListener():void
		{
			if(_stage != null)
			{
				_stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
				_stage = null;
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Skin
		//------------------------------------------------------------------------------------------------------------------------------
		
		private var _outSkin:DisplayObject = null;
		
		private var _overSkin:DisplayObject = null;
		
		private var _downSkin:DisplayObject = null;
		
		private var _disabledSkin:DisplayObject = null;
		
		private var _currSkin:DisplayObject = null;
		
		public function getOutSkin():DisplayObject
		{
			return _outSkin;
		}

		public function setOutSkin(value:DisplayObject):void
		{
			_outSkin = value;
			redraw();
		}

		public function getOverSkin():DisplayObject
		{
			return _overSkin;
		}

		public function setOverSkin(value:DisplayObject):void
		{
			_overSkin = value;
			redraw();
		}

		public function getDownSkin():DisplayObject
		{
			return _downSkin;
		}

		public function setDownSkin(value:DisplayObject):void
		{
			_downSkin = value;
			redraw()
		}

		public function getDisabledSkin():DisplayObject
		{
			return _disabledSkin;
		}

		public function setDisabledSkin(value:DisplayObject):void
		{
			_disabledSkin = value;
			redraw()
		}
		
		private function setCurrSkin(value:DisplayObject):void
		{
			if(_currSkin != null)
			{
				if(_currSkin.parent == this)
				{
					removeChildSuper(_currSkin);
				}
				_currSkin = null;
			}
			if(value != null)
			{
				_currSkin = value;
				addChildSuper(_currSkin);
			}
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// Refresh
		//------------------------------------------------------------------------------------------------------------------------------
		
		override protected function redraw():void
		{
			if(_outSkin != null)
			{
				_outSkin.width = _width;
				_outSkin.height = _height;
			}
			if(_overSkin != null)
			{
				_overSkin.width = _width;
				_overSkin.height = _height;
			}
			if(_downSkin != null)
			{
				_downSkin.width = _width;
				_downSkin.height = _height;
			}
			if(_disabledSkin != null)
			{
				_disabledSkin.width = _width;
				_disabledSkin.height = _height;
			}
			
			var skin:DisplayObject = 
				enabled ? 
				(
					_state == OUT_STATE ? _outSkin : 
					_state == OVER_STATE ? _overSkin : 
					_state == DOWN_STATE ? _downSkin : 
					_state == DISABLED_STATE ? _disabledSkin : null
				) : _disabledSkin;
			setCurrSkin(skin);
		}
		
		//------------------------------------------------------------------------------------------------------------------------------
		// IDestroy
		//------------------------------------------------------------------------------------------------------------------------------
		
		override public function destroy():void
		{
			_currSkin = null;
			removeStageListener();
			super.destroy();
		}
	}
}