/// @description  RespawnToCheckpoint();
/// @function  RespawnToCheckpoint
/// Moves player to the last checkpoint they were at

{
    if (global.checkpointRoom == noone || global.checkpointInstanceId == noone)
    {
        ConsolePrint(oController.debugConsole, "Checkpoint room/id unset -- cannot respawn");
        return 0;
    }
    
    global.respawningToCheckpoint = true;
    SetRoom(global.checkpointRoom);
    
    return 1;
}

