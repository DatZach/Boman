/// GetEquippedItem(slot)
/// Returns: The item in the slot

enum Slot {
    Primary     = 0,
    Secondary   = 1
}

{
    var slot = argument0;
    var slotIndex = iff(slot == Slot.Primary, global.primaryItemIndex, global.secondaryItemIndex);
    
    if (slotIndex == noone)
        return noone;
    
    var item = global.inventory[| slotIndex];
    return item;
}

