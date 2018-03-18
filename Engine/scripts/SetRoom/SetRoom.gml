/// @description  GotoRoom(room)
/// @function  GotoRoom
/// @param room
{
    var roomId = argument0;
    
    if (!room_exists(roomId))
    {
        ConsolePrint(oController.debugConsole, concat("SetRoom() - Room ID ", roomid, " does not exist."));
        return 0;
    }
    
    room_set_view(
        roomId, 0, true, 
        0, 0, VIEW_WIDTH, VIEW_HEIGHT,
        0, 0, VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE,
        0, 0, 0, 0,
        noone
    );
    room_set_persistent(roomId, true);
    
    room_goto(roomId);
}
