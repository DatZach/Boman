/// RefReadString(buffer);
/// Reads a string from the current position

{
    var buffer = argument0;
    
    var offset = buffer_read(buffer, buffer_u32);
    if (offset == -1)
        return '';
    
    var curPos = buffer_tell(buffer);
    
    buffer_seek(buffer, buffer_seek_start, offset - 4);
    var length = buffer_read(buffer, buffer_u32);
    
    var result = '';
    for(var i = 0; i < length; ++i)
        result += chr(buffer_read(buffer, buffer_u8));
    
    buffer_seek(buffer, buffer_seek_start, curPos);
    
    return result;
}

