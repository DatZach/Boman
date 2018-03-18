/// @description  ShrineIsActive();
/// @function  ShrineIsActive
/// Returns if this shrine appears in the active shrine list

{
    var count = ds_list_size(global.shrines);
    for(var i = 0; i < count; ++i)
    {
        var entry = global.shrines[| i];
        if (entry[? "room"] == room && entry[? "id"] == id)
            return true;
    }
    
    return false;
}

