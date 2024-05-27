Inventory = {
  items = {},

  -- todo: put in a "count" arg so we can put multiple items in at once
  addItem = function(self, itemID)
    table.insert(self.items, itemID)
  end,

  -- same for here, this should have a "count" args
  removeItem = function(self, itemID)
    for i, id in ipairs(self.items) do
      if id == itemID then
        table.remove(self.items, i)
        break
      end
    end
  end,

  listItems = function(self)
    for _, itemId in ipairs(self.items) do
      local _item = self:getItemByID(itemId)
      print(_item.itemName .. ": " .. _item.itemValue)
    end
  end,

  getItemByID = function(self, itemId)
    for _, item in ipairs(Item) do
      if item.itemID == itemId then
        return item
      end
    end

    -- if item is not found, we should error here
    return nil
  end
}

return Inventory