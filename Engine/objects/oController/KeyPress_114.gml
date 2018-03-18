var shop = CreateShop(
    DSide.Right,
    sPortraitProtagonist,
    "Cabbage Lady",
    bgBackdropTest,
    "Hey there! Got all your cabbage and cabbage accessories right here."
);

AddShopItem(shop, global.ITEM_Bomb, 5);
AddShopItem(shop, global.ITEM_Smokebomb, 10);
AddShopItem(shop, global.KNICKKNACK_LeafJumperStatue, 10);

AddShopTalk(shop, "What wares do you buy?", "I specialize in explosive deals! I also like really rare doo-dads.");
AddShopTalkExt(shop, "Any local gossip?", TestShop_Talk_GossipInit);
AddShopTalk(shop, "Item 01", "Hello, World! 1");
AddShopTalk(shop, "Item 02", "Hello, World! 2");
AddShopTalk(shop, "Item 03", "Hello, World! 3");
AddShopTalk(shop, "Item 04", "Hello, World! 4");

