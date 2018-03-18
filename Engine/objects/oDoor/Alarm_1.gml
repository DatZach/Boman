/// @description  Unlock this door if it's unlocked

if (name != "")
{
    var rMetadata = GetCurrentRoom();
    var doorName = concat(rMetadata[? "group-id"], name);
    if (ds_list_find_index(global.unlockedDoors, doorName) != -1)
        locked = false;
}


