/// @description  Universal Room Initialization

room_speed = 60;
view_enabled = true;

var metadata = GetCurrentRoom();

// Mark this area as visited
var tileX = metadata[? "tile-x"];
var tileY = metadata[? "tile-y"];
if (HasFlag(metadata[? "flags"], RoomFlags.Dungeon))
{
    var vTiles = global.visitedAreasDungeons[? metadata[? "group-id"]];
    
    var tileZ = metadata[? "tile-z"];
    var layers = global.dungeonMaps[? metadata[? "group-id"]];
    var mapLayer = layers[| tileZ];
    var map = mapLayer[| 0];
    var line = map[tileY];
    var cellId = concat(tileZ, string_char_at(line, tileX + 1));
    
    if (ds_list_find_index(vTiles, cellId) == -1)
        ds_list_add(vTiles, cellId);
}
else
    global.visitedTiles[tileX, tileY] = true;

// Toast an area if we haven't visited it before
if (ds_list_find_index(global.visitedAreas, metadata[? "group-id"]) < 0)
{
    ds_list_add(global.visitedAreas, metadata[? "group-id"]);
    ToastArea();
}

// Flush uncompleted shrines if we leave an area
if (metadata[? "group-id"] != global.previousAreaGroupId)
    FlushUncompletedShrines();

global.previousAreaGroupId = metadata[? "group-id"];

// Play music for this area
var musicId = metadata[? "bg-music"];
SeMusicStart(musicId, MusicFlags.Transition);
