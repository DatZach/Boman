/// @description  MarkDungeonMapCompass();
/// @function  MarkDungeonMapCompass
/// Reveals the current dungeons compass

{
    var metadata = GetCurrentRoom();
    var groupId = metadata[? "group-id"];
    
    if (ds_list_find_index(global.dungeonCompasses, groupId) == -1)
        ds_list_add(global.dungeonCompasses, groupId);
}

