/// CycleItem();
{
    var itemCount = array_length_1d(global.primaryItemSlot);
    
    var hasAtLeastOneItem = false;
    for(var i = 1; i < itemCount; ++i)
        hasAtLeastOneItem = hasAtLeastOneItem || global.primaryItemSlot[i];
    
    if (!hasAtLeastOneItem)
    {
        global.primaryItemIndex = 0;
        return 0;
    }
    
    do {
        ++global.primaryItemIndex;
        
        if (global.primaryItemIndex >= itemCount)
            global.primaryItemIndex = iff(hasAtLeastOneItem, 1, 0);
    } until (global.primaryItemSlot[global.primaryItemIndex]);
    
    return 0;
}
