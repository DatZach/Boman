/// InventoryRemoveIndex(inventory, index);
/// Removes an item at the specified index
/// Returns: true if there was stock available; false if all stock has already been removed

{
    var inventory = argument0;
    var index = argument1;
    
    var item = inventory[| index];
    var itemMeta = global.dbItems[| item[? 'db-item-index']];
    
    var stock = --item[? 'stock'];
    if (ItemIsType(itemMeta, ItemType.Persistent))
    {
        // Item is persistent and its stock dropped below 0
        if (stock < 0)
        {
            item[? 'stock'] = 0;
            return false;
        }
    }
    else if (stock <= 0)
    {
        // Item is NOT persistent and stock has dropped to 0
        ds_map_destroy(inventory[| index]);
        ds_list_delete(inventory, index);
        
        // If this item was equipped then we need to unassign it
        if (global.primaryItemIndex == index && inventory == global.inventory)
        {
            do {
                global.primaryItemIndex = iff(ds_stack_empty(global.equipStack), noone, ds_stack_pop(global.equipStack));
            } until(global.primaryItemIndex < ds_list_size(global.inventory));
            
            show_debug_message(concat('Pop from equip stack; value = ', global.primaryItemIndex, '; count = ', ds_stack_pop(global.equipStack)));
        }
        
        with(oHud)
            itemIndex = median(0, itemIndex, ds_list_size(global.inventory) - 1);
        
        return false;
    }
    
    return true;
}

