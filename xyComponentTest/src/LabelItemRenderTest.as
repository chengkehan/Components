package
{
	import com.yheng.xianyuan.xyComponent.control.LabelItemRender;
	import com.yheng.xianyuan.xyComponent.control.LabelItemRenderData;
	
	import flash.display.Sprite;
	
	public class LabelItemRenderTest extends Sprite
	{
		public function LabelItemRenderTest()
		{
			var itemRender:LabelItemRender = new LabelItemRender();
			addChild(itemRender);
			
			itemRender.height = 20;
			var data:LabelItemRenderData = new LabelItemRenderData("阿苏大", 12, 0xFF0000, true, 0x444444);
			itemRender.setData(data);
		}
	}
}