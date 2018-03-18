/// @description  oShop_TalkMenu(dialogue, index);
/// @function  oShop_TalkMenu
/// @param dialogue
/// @param  index
/// Handle talk dialogue

{
    var cDialogue = argument0;
    var index = argument1;
    
    with(oShop)
    {
        if (index < ds_list_size(talk))
        {
            var entry = talk[| index];
            var dialogueScript = entry[? "dialogue-script"];
            var dialogueText = entry[? "text"];
            
            if (dialogueScript != noone)
                script_execute(dialogueScript);
            else
                AddDialogue(dialogue, side, portrait, name, dialogueText);
        }
        
        event_user(0);
    }
}

