{
    var dialogue = argument0;
    var optionIndex = argument1;
    
    switch(optionIndex)
    {
        case 0:
            AddDialogue(
                dialogue, DSide.Right, sPortraitProtagonist, "Some Person",
                "\\1How cool is this dialogue system? Amiright or amirite?"
            );
            break;
            
        case 1:
            AddDialogueScript(
                dialogue, DSide.Right, sPortraitProtagonist, "Some Person", Dialogue01_Test,
                "\\1Of course! Here you go."
            );
            break;
            
        case 2:
            AddDialogue(
                dialogue, DSide.Right, sPortraitProtagonist, "Some Person",
                "\\1Cheers, mate!"
            );
            break;
    }
}
