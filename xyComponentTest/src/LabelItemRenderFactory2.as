package
{
	import com.yheng.xianyuan.xyComponent.control.IItemRenderFactory;
	import com.yheng.xianyuan.xyComponent.control.ItemRenderBase;
	
	import flash.display.DisplayObject;
	
	public class LabelItemRenderFactory2 implements IItemRenderFactory
	{
		public function LabelItemRenderFactory2()
		{
		}
		
		public function createItemObject():ItemRenderBase
		{
			return new LabelItemRender2();
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