/// @description  ItemChooseRandom(level)
/// @function  ItemChooseRandom
/// @param level
/// Chooses an item given a specified mob level

{
    var level = argument0;
    var count = ds_list_size(global.dbItems);
    
    var total = 0;
    for(var i = 0; i < count; ++i)
    {
        var item = global.dbItems[| i];
        if (item[? "min-level"] <= level && item[? "max-level"] >= level)
            total += item[? "rarity"];
    }
    
    var rng = total * random(1);
    var upTo = 0;
    
    for(var i = 0; i < count; ++i)
    {
        var item = global.dbItems[| i];
        if (item[? "min-level"] <= level && item[? "max-level"] >= level)
        {
            var w = item[? "rarity"];
            if (upTo + w > rng)
                return item;
                
            upTo += w;
        }
    }
    
    show_debug_message("ItemChooseRandom() failed to select an item!");
    return noone;
}

