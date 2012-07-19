package
{
	import com.codeTooth.actionscript.lang.exceptions.UnknownTypeException;
	import com.yheng.xianyuan.xyComponent.control.ItemRenderBase;
	import com.yheng.xianyuan.xyComponent.control.LabelItemRenderData;
	import com.yheng.xianyuan.xyComponent.control.RadioButton;
	import com.yheng.xianyuan.xyComponent.core.XYTextField;
	import com.codeTooth.actionscript.display.BoxSimple;
	
	public class LabelItemRender2 extends ItemRenderBase
	{
		private var _rb:RadioButton = null;
		
		public function LabelItemRender2()
		{
			_rb = createRadioButton();
			addChildSuper(_rb);
		}
		
		override public function setData(pData:Object):void
		{
			if(!(pData is LabelItemRenderData))
			{
				throw new UnknownTypeException("Unknown input pData parameter type.");
			}
			
			var data:LabelItemRenderData = LabelItemRenderData(pData);
			if(data == null)
			{
				_rb.label = "";
			}
			else
			{
				_rb.label = data.text;
				_rb.fontSize = data.fontSize;
				_rb.labelColor = data.textColor;
				_rb.labelStroke = data.stroke;
				_rb.labelStrokeColor = data.strokeColor;
			}
			
			redraw();
		}
		
		override protected function redraw():void
		{
			_rb.x = 4;
			_rb.y = (_height - _rb.height) * .5;
		}
		
		override public function destroy():void
		{
			_rb = null;
			super.destroy();
		}
		
		private function createRadioButton():RadioButton
		{
			var rb:RadioButton = new RadioButton();
			rb.setOutSkin(new BoxSimple(0x0099FF, 1, 10, 10));
			rb.setOverSkin(new BoxSimple(0x0099FF, .6, 10, 20));
			rb.setDownSkin(new BoxSimple(0x0099FF, .2, 10, 10));
			rb.setDisabledSkin(new BoxSimple(0x666666, .4, 10, 10));
			rb.width = 15;
			rb.height = 15;
			
			return rb;
		}
	}
}