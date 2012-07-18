package
{
	import com.yheng.xianyuan.xyComponent.control.TextInput;
	
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class TextInputTest extends Sprite
	{
		public function TextInputTest()
		{
			var input:TextInput = new TextInput();
			input.setBackground(new BoxSimple(0x0099FF, .2));
			addChild(input);
			
			input.setXYWH(50, 50, 200, 28);
//			input.enabled = false;
		}
	}
}