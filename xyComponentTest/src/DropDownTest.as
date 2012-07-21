package
{
	import com.codeTooth.actionscript.display.BoxSimple;
	import com.yheng.xianyuan.xyComponent.control.DropDown;
	import com.yheng.xianyuan.xyComponent.control.LabelItemRenderData;
	import com.yheng.xianyuan.xyComponent.data.DataProvider;
	
	import flash.display.Sprite;
	
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
			
			var dataArr:Array = new Array();
			var data:DataProvider = new DataProvider();
			for (var i:int = 0; i < 20; i++) 
			{
				dataArr.push(new LabelItemRenderData(String.fromCharCode(65 + i), 12, 0xFFFFFF, true, 0x000000));
			}
			data.setData(dataArr);
			
			_dropDown.getList().getScrollBar().getMinArrow().setOutSkin(new BoxSimple(0xFF0000));
			_dropDown.getList().getScrollBar().getMinArrow().setOverSkin(new BoxSimple(0xDD0000));
			_dropDown.getList().getScrollBar().getMinArrow().setDownSkin(new BoxSimple(0xAA0000));
			_dropDown.getList().getScrollBar().getMinArrow().setDisabledSkin(new BoxSimple(0x222222));
			
			_dropDown.getList().getScrollBar().getMaxArrow().setOutSkin(new BoxSimple(0x00FF00));
			_dropDown.getList().getScrollBar().getMaxArrow().setOverSkin(new BoxSimple(0x00DD00));
			_dropDown.getList().getScrollBar().getMaxArrow().setDownSkin(new BoxSimple(0x00AA00));
			_dropDown.getList().getScrollBar().getMaxArrow().setDisabledSkin(new BoxSimple(0x333333));
			
			_dropDown.getList().getScrollBar().getTrack().setOutSkin(new BoxSimple(0x0000FF));
			_dropDown.getList().getScrollBar().getTrack().setOverSkin(new BoxSimple(0x0000DD));
			_dropDown.getList().getScrollBar().getTrack().setDownSkin(new BoxSimple(0x0000AA));
			_dropDown.getList().getScrollBar().getTrack().setDisabledSkin(new BoxSimple(0x444444));
			
			_dropDown.getList().getScrollBar().getBar().setOutSkin(new BoxSimple());
			_dropDown.getList().getScrollBar().getBar().setOverSkin(new BoxSimple(0x444444));
			_dropDown.getList().getScrollBar().getBar().setDownSkin(new BoxSimple(0x888888));
			_dropDown.getList().getScrollBar().getBar().setDisabledSkin(new BoxSimple(0x555555));
			
			_dropDown.getList().setDataProvider(data);
			
//			_dropDown.getList().width = _dropDown.width;
			
			_dropDown.x = 100;
			_dropDown.y = 200;
		}
	}
}