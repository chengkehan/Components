package com.yheng.xianyuan.xyComponent.core
{
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	
	import flash.display.DisplayObjectContainer;

	public class XYComponent
	{
		private static var _popUpContainer:DisplayObjectContainer = null;
		
		public static function initialize(popUpContainer:DisplayObjectContainer):void
		{
			if(popUpContainer == null)
			{
				throw new NullPointerException("Null input popUpContainer parameter.");
			}
			
			_popUpContainer = popUpContainer;
		}
		
		public static function getPopUpContainer():DisplayObjectContainer
		{
			return _popUpContainer;
		}
	}
}