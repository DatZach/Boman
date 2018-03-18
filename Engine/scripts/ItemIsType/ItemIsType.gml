/// @description  ItemIsType(item, flag);
/// @function  ItemIsType
/// @param item
/// @param  flag
/// Returns if an item has a flag or not

{
    var item = argument0;
    var flag = argument1;
    
    return HasFlag(item[? "type"], flag);
}

