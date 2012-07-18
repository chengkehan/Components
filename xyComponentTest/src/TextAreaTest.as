package
{
	import com.yheng.xianyuan.xyComponent.control.TextArea;
	
	import flash.display.Sprite;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class TextAreaTest extends Sprite
	{
		public function TextAreaTest()
		{
			var ta:TextArea = new TextArea();
			addChild(ta);
			
			ta.getScrollBar().getMinArrow().setOutSkin(new BoxSimple(0xFF0000));
			ta.getScrollBar().getMinArrow().setOverSkin(new BoxSimple(0xDD0000));
			ta.getScrollBar().getMinArrow().setDownSkin(new BoxSimple(0xAA0000));
			ta.getScrollBar().getMinArrow().setDisabledSkin(new BoxSimple(0x222222));
			
			ta.getScrollBar().getMaxArrow().setOutSkin(new BoxSimple(0x00FF00));
			ta.getScrollBar().getMaxArrow().setOverSkin(new BoxSimple(0x00DD00));
			ta.getScrollBar().getMaxArrow().setDownSkin(new BoxSimple(0x00AA00));
			ta.getScrollBar().getMaxArrow().setDisabledSkin(new BoxSimple(0x333333));
			
			ta.getScrollBar().getTrack().setOutSkin(new BoxSimple(0x0000FF));
			ta.getScrollBar().getTrack().setOverSkin(new BoxSimple(0x0000DD));
			ta.getScrollBar().getTrack().setDownSkin(new BoxSimple(0x0000AA));
			ta.getScrollBar().getTrack().setDisabledSkin(new BoxSimple(0x444444));
			
			ta.getScrollBar().getBar().setOutSkin(new BoxSimple());
			ta.getScrollBar().getBar().setOverSkin(new BoxSimple(0x444444));
			ta.getScrollBar().getBar().setDownSkin(new BoxSimple(0x888888));
			ta.getScrollBar().getBar().setDisabledSkin(new BoxSimple(0x555555));
			
			ta.setBackground(new BoxSimple(0x0099FF, .4));
			
			ta.textColor = 0xFF0000;
		}
	}
}