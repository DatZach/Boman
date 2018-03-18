/// @description  TeleportToShrine(tile-id);
/// @function  TeleportToShrine
/// @param tile-id
/// Teleports the player to a shrine of a given tile-id

{
    var tileId = argument0;
    
    var count = ds_list_size(global.shrines);
    for(var i = 0; i < count; ++i)
    {
        var entry = global.shrines[| i];
        if (entry[? "tile-id"] == tileId)
        {
            global.destShrineId = entry[? "id"];
            SetRoom(entry[? "room"]);
            return true;
        }
    }
    
    return false;
}

