/// UseItem(itemIndex)
/// Will decrement the stock if applicable and return if the item is available or not

{
    var itemIndex = argument0;
    if (itemIndex == noone)
        return false;
    
    var item = global.inventory[| itemIndex];
    var itemMeta = global.dbItems[| item[? 'db-item-index']];
    
    if (HasFlag(itemMeta[? 'type'], ItemType.Stackable))
    {
        if (item[? 'stock'] == 1 && !HasFlag(itemMeta[? 'type'], ItemType.Persistent))
        {
            InventoryRemoveItemIndex(itemIndex);
        }
        else if (item[? 'stock'] > 0)
        {
            --item[? 'stock'];
            return true;
        }
        
        return false;
    }
    
    return true;
}

