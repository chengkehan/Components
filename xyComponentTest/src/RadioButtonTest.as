package
{
	import com.yheng.xianyuan.xyComponent.control.RadioButton;
	import com.yheng.xianyuan.xyComponent.control.ToggleButtonColorLabelGroup;
	import com.yheng.xianyuan.xyComponent.control.ToggleButtonGroup;
	import com.yheng.xianyuan.xyComponent.event.ToggleEvent;
	
	import flash.display.Sprite;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class RadioButtonTest extends Sprite
	{
		public function RadioButtonTest()
		{
			createRadioButton(0, 0);
			createRadioButton(0, 30).selected = true;
			createRadioButton(0, 60);
			createRadioButton(0, 90);
			
			var group:ToggleButtonColorLabelGroup = new ToggleButtonColorLabelGroup();
			group.normalLabelColor = 0x00FF00;
			createRadioButton(200, 0, group);
			createRadioButton(200, 30, group);
			createRadioButton(200, 60, group).selected = true;
			createRadioButton(200, 90, group);
		}
		
		private function createRadioButton(x:int, y:int, group:ToggleButtonGroup = null):RadioButton
		{
			var rb:RadioButton = new RadioButton();
			rb.setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			rb.setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			rb.setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			rb.setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			addChild(rb);
			
			rb.label = "阿斯顿发送方";
			rb.labelColor = 0xFF0000;
			rb.labelStroke = true;
			
			rb.x = x;
			rb.y = y;
			
			if(group != null)
			{
				rb.setGroup(group);
			}
			
			rb.addEventListener(ToggleEvent.CHANGE, changeHandler);
			
			return rb;
		}
		
		private function changeHandler(event:ToggleEvent):void
		{
			trace(event.selected, event.selectedLast);
		}
	}
}