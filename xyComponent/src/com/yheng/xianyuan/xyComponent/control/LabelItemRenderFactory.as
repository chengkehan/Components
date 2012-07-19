package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.display.BoxSimple;
	
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
	}
}