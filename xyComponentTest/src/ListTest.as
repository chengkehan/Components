package
{
	import com.codeTooth.actionscript.display.BoxSimple;
	import com.yheng.xianyuan.xyComponent.control.LabelItemRenderData;
	import com.yheng.xianyuan.xyComponent.control.List;
	import com.yheng.xianyuan.xyComponent.data.DataProvider;
	import com.yheng.xianyuan.xyComponent.data.IDataProvider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ListTest extends Sprite
	{
		private var _list:List = null;
		
		public function ListTest()
		{
			var dataArr:Array = new Array();
			var data:DataProvider = new DataProvider();
			for (var i:int = 0; i < 20; i++) 
			{
				dataArr.push(new LabelItemRenderData(String.fromCharCode(65 + i), 12, 0xFFFFFF, true, 0x000000));
			}
			data.setData(dataArr);
			
			
			_list = new List();
			addChild(_list);
			
			_list.setBackground(new BoxSimple(0x000000, .2));
			
			_list.getScrollBar().getMinArrow().setOutSkin(new BoxSimple(0xFF0000));
			_list.getScrollBar().getMinArrow().setOverSkin(new BoxSimple(0xDD0000));
			_list.getScrollBar().getMinArrow().setDownSkin(new BoxSimple(0xAA0000));
			_list.getScrollBar().getMinArrow().setDisabledSkin(new BoxSimple(0x222222));
			
			_list.getScrollBar().getMaxArrow().setOutSkin(new BoxSimple(0x00FF00));
			_list.getScrollBar().getMaxArrow().setOverSkin(new BoxSimple(0x00DD00));
			_list.getScrollBar().getMaxArrow().setDownSkin(new BoxSimple(0x00AA00));
			_list.getScrollBar().getMaxArrow().setDisabledSkin(new BoxSimple(0x333333));
			
			_list.getScrollBar().getTrack().setOutSkin(new BoxSimple(0x0000FF));
			_list.getScrollBar().getTrack().setOverSkin(new BoxSimple(0x0000DD));
			_list.getScrollBar().getTrack().setDownSkin(new BoxSimple(0x0000AA));
			_list.getScrollBar().getTrack().setDisabledSkin(new BoxSimple(0x444444));
			
			_list.getScrollBar().getBar().setOutSkin(new BoxSimple());
			_list.getScrollBar().getBar().setOverSkin(new BoxSimple(0x444444));
			_list.getScrollBar().getBar().setDownSkin(new BoxSimple(0x888888));
			_list.getScrollBar().getBar().setDisabledSkin(new BoxSimple(0x555555));
			
			_list.setDataProvider(data);
			
			_list.x = 100;
			_list.y = 100;
			_list.getScrollBar().position = .5;
//			_list.height = 500;
			
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			
//			_list.destroy();
//			_list = null;
		}
		
		private function addToStageHandler(event:Event):void
		{
//			stage.addEventListener(MouseEvent.MOUSE_MOVE, stageMouseMoveHandler);
			
			stage.addEventListener(MouseEvent.CLICK, stageClickHandler);
		}
		
		private function stageClickHandler(event:MouseEvent):void
		{
			if(mouseX < 50)
			{
				var newDataProvider:IDataProvider = _list.getDataProvider().clone().reverse();
				_list.setDataProvider(newDataProvider);
			}
			else if(mouseX > stage.stageWidth - 50)
			{
				// Updata
//				var index:int = _list.getDataProvider().length - 1;
//				var data:LabelItemRenderData = _list.getDataProvider().get(index);
//				data.text = "M" + Math.random();
//				_list.getDataProvider().update(index, data);
				
				// Add
//				_list.getDataProvider().push(new LabelItemRenderData("T", 12, 0xFFFFFF * Math.random(), true, 0xFFFFFF * Math.random()));
				// Remove
//				_list.getDataProvider().pop();
				
				// ItemRenderFactory
				_list.setItemRenderFactory(new LabelItemRenderFactory2());
			}
		}
		
		private function stageMouseMoveHandler(event:MouseEvent):void
		{
			_list.height = mouseY - _list.y;
		}
	}
}