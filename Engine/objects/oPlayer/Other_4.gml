/// @description  Doors & Checkpoint Respawning

if (global.respawningToCheckpoint)
{
    with(global.checkpointInstanceId)
    {
        other.x = x;
        other.y = y;
        break;
    }
    
    global.respawningToCheckpoint = false;
    
    part_particles_create(
        global.dbFx_MobSmoke,
        bbox_left + (bbox_right - bbox_left) / 2,
        bbox_top + (bbox_bottom - bbox_top) / 2,
        global.dbFx_MobSmoke_Type,
        5
    );
}
else if (global.destShrineId != noone)
{
    with(oShrine)
    {
        if (id == global.destShrineId)
        {
            other.x = x;
            other.y = y;
            break;
        }
    }
    
    global.destShrineId = noone;
    
    part_particles_create(
        global.dbFx_MobSmoke,
        bbox_left + (bbox_right - bbox_left) / 2,
        bbox_top + (bbox_bottom - bbox_top) / 2,
        global.dbFx_MobSmoke_Type,
        5
    );
}
else if (global.destLayerDoorName != "")
{
    with(oLayerDoor)
    {
        if (name == global.destLayerDoorName &&
            id != global.destLayerDoorId)
        {
            other.x = x;
            other.y = y;
            break;
        }
    }
    
    global.destLayerDoorName = "";
    global.destLayerDoorId = noone;
}

