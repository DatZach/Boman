/// GetRoomKeyCount();
/// Returns the number of keys that exist for this area

{
    var metadata = GetCurrentRoom();
    return global.keys[? metadata[? 'group-id']];
}

