/// @description  AllPuzzleElementsTriggered(groupName);
/// @function  AllPuzzleElementsTriggered
/// @param groupName

{
    var groupName = argument0;
    
    with(pPuzzleElement)
    {
        if (group == groupName && triggered == inverse)
            return false;
    }
    
    with(pMob)
    {
        if (group == groupName)
            return false;
    }
    
    return true;
}

