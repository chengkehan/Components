package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.data.IDataProvider;
	
	import flash.events.MouseEvent;
	
	public class DropDownListBase extends XYSprite
	{
		protected var _list:List = null;
		
		protected var _down:Button = null;
		
		public function DropDownListBase()
		{
			_list = new List();
			_down = new Button();
			_down.addEventListener(MouseEvent.CLICK, downClickHandler);
		}
		
		public function getList():List
		{
			return _list;
		}
		
		override public function destroy():void
		{
			_list = null;
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
					addChildSuperEx(_list);
					_list.y = _down.height;
				}
				else
				{
					removeChildSuperEx(_list);
				}
			}
			else
			{
				removeChildSuperEx(_list);
			}
		}
	}
}