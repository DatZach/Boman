var collision = place_meeting(x, y, oPlayer);
if (collision)
    NotifyInteraction(InteractionIcon.View, "Read Sign");

if (oHud.enabled || instance_exists(oDialogue))
    exit;

if (CheckKey(global.k_action, E_PRESS) && collision)
{
    var dialogue = CreateDialogue(noone);
    AddDialogue(dialogue, DSide.Left, sPortraitSignpost, "Sign Post", message);
}


