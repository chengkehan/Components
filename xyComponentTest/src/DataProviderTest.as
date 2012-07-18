package
{
	import com.yheng.xianyuan.xyComponent.data.DataProvider;
	import com.yheng.xianyuan.xyComponent.event.DataProviderEvent;
	
	import flash.display.Sprite;
	
	public class DataProviderTest extends Sprite
	{
		private var _dataProvider:DataProvider = null;
		
		public function DataProviderTest()
		{
			_dataProvider = new DataProvider();
			_dataProvider.addEventListener(DataProviderEvent.ADD, addHandler);
			_dataProvider.addEventListener(DataProviderEvent.REMOVE, removeHandler);
			
			_dataProvider.unshift(1);
			_dataProvider.unshift(2);
			_dataProvider.shift();
			_dataProvider.insert(3, 0);
			_dataProvider.remove(1);
			
			_dataProvider.destroy();
		}
		
		private function removeHandler(event:DataProviderEvent):void
		{
			trace("remove", "data:" + event.data, "index:" + event.index, "length:" + _dataProvider.length);
		}
		
		private function addHandler(event:DataProviderEvent):void
		{
			trace("add", event.data, event.index, _dataProvider.length);
		}
	}
}