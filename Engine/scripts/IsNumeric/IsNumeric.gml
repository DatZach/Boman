/// @description  IsNumeric(char);
/// @function  IsNumeric
/// @param char
/// Returns if a character is entirely numeric

{
    var value = ord(argument0);
    return value >= ord("0") && value <= ord("9");
}
