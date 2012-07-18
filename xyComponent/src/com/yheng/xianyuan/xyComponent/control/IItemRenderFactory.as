package com.yheng.xianyuan.xyComponent.control
{
	import flash.display.DisplayObject;

	public interface IItemRenderFactory
	{
		function createItemObject():ItemRenderBase;
		
		function createOverObject():DisplayObject;
		
		function createDownObject():DisplayObject;
	}
}