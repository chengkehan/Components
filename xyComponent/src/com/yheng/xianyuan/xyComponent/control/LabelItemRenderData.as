package com.yheng.xianyuan.xyComponent.control
{
	public class LabelItemRenderData
	{
		public var text:String = null;
		
		public var fontSize:uint = 0;
		
		public var textColor:uint = 0;
		
		public var stroke:Boolean = false;
		
		public var strokeColor:uint = 0x000000;
		
		public function LabelItemRenderData(text:String = null, fontSize:uint = 12, textColor:uint = 0xFF0000, stroke:Boolean = false, strokeColor:uint = 0x000000)
		{
			this.text = text;
			this.fontSize = fontSize;
			this.textColor = textColor;
			this.stroke = stroke;
			this.strokeColor = strokeColor;
		}
	}
}