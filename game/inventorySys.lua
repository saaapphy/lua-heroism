Inventory = {
  -- this only stores the item ids and nothing else
  -- item info can be looked up in itemTable.lua
  items = {},

  -- adds count amount of items to inventory
  addItem = function(self, itemID, count)
    -- rets 1 if count is nil
    count = count or 1
    for i = 1, count do
      table.insert(self.items, itemID)
    end
  end,

  -- removes count amount of items to inventory
  removeItem = function(self, itemID, count)
    count = count or 1
    local removed = 0
    for i = #self.items, 1, -1 do
      if self.items[i] == itemID then
        table.remove(self.items, i)
        removed = removed + 1
        if removed == count then
          break
        end
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