/// DbItems()
/*
 *  item-index      :   Item index associated with this item
 *  min-level       :   Minimum level of the mob required to drop this item
 *  max-level       :   Maximum level of the mob required to drop this item
 *  rarity          :   Common items are closer to 1, rarer items to 0
 */

{
    enum ItemType {
        None                = 0,
        Equipable           = 1,
        Consumable          = 2,
        Stackable           = 4,
        Persistent          = 8
    }
    
    global.dbItems = ds_list_create();
    
    // Primary Items
    global.ITEM_Lantern                     = DbItemAdd(1, 'Lantern', 'FLAVOR TEXT', 0, 0, 0, 0, ItemType.Equipable);
    global.ITEM_Bomb                        = DbItemAdd(2, 'Bomb', 'FLAVOR TEXT', 2, 99, 0.25, 0, ItemType.Equipable | ItemType.Stackable | ItemType.Persistent);
    global.ITEM_Rope                        = DbItemAdd(3, 'Rope', 'FLAVOR TEXT', 0, 0, 0, 0, ItemType.Equipable);
    global.ITEM_Gel                         = DbItemAdd(4, 'Gel', 'FLAVOR TEXT', 0, 0, 0, 0, ItemType.Equipable);

    // Special Items
    global.ITEM_Key                         = DbItemAdd(11, 'Key', '', 0, 0, 0, 0, ItemType.None);
    
    // Secondary Items
    global.ITEM_RedMedalion                 = DbItemAdd(5, 'Red Medalion', 'This relic was found deep underground.', 0, 99, 0.01, 0, ItemType.None);
    global.ITEM_BlueMedalion                = DbItemAdd(6, 'Blue Medalion', 'This relic fills you with determination!', 0, 99, 0.01, 0, ItemType.None);
    global.ITEM_GreenMedalion               = DbItemAdd(7, 'Green Medalion', 'Something, something, description', 0, 99, 0.001, 0, ItemType.None);
    global.ITEM_Mushroom                    = DbItemAdd(8, 'Mushroom', 'Found in dank places.#+4 HP', 0, 99, 0.1, 0.1, ItemType.Stackable | ItemType.Consumable);
    global.ITEM_Smokebomb                   = DbItemAdd(9, 'Smoke Bomb', 'The pungent smoke released temporarily blinds enemies, allowing for a swift escape.', 0, 99, 0.1, 0, ItemType.Equipable | ItemType.Stackable);
    
    // Knick-Knacks
    global.KNICKKNACK_LeafJumperStatue      = DbItemAdd(10, 'Statue of a Leaf Jumper', 'A statue of an ancient tiny yet energetic creature that used to inhabit this world.', 0, 0, 0, 0, ItemType.None);
    
    global._KNICKKNACK_StartId              = global.KNICKKNACK_LeafJumperStatue;
}
