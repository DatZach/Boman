/// AddKey(count)
/// Adds/Removes a key for this area

{
    var count = argument0;
    
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    
    var prevKeys = global.keys[? groupId];
    global.keys[? groupId] += count;
    
    if (global.keys[? groupId] < 0)
        global.keys[? groupId] = 0;
        
    return global.keys[? groupId] != prevKeys;
}

