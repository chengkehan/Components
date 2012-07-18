package
{
	import com.yheng.xianyuan.xyComponent.control.Button;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class ButtonTest extends Sprite
	{
		private var _btn:Button = null;
		
		public function ButtonTest()
		{
			_btn = new Button();
			addChild(_btn);
			
			_btn.setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			_btn.setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			_btn.setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			_btn.setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			_btn.labelStroke = true;
			_btn.labelColor = 0xFF0000;
			_btn.fontSize = 14;
			
			_btn.width = 200;
			_btn.height = 200;
			_btn.addActionListener(btnClickHandler);
			
			_btn.label = "啊十大";
		}
		
		private function btnClickHandler(event:MouseEvent):void
		{
			if(_btn.enabled)
			{
				trace("click");
			}
		}
	}
}