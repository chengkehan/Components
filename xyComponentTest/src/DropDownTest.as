package
{
	import com.yheng.xianyuan.xyComponent.control.DropDown;
	
	import flash.display.Sprite;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class DropDownTest extends Sprite
	{
		private var _dropDown:DropDown = null;
		
		public function DropDownTest()
		{
			_dropDown = new DropDown();
			addChild(_dropDown);
			
			_dropDown.getDownButton().setOutSkin(new BoxSimple(0x0099FF, 1, 20, 20));
			_dropDown.getDownButton().setOverSkin(new BoxSimple(0x0099FF, .6, 20, 20));
			_dropDown.getDownButton().setDownSkin(new BoxSimple(0x0099FF, .2, 20, 20));
			_dropDown.getDownButton().setDisabledSkin(new BoxSimple(0x666666, .4, 20, 20));
			
			_dropDown.getList().setBackground(new BoxSimple(0x000000, .2));
		}
	}
}