/// @description  concat(n1, n2, ...)
/// @function  concat
/// @param n1
/// @param  n2
/// @param  ...
/// Returns a string concatenating all arguments

{
    var result = "";
    
    for(var i = 0; i < argument_count; ++i)
        result += string(argument[i]);
        
    return result;
}

