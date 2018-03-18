var dialogue = CreateDialogue(noone);
AddDialogue(
    dialogue, DSide.Left, sPortraitProtagonist, "DatZach",
    "\\@ff0000Lorem\\@00ff00 ipsum\\@0000ff dolor\\! sit amet, consectetur \\$sItemIcons16:4$ adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " +
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\. Duis aute irure dolor in " +
    "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt " +
    "in culpa qui officia deserunt mollit anim id est laborum."
);
AddDialogue(
    dialogue, DSide.Right, sPortraitProtagonist, "???",
    "Hey, that's pretty cool!"
);
AddDialogue(
    dialogue, DSide.Left, sPortraitProtagonist, "DatZach",
    "\\1Hey, thanks man."
);
AddDialogueOptions(
    dialogue, DSide.Right, sPortraitProtagonist, "Cabbage Man", "Welcome! How may I help you?", Dialogue01_OptionsTest,
    "Talk", "Take Item", "Exit"
);

