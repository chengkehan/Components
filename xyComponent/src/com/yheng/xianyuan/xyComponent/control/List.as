package com.yheng.xianyuan.xyComponent.control
{
	import com.codeTooth.actionscript.display.Box;
	import com.codeTooth.actionscript.lang.exceptions.IllegalParameterException;
	import com.codeTooth.actionscript.lang.exceptions.NullPointerException;
	import com.codeTooth.actionscript.lang.utils.destroy.DestroyUtil;
	import com.yheng.xianyuan.xyComponent.core.XYSprite;
	import com.yheng.xianyuan.xyComponent.data.IDataProvider;
	import com.yheng.xianyuan.xyComponent.event.DataProviderEvent;
	import com.yheng.xianyuan.xyComponent.event.ScrollBarEvent;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class List extends XYSprite
	{
		private const MIN_SIZE:Number = 80;
		
		private var _background:DisplayObject = null;
		
		private var _itemRenderFactory:IItemRenderFactory = null;
		
		private var _itemHeight:Number = 20;
		
		private var _dataProvider:IDataProvider = null;
		
		private var _items:Vector.<ItemRenderBase> = null;
		
		private var _itemsContainer:DisplayObjectContainer = null;
		
		private var _scrollBar:VScrollBar = null;
		
		private var _mask:Box = null;
		
		public function List()
		{
			_width =  180;
			_height = 180;
			_items = new Vector.<ItemRenderBase>();
			_itemsContainer = new Sprite();
			_itemRenderFactory = new LabelItemRenderFactory();
			addChildSuper(_itemsContainer);
			
			_scrollBar = new VScrollBar();
			_scrollBar.positionMin = 0;
			_scrollBar.positionMax = 1;
			_scrollBar.setMouseWheelTarget(this);
			_scrollBar.addEventListener(ScrollBarEvent.SCROLL, scrollHandler);
			
			_mask = new Box();
			_mask.width = _width;
			_mask.height = _height;
			addChildSuper(_mask);
			_itemsContainer.mask = _mask;
		}
		
		public function getScrollBar():ScrollBarBase
		{
			return _scrollBar;
		}
		
		public function setDataProvider(data:IDataProvider):void
		{
			if(_dataProvider != data)
			{
				disposeDataProvider();
				disposeItems();
				refreshItemsContainerScrollPos(0);
				_dataProvider = data;
				if(_dataProvider != null)
				{
					_dataProvider.addEventListener(DataProviderEvent.ADD, dataProviderAddHandler);
					_dataProvider.addEventListener(DataProviderEvent.REMOVE, dataProviderRemoveHandler);
					_dataProvider.addEventListener(DataProviderEvent.UPDATE, dataProviderUpdateHandler);
					
					createItems();
					refreshAll();
				}
			}
		}
		
		public function getDataProvider():IDataProvider
		{
			return _dataProvider;
		}
		
		public function set itemHeight(value:Number):void
		{
			if(value == 0)
			{
				throw new IllegalParameterException("Illegal itemHeight value \"" + value + "\"");
			}
			
			if(_itemHeight != value)
			{
				_itemHeight = value;
				refreshItemHeight();
				refreshItemVisible();
			}
		}
		
		public function get itemHeight():Number
		{
			return _itemHeight;
		}
		
		public function setItemRenderFactory(value:IItemRenderFactory):void
		{
			if(value == null)
			{
				throw new NullPointerException("Null input ItemRenderFactory parameter.");
			}
			
			if(value != _itemRenderFactory)
			{
				disposeItems();
				refreshItemsContainerScrollPos(0);
				_itemRenderFactory = value;
				createItems();
				refreshAll();
			}
		}
		
		public function getItemRenderFactory():IItemRenderFactory
		{
			return _itemRenderFactory;
		}
		
		public function setBackground(value:DisplayObject):void
		{
			if(_background != null)
			{
				if(_background.parent == this)
				{
					removeChildSuper(_background);
				}
				_background = null;
			}
			if(value != null)
			{
				_background = value;
				redraw();
			}
		}
		
		public function getBackground():DisplayObject
		{
			return _background;
		}
		
		override public function set width(value:Number):void
		{
			if(value >= MIN_SIZE)
			{
				super.width = value;
			}
		}
		
		override public function set height(value:Number):void
		{
			if(value >= MIN_SIZE)
			{
				super.height = value;
				refreshItemsContainerScrollPos(_scrollBar.position);
			}
		}
		
		override public function destroy():void
		{
			if(_scrollBar != null && _scrollBar.parent == null)
			{
				_scrollBar.removeEventListener(ScrollBarEvent.SCROLL, scrollHandler);
				_scrollBar.destroy();
				_scrollBar = null;
			}
			
			if(_itemsContainer != null)
			{
				_itemsContainer.mask = null;
				_itemsContainer = null;
			}
			
			_mask = null;
			_background = null;
			disposeItems();
			_items = null;
			disposeDataProvider();
			super.destroy();
		}
		
		override protected function redraw():void
		{
			if(_background != null)
			{
				_background.width = _width;
				_background.height = _height;
				addChildAtSuper(_background, 0);
			}
			
			_mask.width = _width;
			_mask.height = _height;
			
			refreshItemVisible();
			refreshScrollBar();
		}
		
		private function get containerHeight():Number
		{
			return _items.length * _itemHeight;
		}
		
		private function set itemsContainerY(value:Number):void
		{
			_itemsContainer.y = value;
		}
		
		private function get itemsContainerY():Number
		{
			return _itemsContainer.y;
		}
		
		private function refreshItemHeight():void
		{
			var itemSize:int = _items.length;
			for (var i:int = 0; i < itemSize; i++) 
			{
				var item:ItemRenderBase = _items[i];
				item.y = i * _itemHeight;
				item.height = _itemHeight;
			}
		}
		
		private function refreshItemVisible():void
		{
			var itemSize:int = _items.length;
			var fromIndex:int = (-itemsContainerY) / _itemHeight;
			var toIndex:int = (-itemsContainerY + _height) / _itemHeight;
			for (var i:int = 0; i < itemSize; i++) 
			{
				var item:ItemRenderBase = _items[i];
				if(i >= fromIndex && i <= toIndex)
				{
					if(item.parent == null)
					{
						_itemsContainer.addChild(item);
					}
				}
				else
				{
					if(item.parent != null)
					{
						_itemsContainer.removeChild(item);
					}
				}
			}
		}
		
		private function refreshScrollBar():void
		{
			if(containerHeight > _height)
			{
				if(_scrollBar.parent == null)
				{
					addChildSuper(_scrollBar);
				}
				_scrollBar.height = _height;
				_scrollBar.x = _width;
				_scrollBar.pageSize = containerHeight;
			}
			else
			{
				if(_scrollBar.parent != null)
				{
					removeChildSuper(_scrollBar);
				}
			}
		}
		
		private function refreshAll():void
		{
			refreshItemHeight();
			refreshItemVisible();
			refreshScrollBar();
			refreshItemsContainerScrollPos(_scrollBar.position);
		}
		
		private function scrollHandler(event:ScrollBarEvent):void
		{
			refreshItemsContainerScrollPos(event.position);
		}
		
		private function refreshItemsContainerScrollPos(position:Number):void
		{
			if(containerHeight >= _height)
			{
				itemsContainerY = -(containerHeight - _height) * position;
				refreshItemVisible();
			}
			else
			{
				itemsContainerY = 0;
			}
		}
		
		private function dataProviderAddHandler(event:DataProviderEvent):void
		{
			_items.splice(event.index, 0, createItem(event.data));
			refreshAll();
		}
		
		private function dataProviderRemoveHandler(event:DataProviderEvent):void
		{
			_items.splice(event.index, 1)[0].dispose();
			refreshAll();
		}
		
		private function dataProviderUpdateHandler(event:DataProviderEvent):void
		{
			_items[event.index].setData(event.data);
		}
		
		private function createItems():void
		{
			var dataSize:int = _dataProvider.length;
			for (var i:int = 0; i < dataSize; i++) 
			{
				_items.push(createItem(_dataProvider.get(i)));
			}
		}
		
		private function createItem(itemData:Object):ItemRenderBase
		{
			var item:ItemRenderBase = _itemRenderFactory.createItemObject();
			if(item == null)
			{
				throw new NullPointerException("Null item render object.");
			}
			item.setData(itemData);
			
			return item;
		}
		
		private function disposeItems():void
		{
			DestroyUtil.destroyVector(_items);
		}
		
		private function disposeDataProvider():void
		{
			if(_dataProvider != null)
			{
				_dataProvider.removeEventListener(DataProviderEvent.ADD, dataProviderAddHandler);
				_dataProvider.removeEventListener(DataProviderEvent.REMOVE, dataProviderRemoveHandler);
				_dataProvider.removeEventListener(DataProviderEvent.UPDATE, dataProviderUpdateHandler);
				_dataProvider = null;
			}
		}
	}
}