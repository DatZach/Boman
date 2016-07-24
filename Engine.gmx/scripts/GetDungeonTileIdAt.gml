/// GetDungeonTileIdAt(x, y, z)
/// Returns the tile id at a specific location

{
    var tileX = argument0;
    var tileY = argument1;
    var tileZ = argument2;
    
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    var layers = global.dungeonMaps[? groupId];
    var layer = layers[| tileZ];
    var map = layer[| 0];
    var row = map[tileY];
    var mc = string_char_at(row, tileX + 1);
    
    return mc;
}

