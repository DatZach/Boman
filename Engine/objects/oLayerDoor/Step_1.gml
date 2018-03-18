/// @description  Handle player interaction

if (group != "")
{
    locked = !AllPuzzleElementsTriggered(group);
    image_index = 2 + locked;
}
else
    image_index = locked;

if (place_meeting(x, y, oVine))
    exit;

var collision = place_meeting(x, y, oPlayer);
if (collision)
{
    if (locked)
    {
        if (group == "")
        {
            if (GetRoomKeyCount() > 0)
                NotifyInteraction(InteractionIcon.Key, "Unlock");
            else
                NotifyInteraction(InteractionIcon.Deny, "Door Locked by Key");
        }
        else
            NotifyInteraction(InteractionIcon.Deny, "Door Locked by Mechanism");
    }
    else
    {
        var srcMetadata = global.rooms[? room];
        var dstMetadata = global.rooms[? dest];
        var msg = iff(
            srcMetadata[? "group-id"] == dstMetadata[? "group-id"],
            "Enter",
            "Enter " + dstMetadata[? "name"]
        );
        
        NotifyInteraction(InteractionIcon.UpArrow, msg);
    }
}

if (global.gamePaused)
    exit;

if (CheckKey(global.k_action, E_PRESS) && collision)
{
    if (locked)
    {
        // Can only unlock doors that aren't assigned to a trigger group
        if (group == "")
        {
            var rMetadata = GetCurrentRoom();
            var doorName = concat(rMetadata[? "group-id"], name);
            ds_list_add(global.unlockedDoors, doorName);
            AddKey(-1);
            locked = false;
        }
    }
    else
    {
        // TODO Room transition effect
        // NOTE This variable is used to specify the door to set the player's
        //      x/y to once we switch rooms. Make sure it's the unaltered name
        //      of the door
        global.destLayerDoorName = name;
        global.destLayerDoorId = id;
        gsfx(sfxEnterDoor);
        SetRoom(dest);
    }
}


