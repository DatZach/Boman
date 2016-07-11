/// concat(n1, n2, ...)
/// Returns a string concatenating all arguments

{
    var result = '';
    
    for(var i = 0; i < argument_count; ++i)
        result += string(argument[i]);
        
    return result;
}

