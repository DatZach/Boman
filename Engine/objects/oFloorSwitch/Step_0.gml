/// @description  Handle untriggered the switch

if ((!oneShot && triggered) || !triggered)
{
    triggered = place_meeting(x, y, oDBGPlatformingBlock) ||
                (lightWeight && place_meeting(x, y, oPlayer)) ||
                (lightWeight && place_meeting(x, y, oMobTurtle));
    
    if (doorName != "" && triggered && oneShot)
    {
        var rMetadata = GetCurrentRoom();
        var fullDoorName = concat(rMetadata[? "group-id"], doorName);
        ds_list_add(global.unlockedDoors, fullDoorName);
        
        var dialogue = CreateDialogue(noone);
        AddDialogue(
            dialogue, DSide.Left, sPortraitProtagonist, global.PROFILE_Name,
            "Sounds like something shifted in another room."
        );
    }
}


