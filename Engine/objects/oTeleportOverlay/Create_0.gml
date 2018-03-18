/// @description  Initialize

var metadata = GetCurrentRoom();
layer = metadata[? "tile-z"];

var r = FindShrineInMap(0, 0, layer, vk_right);
xx = r[0];
yy = r[1];

message = "";


