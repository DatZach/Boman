/// @description  DbItemAdd(imageIdx, name, description, minLevel, maxLevel, rarity, weight, type);
/// @function  DbItemAdd
/// @param imageIdx
/// @param  name
/// @param  description
/// @param  minLevel
/// @param  maxLevel
/// @param  rarity
/// @param  weight
/// @param  type

{
    var item = ds_map_create();
    
    item[? "image-index"] = argument0;
    item[? "name"] = argument1;
    item[? "description"] = argument2;
    item[? "min-level"] = argument3;
    item[? "max-level"] = argument4;
    item[? "rarity"] = argument5;
    item[? "weight"] = argument6;
    item[? "type"] = argument7;
    
    ds_list_add(global.dbItems, item);
    
    return ds_list_size(global.dbItems) - 1;
}
