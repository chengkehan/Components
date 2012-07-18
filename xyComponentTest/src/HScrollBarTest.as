package
{
	import com.yheng.xianyuan.xyComponent.control.HScrollBar;
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class HScrollBarTest extends Sprite
	{
		private var _scrollBar:HScrollBar = null;
		
		public function HScrollBarTest()
		{
			_scrollBar = new HScrollBar();
			addChild(_scrollBar);
			
			_scrollBar.getMinArrow().setOutSkin(new BoxSimple(0xFF0000));
			_scrollBar.getMinArrow().setOverSkin(new BoxSimple(0xDD0000));
			_scrollBar.getMinArrow().setDownSkin(new BoxSimple(0xAA0000));
			_scrollBar.getMinArrow().setDisabledSkin(new BoxSimple(0x222222));
			
			_scrollBar.getMaxArrow().setOutSkin(new BoxSimple(0x00FF00));
			_scrollBar.getMaxArrow().setOverSkin(new BoxSimple(0x00DD00));
			_scrollBar.getMaxArrow().setDownSkin(new BoxSimple(0x00AA00));
			_scrollBar.getMaxArrow().setDisabledSkin(new BoxSimple(0x333333));
			
			_scrollBar.getTrack().setOutSkin(new BoxSimple(0x0000FF));
			_scrollBar.getTrack().setOverSkin(new BoxSimple(0x0000DD));
			_scrollBar.getTrack().setDownSkin(new BoxSimple(0x0000AA));
			_scrollBar.getTrack().setDisabledSkin(new BoxSimple(0x444444));
			
			_scrollBar.getBar().setOutSkin(new BoxSimple());
			_scrollBar.getBar().setOverSkin(new BoxSimple(0x444444));
			_scrollBar.getBar().setDownSkin(new BoxSimple(0x888888));
			_scrollBar.getBar().setDisabledSkin(new BoxSimple(0x555555));
			
			_scrollBar.addEventListener(ScrollBarEvent.SCROLL, scrollHandler);
			
			_scrollBar.width = 200;
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