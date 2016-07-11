#define TestShop_Talk_GossipInit
{
    if (!global.shop_Test_GotTreasureMap)
    {
        AddDialogueScript(
            dialogue, side, portrait, name, TestShop_Talk_GossipAction,
            'Well,\z I have this dingy old treasure map that some old man sold me.\. Personally I have no use for it, I am just a simple cabbage lady. You can have it if you would like, maybe you will actually get somewhere with it!'
        );
        
        global.shop_Test_GotTreasureMap = true;
    }
    else
    {
        AddDialogue(
            dialogue, side, portrait, name,
            'Have you found anything with that map yet?'
        );
    }
}

#define TestShop_Talk_GossipAction
{
    InventoryAdd(global.inventory, global.ITEM_Bomb); // TODO Replace with treasure map
    ToastItem(global.ITEM_Bomb);
}