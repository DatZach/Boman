/// @description  Show primary menu

AddDialogueOptions(
    dialogue, side, portrait, name,
    choose(
        "What can I do ya for?",
        "Take your time looking around."
    ),
    oShop_PrimaryMenu,
    "Buy", "Sell", "Talk", "Exit"
);


