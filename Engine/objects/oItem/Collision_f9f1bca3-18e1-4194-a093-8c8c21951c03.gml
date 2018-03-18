/// @description  Pickup item

if (!canBeAquired)
    exit;

var itemIndex = ds_list_find_index(global.dbItems, item);
switch(itemIndex)
{
    case global.ITEM_Key:
        ToastItem(itemIndex);
        AddKey(1);
        break;
        
    case global.ITEM_Map:
        ToastItem(itemIndex);
        MarkDungeonMapReveal();
        break;
        
    default:
        InventoryPut(itemIndex);
        break;
}

instance_destroy();


