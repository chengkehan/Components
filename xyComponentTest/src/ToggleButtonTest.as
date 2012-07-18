package
{
	import com.yheng.xianyuan.xyComponent.control.ToggleButton;
	import com.yheng.xianyuan.xyComponent.event.ToggleEvent;
	
	import flash.display.Sprite;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class ToggleButtonTest extends Sprite
	{
		private var _btn:ToggleButton = null;
		
		public function ToggleButtonTest()
		{
			_btn = new ToggleButton();
			addChild(_btn);
			
			_btn.setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			_btn.setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			_btn.setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			_btn.setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			
			_btn.addEventListener(ToggleEvent.CHANGE, changeHandler);
			
//			_btn.enabled = false;
		}
		
		private function changeHandler(event:ToggleEvent):void
		{
			trace(event.selected);
		}
	}
}