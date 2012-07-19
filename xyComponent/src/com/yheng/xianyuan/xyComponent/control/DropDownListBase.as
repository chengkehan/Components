package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.yheng.xianyuan.xyComponent.core.XYComponent;
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.data.IDataProvider;
	
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class DropDownListBase extends XYSprite
	{
		protected var _list:List = null;
		
		protected var _down:Button = null;
		
		public function DropDownListBase()
		{
			_width = 100;
			
			_list = new List();
			
			_down = new Button();
			_down.addEventListener(MouseEvent.CLICK, downClickHandler);
			_down.width = _width;
			addChildSuper(_down);
		}
		
		public function getDownButton():Button
		{
			return _down;
		}
		
		public function getList():List
		{
			return _list;
		}
		
		override public function destroy():void
		{
			if(_list != null)
			{
				DestroyUtil.removeChild(_list, XYComponent.getPopUpContainer());
				_list.destroy();
				_list = null;
			}
			_down = null;
			super.destroy();
		}
		
		private function downClickHandler(event:MouseEvent):void
		{
			if(_list.parent == null)
			{
				var data:IDataProvider = _list.getDataProvider();
				if(data != null && data.length != 0)
				{
					DestroyUtil.addChild(_list, XYComponent.getPopUpContainer());
					var rect:Rectangle = getBounds(XYComponent.getPopUpContainer());
					_list.x = rect.x;
					_list.y = rect.y + rect.height;
				}
				else
				{
					DestroyUtil.removeChild(_list, XYComponent.getPopUpContainer());
				}
			}
			else
			{
				DestroyUtil.removeChild(_list, XYComponent.getPopUpContainer());
			}
		}
	}
}