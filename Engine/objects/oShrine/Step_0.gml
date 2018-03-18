/// @description  Handle interaction

offset = lerp(offset, targetOffset, 0.01);

var collision = distance_to_object(oPlayer) < 8;
if (collision && !active)
    NotifyInteraction(InteractionIcon.Hand, "Activate Shrine");
else if (collision && active)
    NotifyInteraction(InteractionIcon.Hand, "Interact with Shrine");

if (collision && CheckKey(global.k_action, E_PRESS) && !global.gamePaused)
{
    if (!active)
    {
        RegisterShrine();
        active = true;
        targetOffset = 6;
        SetCheckpoint();
    }
    else
    {
        var dialogue = CreateDialogue(noone);
        AddDialogueOptions(
            dialogue, DSide.Left, portrait, name,
            "A mysterious power can be felt around this ancient shrine.",
            oShrine_PrimaryMenu,
            "Teleport", "Blood Sacrifice", "Power Sacrifice", "Leave"
        );
    }
}


