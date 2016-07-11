/// InventoryItemOf(inventory, dbItemIndex);
/// Returns: Item of the first instance of item-index; noone if none is found

{
    var inventory = argument0;
    var itemIndex = argument1;
    
    var count = ds_list_size(inventory);
    for(var i = 0; i < count; ++i)
    {
        var item = inventory[| i];
        if (item[? 'db-item-index'] == itemIndex)
            return item;
    }
    
    return noone;
}

