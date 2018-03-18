/// @description  GetRoomName(room)
/// @function  GetRoomName
/// @param room
/// Returns the specified room's name

{
    var metadata = global.rooms[? room];
    return metadata[? "name"];
}

