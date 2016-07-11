/// InventoryAddItem(itemIndex);

{
    // TODO Make generic
    // Stack item if it's already in the inventory and we support stacking
    var itemMeta = global.dbItems[| argument0];
    if (HasFlag(itemMeta[? 'type'], ItemType.Stackable))
    {
        for(var i = 0; i < ds_list_size(global.inventory); ++i)
        {
            var item = global.inventory[| i];
            
            if (item[? 'db-item-index'] == argument0)
            {
                ++item[? 'stock'];
                return item;
            }
        }
    }
    
    var item = ds_map_create();
    item[? 'db-item-index'] = argument0;
    item[? 'stock'] = 1;
    
    ds_list_add(global.inventory, item);
    
    return item;
}

