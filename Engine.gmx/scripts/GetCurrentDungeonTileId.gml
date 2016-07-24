/// GetCurrentDungeonTileId()
/// Returns the current dungeon tile id

{
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    var layers = global.dungeonMaps[? groupId];
    var layer = layers[| metadata[? 'tile-z']];
    var map = layer[| 0];
    var row = map[metadata[? 'tile-y']];
    var mc = string_char_at(row, metadata[? 'tile-x'] + 1);
    
    return mc;
}

