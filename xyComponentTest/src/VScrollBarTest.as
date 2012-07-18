package
{
	import com.yheng.xianyuan.xyComponent.control.VScrollBar;
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import com.codeTooth.actionscript.display.Box;
	
	public class VScrollBarTest extends Sprite
	{
		private var _scrollBar:VScrollBar = null;
		
		public function VScrollBarTest()
		{
			_scrollBar = new VScrollBar();
			addChild(_scrollBar);
			
			_scrollBar.getMinArrow().setOutSkin(new Box(0xFF0000));
			_scrollBar.getMinArrow().setOverSkin(new Box(0xDD0000));
			_scrollBar.getMinArrow().setDownSkin(new Box(0xAA0000));
			_scrollBar.getMinArrow().setDisabledSkin(new Box(0x222222));
			
			_scrollBar.getMaxArrow().setOutSkin(new Box(0x00FF00));
			_scrollBar.getMaxArrow().setOverSkin(new Box(0x00DD00));
			_scrollBar.getMaxArrow().setDownSkin(new Box(0x00AA00));
			_scrollBar.getMaxArrow().setDisabledSkin(new Box(0x333333));
			
			_scrollBar.getTrack().setOutSkin(new Box(0x0000FF));
			_scrollBar.getTrack().setOverSkin(new Box(0x0000DD));
			_scrollBar.getTrack().setDownSkin(new Box(0x0000AA));
			_scrollBar.getTrack().setDisabledSkin(new Box(0x444444));
			
			_scrollBar.getBar().setOutSkin(new Box());
			_scrollBar.getBar().setOverSkin(new Box(0x444444));
			_scrollBar.getBar().setDownSkin(new Box(0x888888));
			_scrollBar.getBar().setDisabledSkin(new Box(0x555555));
			
			_scrollBar.addEventListener(ScrollBarEvent.SCROLL, scrollHandler);
			
			_scrollBar.height = 200;
			_scrollBar.pageSize = 800;
			
			_scrollBar.position = 50;
			
			_scrollBar.positionMax = 200;
			
//			_scrollBar.enabled = false;
			
			addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(event:Event):void
		{
			_scrollBar.setMouseWheelTarget(stage);
		}
		
		private function scrollHandler(event:ScrollBarEvent):void
		{
			trace(event.position);
		}
	}
}