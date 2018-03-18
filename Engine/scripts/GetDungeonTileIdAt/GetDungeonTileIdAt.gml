/// @description  GetDungeonTileIdAt(x, y, z)
/// @function  GetDungeonTileIdAt
/// @param x
/// @param  y
/// @param  z
/// Returns the tile id at a specific location

{
    var tileX = argument0;
    var tileY = argument1;
    var tileZ = argument2;
    
    var metadata = GetCurrentRoom();
    var groupId = metadata[? "group-id"];
    var layers = global.dungeonMaps[? groupId];
    var mapLayer = layers[| tileZ];
    var map = mapLayer[| 0];
    var row = map[tileY];
    var mc = string_char_at(row, tileX + 1);
    
    return mc;
}

