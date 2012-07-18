package
{
	import com.yheng.xianyuan.xyComponent.control.CheckBox;
	import com.yheng.xianyuan.xyComponent.event.ToggleEvent;
	
	import flash.display.Sprite;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class CheckBoxTest extends Sprite
	{
		private var _cbx:CheckBox = null;
		
		public function CheckBoxTest()
		{
			_cbx = new CheckBox();
			_cbx.setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			_cbx.setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			_cbx.setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			_cbx.setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			addChild(_cbx);
			
			_cbx.label = "阿斯顿发送方";
			_cbx.labelColor = 0xFF0000;
			_cbx.labelStroke = true;
			
			_cbx.addEventListener(ToggleEvent.CHANGE, changeHandler);
			
//			_cbx.enabled = false;
		}
		
		private function changeHandler(event:ToggleEvent):void
		{
			trace(event.selected);
		}
	}
}