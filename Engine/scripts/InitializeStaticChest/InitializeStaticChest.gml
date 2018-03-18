/// @description  InitializeStaticChest(item1, item2, ...)
/// @function  InitializeStaticChest
/// @param item1
/// @param  item2
/// @param  ...

{
    type |= ChestType.Static;
    
    items = ds_list_create();
    for(var i = 0; i < argument_count; ++i)
        ds_list_add(items, argument[i]);
    
    return true;
}

