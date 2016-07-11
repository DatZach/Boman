/// oShop_BuyItemMenu(dialogue, index);
/// Handle purchase dialogue

{
    var cDialogue = argument0;
    var index = argument1;
    
    with(oShop)
    {
        if (index < ds_list_size(items))
        {
            var item = items[| index];
            var dbItem = global.dbItems[| item[? 'item-index']];
            var price = item[? 'price'];
            
            if (price <= global.gold)
            {
                global.gold -= price;
                InventoryAdd(global.inventory, ds_list_find_index(global.inventory, dbItem));
                AddDialogue(
                    dialogue, side, portrait, name,
                    'Certainly! Hope this serves you well.'
                );
            }
            else
            {
                AddDialogue(
                    dialogue, side, portrait, name,
                    "You don't have enough coin here. I can count ya know..."
                );
            }
        }
    }
}

