{
    // Pre-Initialization
    gml_release_mode(RELEASE_MODE);

    // Keymap
    InitializeKeymap();
    
    // Databases
    InitializeDatabases();
    
    // Globals - Gameplay
    global.gamePaused = false;
    
    // Globals - Profile
    global.PROFILE_Name = 'DatZach';
    
    // Globals - Player
    global.maxHp = 5 * POINTS_PER_HEART;
    global.hp = global.maxHp;
    global.maxArrows = 30;
    global.arrows = global.maxArrows;
    global.arrowSegments = 0;
    global.maxGold = 250;
    global.gold = 0;
    global.heartPieces = 0;
    global.bagMaxWeight = 10;
    
    global.inventory = ds_list_create();
    global.knickKnacks = ds_list_create();
    global.equipStack = ds_stack_create();
    ds_stack_push(global.equipStack, noone);
    
    global.primaryItemIndex = noone;
    global.secondaryItemIndex = noone;
    
    // Globals - Misc
    global.previousAreaGroupId = '';
    
    global.destShrineId = noone;
    
    global.destLayerDoorName = '';
    global.destLayerDoorId = noone;
    
    global.respawningToCheckpoint = false;
    global.checkpointRoom = noone;
    global.checkpointInstanceId = noone;
    
    // Globals - Event Tracking
    global.shop_Test_GotTreasureMap = false;
            
    // Global Control Instances
    instance_create(0, 0, oHud);
    instance_create(0, 0, oCursor);
    
    /*
    if (!RELEASE_MODE)
    {
        // Debug helpers
        InventoryAdd(global.inventory, global.ITEM_Lantern);
        var bomb = InventoryAdd(global.inventory, global.ITEM_Bomb);
        bomb[? 'max-stock'] = 3;
        InventoryAdd(global.inventory, global.ITEM_Bomb);
        InventoryAdd(global.inventory, global.ITEM_Bomb);
        InventoryAdd(global.inventory, global.ITEM_Bomb);
        InventoryAdd(global.inventory, global.ITEM_Bomb);
        InventoryAdd(global.inventory, global.ITEM_Rope);
        InventoryAdd(global.inventory, global.ITEM_Gel);
        
        InventoryAdd(global.inventory, global.ITEM_RedMedalion);
        InventoryAdd(global.inventory, global.ITEM_BlueMedalion);
        InventoryAdd(global.inventory, global.ITEM_GreenMedalion);
        
        InventoryAdd(global.inventory, global.ITEM_Mushroom);
        InventoryAdd(global.inventory, global.ITEM_Mushroom);
        InventoryAdd(global.inventory, global.ITEM_Mushroom);
        
        InventoryAdd(global.inventory, global.ITEM_Smokebomb);
        InventoryAdd(global.inventory, global.ITEM_Smokebomb);
        InventoryAdd(global.inventory, global.ITEM_Smokebomb);
        InventoryAdd(global.inventory, global.ITEM_Smokebomb);
        InventoryAdd(global.inventory, global.ITEM_Smokebomb);
        
        InventoryAdd(global.inventory, global.ITEM_RedMedalion);
        InventoryAdd(global.inventory, global.ITEM_BlueMedalion);
        InventoryAdd(global.inventory, global.ITEM_GreenMedalion);
        InventoryAdd(global.inventory, global.ITEM_RedMedalion);
        InventoryAdd(global.inventory, global.ITEM_BlueMedalion);
        InventoryAdd(global.inventory, global.ITEM_GreenMedalion);
        InventoryAdd(global.inventory, global.ITEM_RedMedalion);
        InventoryAdd(global.inventory, global.ITEM_BlueMedalion);
        InventoryAdd(global.inventory, global.ITEM_GreenMedalion);
        
        InventoryAdd(global.knickKnacks, global.KNICKKNACK_LeafJumperStatue);
    }
    */
    
    // View Setup
    ResizeWindow(VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE);
    SetRoom(room_next(room));
}
