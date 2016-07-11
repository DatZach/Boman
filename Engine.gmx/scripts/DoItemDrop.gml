/// DoItemDrop();
/// Handles item drops for mobs

{
    var chance = random(1);
    
    if (chance >= dropRate)
    {
        chance = random(1);
        if (chance <= 0.05)
        {
            // Item + Gold
            SpawnGold(x, y, 3, irandom(level + level * 0.5) + 1);
            
            var item = ItemChooseRandom(level);
            SpawnItem(item, x, y, true);
        }
        else if (chance <= 0.25)
        {
            // Gold
            SpawnGold(x, y, 3, irandom(level + level * 0.5) + 1);
        }
        else
        {
            // Item
            var item = ItemChooseRandom(level);
            SpawnItem(item, x, y, true);
        }
    }
}

