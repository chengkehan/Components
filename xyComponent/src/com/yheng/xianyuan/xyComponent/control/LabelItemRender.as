package com.yheng.xianyuan.xyComponent.control
{
	import com.yheng.xianyuan.xyComponent.core.XYTextField;
	import com.codeTooth.actionscript.lang.exceptions.UnknownTypeException;

	public class LabelItemRender extends ItemRenderBase
	{
		private var _label:XYTextField = null;
		
		public function LabelItemRender()
		{
			_label = new XYTextField();
			_label.mouseEnabled = false;
			addChildSuper(_label);
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
				_label.text = "";
			}
			else
			{
				_label.text = data.text;
				_label.fontSize = data.fontSize;
				_label.textColor = data.textColor;
				_label.stroke = data.stroke;
				_label.strokeColor = data.strokeColor;
			}
			
			redraw();
		}
		
		override protected function redraw():void
		{
			_label.x = 4;
			_label.y = (_height - _label.height) * .5;
		}
		
		override public function destroy():void
		{
			_label = null;
			super.destroy();
		}
	}
}