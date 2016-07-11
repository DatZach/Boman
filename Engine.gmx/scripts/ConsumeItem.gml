/// ConsumeItem();
/// Handles consuming items marked as consumables

{
    var itemIndex = argument0;
    
    var item = global.inventory[| itemIndex];
    var itemMeta = global.dbItems[| item[? 'db-item-index']];
    
    switch(item[? 'db-item-index'])
    {
        case global.ITEM_Mushroom:
            if (AddHp(4))
                InventoryRemoveItem(global.inventory, itemIndex);
            break;
    }
}

