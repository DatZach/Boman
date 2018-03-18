/// @description  DEBUG MODE -- Verify groups are setup

if (group == "" && !locked)
    ConsolePrint(oController.debugConsole, "WARNING - No group assigned to " + object_get_name(object_index) + " (" + string(id) + ")");

if (name == "" && locked)
    ConsolePrint(oController.debugConsole, "WARNING - No name assigned to locked door.");


