package com.yheng.xianyuan.xyComponent.data
{
	import com.codeTooth.actionscript.lang.exceptions.IllegalOperationException;
	import com.codeTooth.actionscript.lang.exceptions.IndexOutOfBoundsException;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.yheng.xianyuan.xyComponent.core.XYListener;
	import com.yheng.xianyuan.xyComponent.event.DataProviderEvent;

	public class DataProvider extends XYListener implements IDataProvider
	{
		private var _list:Vector.<Object> = null;
		
		private var _length:int = 0;
		
		public function DataProvider(data:Array = null)
		{
			_list = new Vector.<Object>();
			setData(data);
		}
		
		public function setData(data:Array):void
		{
			if(data != null)
			{
				_length = data.length;
				for each(var item:Object in data)
				{
					_list.push(item);
				}
			}
			else
			{
				_length = 0;
				DestroyUtil.breakVector(_list);
			}
		}
		
		public function getData():Array
		{
			var data:Array = new Array();
			for each(var item:Object in _list)
			{
				data.push(item);
			}
			
			return data;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function get(index:int):*
		{
			checkIndexOutOfBoundsException(index, 0, _length, true);
			
			return _list[index];
		}
		
		public function update(index:int, data:Object):void
		{
			checkIndexOutOfBoundsException(index, 0, _length, true);
			
			_list[index] = data;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.UPDATE, false, false, data, index));
		}
		
		public function push(data:Object):void
		{
			_list.push(data);
			++_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.ADD, false, false, data, _length - 1));
		}
		
		public function pop():*
		{
			if(_length == 0)
			{
				throw new IllegalOperationException("Data Empty.");
			}
			
			var data:Object = _list.pop();
			--_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.REMOVE, false, false, data, _length));
			return data;
		}
		
		public function shift():*
		{
			if(_length == 0)
			{
				throw new IllegalOperationException("Data Empty.");
			}
			
			var data:Object = _list.shift();
			--_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.REMOVE, false, false, data, 0));
			return data;
		}
		
		public function unshift(data:Object):void
		{
			_list.unshift(data);
			++_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.ADD, false, false, data, 0));
		}
		
		public function remove(index:int):*
		{
			if(index < 0 || index >= _length)
			{
				throw new IndexOutOfBoundsException("Index \"" + index + "\" out of bounds [" + 0 + "-" + _length + ")");
			}
			
			var data:Object = _list.splice(index, 1)[0];
			--_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.REMOVE, false, false, data, index));
			return data;
		}
		
		public function insert(data:Object, index:int):void
		{
			checkIndexOutOfBoundsException(index, 0, _length, false);
			
			_list.splice(index, 0, data);
			++_length;
			dispatchEvent(new DataProviderEvent(DataProviderEvent.ADD, false, false, data, index));
		}
		
		public function reverse():IDataProvider
		{
			_list.reverse();
			return this;
		}
		
		public function clone():IDataProvider
		{
			var newDataProvider:DataProvider = new DataProvider();
			newDataProvider._list = _list.concat();
			newDataProvider._length = _length;
			
			return newDataProvider;
		}
		
		override public function destroy():void
		{
			DestroyUtil.breakVector(_list);
			_list = null;
			_length = 0;
			
			super.destroy();
		}
		
		private function checkIndexOutOfBoundsException(index:int, from:int, to:int, toOpen:Boolean):void
		{
			if(toOpen)
			{
				if(index < from || index >= to)
				{
					throw new IndexOutOfBoundsException("Index \"" + index + "\" out of bounds [" + from + "-" + to + ")");
				}
			}
			else
			{
				if(index < from || index > to)
				{
					throw new IndexOutOfBoundsException("Index \"" + index + "\" out of bounds [" + from + "-" + to + "]");
				}
			}
		}
	}
}