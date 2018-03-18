/// @description  GetCurrentRoomName()
/// @function  GetCurrentRoomName
/// Returns the current room name

{
    var metadata = GetCurrentRoom();
    return metadata[? "name"];
}
