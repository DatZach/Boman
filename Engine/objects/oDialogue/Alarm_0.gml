/// @description  Finish dialogue initialization

if (ds_list_size(dialogue) <= 0)
{
    ConsolePrint(oController.debugConsole, "Dialogue was not initialized with any content.");
    exit;
}

var entry = dialogue[| 0];
var side = entry[? "side"];
portrait[side] = entry[? "portrait"];
portraitFrame[side] = 0;
namePlate[side] = entry[? "name"];

visible = true;


