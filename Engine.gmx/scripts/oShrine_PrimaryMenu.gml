/// oShrine_PrimaryMenu(dialogue, index);
/// oShrine's Primary Menu Option

{
    var cDialogue = argument0;
    var index = argument1;
    
    switch(index)
    {
        case 0: // Teleport
            instance_create(0, 0, oTeleportOverlay);
            break;
        
        case 1: // Blood Sacrifice
            if (global.hp <= POINTS_PER_HEART)
            {
                AddDialogue(
                    cDialogue, DSide.Left, sPortraitProtagonist, global.PROFILE_Name,
                    'I cannot afford to sacrifice any more blood, I am on the verge of collapsing!'
                );
            }
            else if (global.arrows >= global.maxArrows)
            {
                AddDialogue(
                    cDialogue, DSide.Left, sPortraitProtagonist, global.PROFILE_Name,
                    'I have no reason to sacrifice blood right now...'
                );
            }
            else
            {
                AddHp(-POINTS_PER_HEART);
                AddArrows(global.maxArrows * 0.2);
            }
            break;
            
        case 2: // Power Sacrifice
            if (global.arrows <= 4)
            {
                AddDialogue(
                    cDialogue, DSide.Left, sPortraitProtagonist, global.PROFILE_Name,
                    'I do not have enough arrows to make a sacrifice that will please this shrine!'
                );
            }
            else if (global.hp == global.maxHp)
            {
                AddDialogue(
                    cDialogue, DSide.Left, sPortraitProtagonist, global.PROFILE_Name,
                    'I have no no reason to sacrifice power right right now...'
                );
            }
            else
            {
                AddHp(1);
                AddArrows(-4);
            }
            break;
            
        case 3: // Leave
            break;
    }
}

