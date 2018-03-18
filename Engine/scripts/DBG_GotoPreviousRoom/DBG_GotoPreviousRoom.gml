{
    var console = argument0;
    var arguments = argument1;
    
    if (room_exists(room_previous(room)))
    {
       SetRoom(room_previous(room));
       ConsoleToggle(console);
    }
    else
        ConsolePrint(console, "No previous room to go to");
}

