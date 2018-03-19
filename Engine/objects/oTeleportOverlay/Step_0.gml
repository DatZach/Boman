/// @description  Handle input

if (CheckKey(global.k_left, E_PRESS))
{
    var r = FindShrineInMap(xx, yy, mapLayer, vk_left);
    xx = r[0];
    yy = r[1];
}
else if (CheckKey(global.k_right, E_PRESS))
{
    var r = FindShrineInMap(xx, yy, mapLayer, vk_right);
    xx = r[0];
    yy = r[1];
}
else if (CheckKey(global.k_up, E_PRESS))
{
    var metadata = GetCurrentRoom();
    var groupId = metadata[? "group-id"];
    var layerCount = ds_list_size(global.dungeonMaps[? groupId]);
    
    ++mapLayer;
    if (mapLayer >= layerCount)
        mapLayer = 0;
    
    var r = FindShrineInMap(0, 0, mapLayer, vk_right);
    xx = r[0];
    yy = r[1];
}
else if (CheckKey(global.k_down, E_PRESS))
{
    var metadata = GetCurrentRoom();
    var groupId = metadata[? "group-id"];
    var layerCount = ds_list_size(global.dungeonMaps[? groupId]);
    
    --mapLayer;
    if (mapLayer <= 0)
        mapLayer = layerCount - 1;
    
    var r = FindShrineInMap(0, 0, mapLayer, vk_right);
    xx = r[0];
    yy = r[1];
}
else if (CheckKey(global.k_action, E_PRESS))
{
    var tileId = GetDungeonTileIdAt(xx, yy, 0);
    if (tileId != GetCurrentDungeonTileId())
    {
        var result = TeleportToShrine(tileId);
        if (!result)
        {
            message = "Shrine not Active";
            alarm[0] = room_speed;
        }
        else
            instance_destroy();
    }
}
else if (CheckKey(global.k_toggle_item_overlay, E_PRESS))
{
    instance_destroy();
}


