package
{
	import com.yheng.xianyuan.xyComponent.core.XYComponent;
	
	import flash.display.Sprite;
	
	[SWF(width="1000", height="700")]
	public class xyComponentTest extends Sprite
	{
		public function xyComponentTest()
		{
			XYComponent.initialize(this);
			
//			addChild(new ButtonBaseTest());
//			addChild(new ButtonTest());
//			addChild(new TextInputTest());
//			addChild(new LabelButtonTest());
//			addChild(new VScrollBarTest());
//			addChild(new HScrollBarTest());
//			addChild(new ToggleButtonTest());
//			addChild(new CheckBoxTest());
//			addChild(new RadioButtonTest());
//			addChild(new TextAreaTest());
//			addChild(new DataProviderTest());
//			addChild(new LabelItemRenderTest());
//			addChild(new ListTest());
			addChild(new DropDownTest());
		}
	}
}