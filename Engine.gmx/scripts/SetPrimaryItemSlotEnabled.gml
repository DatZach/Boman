{
    var itemIndex = argument0;
    var toggle = argument1;
    
    global.primaryItemSlot[itemIndex] = toggle;
    
    if (!toggle && global.primaryItemIndex == itemIndex)
        CycleItem();
}
