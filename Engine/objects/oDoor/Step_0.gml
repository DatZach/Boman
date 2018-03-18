if (group != "")
    y = iff(AllPuzzleElementsTriggered(group), -1000, ystart);
else if (locked && distance_to_object(oPlayer) < 15)
{
    if (GetRoomKeyCount() > 0)
    {
        NotifyInteraction(InteractionIcon.Key, "Unlock");
        if (CheckKey(global.k_action, E_PRESS))
        {
            var rMetadata = GetCurrentRoom();
            var doorName = concat(rMetadata[? "group-id"], name);
            ds_list_add(global.unlockedDoors, doorName);
            AddKey(-1);
            locked = false;
        }
    }
    else
        NotifyInteraction(InteractionIcon.Deny, "Locked Door");
}
else if (!locked)
    y = -1000;


