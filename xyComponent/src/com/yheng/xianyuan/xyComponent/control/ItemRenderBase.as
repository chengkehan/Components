package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.lang.errors.AbstractError;
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	
	public class ItemRenderBase extends XYSprite
	{
		public function ItemRenderBase()
		{
			
		}
		
		public function setData(data:Object):void
		{
			throw new AbstractError();
		}
	}
}