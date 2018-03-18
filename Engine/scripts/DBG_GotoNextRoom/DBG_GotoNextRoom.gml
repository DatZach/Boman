{
    var console = argument0;
    var arguments = argument1;
    
    if (room_exists(room_next(room)))
    {
        SetRoom(room_next(room));
        ConsoleToggle(console);
    }
    else
        ConsolePrint(console, "No next room to go to");
}
