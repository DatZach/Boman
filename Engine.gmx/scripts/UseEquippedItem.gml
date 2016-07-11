/// UseEquippedItem(item);
/// Handles the logic for using an equipped item

{
    var item = argument0;
    var itemIndex = global.primaryItemIndex;
    
    switch(item[? 'db-item-index'])
    {
        case global.ITEM_Bomb:
            if (InventoryRemoveIndex(global.inventory, itemIndex))
                instance_create(x, y - 8, oWeaponBomb);
            break;
            
        case global.ITEM_Smokebomb:
            if (InventoryRemoveIndex(global.inventory, itemIndex))
                FxSmoke(x, y, 30);
            break;
    }
}

