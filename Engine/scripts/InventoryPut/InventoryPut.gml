/// @description  InventoryPut(itemIndex);
/// @function  InventoryPut
/// @param itemIndex
/// Follows normal game logic for adding an item to the inventories

{
    var itemIndex = argument0;
    var inventory = iff(itemIndex < global._KNICKKNACK_StartId, global.inventory, global.knickKnacks);
    InventoryAdd(inventory, itemIndex);
    ToastItem(itemIndex);
}

