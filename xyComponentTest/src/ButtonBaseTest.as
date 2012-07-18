package
{
	import com.codeTooth.actionscript.display.BoxSimple;
	import com.yheng.xianyuan.xyComponent.control.ButtonBase;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class ButtonBaseTest extends Sprite
	{
		private var _btn:ButtonBase = null;
		
		public function ButtonBaseTest()
		{
			_btn = new ButtonBase();
			addChild(_btn);
			
			_btn.setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			_btn.setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			_btn.setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			_btn.setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			
			_btn.width = 200;
			_btn.height = 200;
			_btn.addActionListener(btnClickHandler);
			
//			_btn.enabled = false;
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