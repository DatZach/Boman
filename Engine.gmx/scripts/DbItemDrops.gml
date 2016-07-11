/// DbItemDrops()
/*
 *  item-index      :   Item index associated with this item
 *  min-level       :   Minimum level of the mob required to drop this item
 *  max-level       :   Maximum level of the mob required to drop this item
 *  rarity          :   Common items are closer to 1, rarer items to 0
 */

{
    global.dbItems = ds_list_create();
    
    var item = ds_map_create();
    item[? 'item-index'] = 0;
    item[? 'min-level'] = 0;
    item[? 'max-level'] = 99;
    item[? 'rarity'] = 0.95;
}
