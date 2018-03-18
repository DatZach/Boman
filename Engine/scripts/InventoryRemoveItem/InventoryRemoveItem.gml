/// @description  InventoryRemoveItem(inventory, dbItemIndex)
/// @function  InventoryRemoveItem
/// @param inventory
/// @param  dbItemIndex
/// Removes an item of a specific type
/// Returns: true if the last of stock was removed; false otherwise

{
    var inventory = argument0;
    var itemIndex = argument1;
    
    var index = InventoryIndexOf(inventory, itemIndex);
    if (index == -1)
        return false;
    
    return InventoryRemoveIndex(inventory, index);
}

