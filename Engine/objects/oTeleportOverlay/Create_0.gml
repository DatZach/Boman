/// @description  Initialize

var metadata = GetCurrentRoom();
mapLayer = metadata[? "tile-z"];

var r = FindShrineInMap(0, 0, mapLayer, vk_right);
xx = r[0];
yy = r[1];

message = "";


