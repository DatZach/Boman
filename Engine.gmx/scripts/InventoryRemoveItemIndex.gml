/// InventoryRemoveItemIndex(index);

{
    var index = argument0;
    
    if (global.primaryItemIndex == index)
        global.primaryItemIndex = noone;
    
    if (global.secondaryItemIndex == index)
        global.secondaryItemIndex = noone;
    
    ds_list_delete(global.inventory, index);
    
    if (oHud.itemIndex >= ds_list_size(global.inventory))
        oHud.itemIndex = ds_list_size(global.inventory) - 1;
}

