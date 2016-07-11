/// InventoryAdd(inventory, itemIndex);
/// Adds an item of type item-index to the inventory
/// Returns: item; noone if the max-stock has been reached

{
    var inventory = argument0;
    var itemIndex = argument1;
    
    // Increase stock if item is stackable
    var itemMeta = global.dbItems[| itemIndex];
    if (HasFlag(itemMeta[? 'type'], ItemType.Stackable))
    {
        var item = InventoryItemOf(inventory, itemIndex);
        if (item != noone)
        {
            if (item[? 'max-stock'] > 0 && item[? 'stock'] == item[? 'max-stock'])
                return noone;
            
            ++item[? 'stock'];
            return item;
        }
    }
    
    // Otherwise, just create a new item
    var item = ds_map_create();
    item[? 'db-item-index'] = itemIndex;
    item[? 'stock'] = 1;
    item[? 'max-stock'] = 0;
    
    ds_list_add(inventory, item);
    
    return item;
}

