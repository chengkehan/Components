package com.yheng.xianyuan.xyComponent.control
{
	import flash.display.DisplayObject;
	
	public class LabelItemRenderFactory implements IItemRenderFactory
	{
		public function LabelItemRenderFactory()
		{
		}
		
		public function createItemObject():ItemRenderBase
		{
			return new LabelItemRender();
		}
		
		public function createOverObject():DisplayObject
		{
			return null;
		}
		
		public function createDownObject():DisplayObject
		{
			return null;
		}
	}
}