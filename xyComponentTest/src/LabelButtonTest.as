package
{
	import com.yheng.xianyuan.xyComponent.control.LabelButton;
	import com.yheng.xianyuan.xyComponent.core.XYTextField;
	
	import flash.display.Sprite;
	
	public class LabelButtonTest extends Sprite
	{
		public function LabelButtonTest()
		{
			var btn:LabelButton = new LabelButton();
			addChild(btn);
			
			btn.label = "阿斯大声的";
			btn.fontSize = 12;
			btn.stroke = true;
			btn.outColor = 0x0099FF;
			
//			btn.enabled = false;
		}
	}
}