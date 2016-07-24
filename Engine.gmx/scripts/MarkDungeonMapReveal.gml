/// MarkDungeonMapReveal();
/// Reveals the current dungeons map

{
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    
    if (ds_list_find_index(global.dungeonReveals, groupId) == -1)
        ds_list_add(global.dungeonReveals, groupId);
}

