/// @description  Unlock door if it's been registered before

var rMetadata = GetCurrentRoom();
var doorName = concat(rMetadata[? "group-id"], name);
if (ds_list_find_index(global.unlockedDoors, doorName) != -1)
    locked = false;


