/// oShop_PrimaryMenu(dialogue, index);
/// oShop's Primary Menu Option

{
    var cDialogue = argument0;
    var index = argument1;
    
    switch(index)
    {
        case 0: // Buy
            with(oShop)
            {
                var options;
                for(var i = 0; i < ds_list_size(items); ++i)
                {
                    var a = items[| i];
                    var itemIndex = a[? 'db-item-index'];
                    var item = global.dbItems[| itemIndex];
                    
                    //options[i] = concat('\$sItemIcons16:', item[? 'image-index'], '$ ', item[? 'name'], ' [ ', a[? 'price'], '\$sHudGoldPile$ ]');
                    options[i] = concat(item[? 'name'], ' - ', a[? 'price'], 'G');
                }
                
                options[i] = 'Actually, nevermind...';
                
                AddDialogueOptionsList(
                    dialogue, side, portrait, name, 'Take a look for yourself!', oShop_BuyItemMenu,
                    options
                );
                
                // NOTE We expect oShop_BuyItemMenu to call event_user(0);
            }
            break;
            
        case 1: // Sell
            with(oShop)
                event_user(0);
            break;
            
        case 2: // Talk
            with(oShop)
            {
                var options;
                for(var i = 0; i < ds_list_size(talk); ++i)
                {
                    var entry = talk[| i];
                    options[i] = entry[? 'entry-text'];
                }
                
                options[i] = 'Actually, nevermind...';
                
                AddDialogueOptionsList(
                    dialogue, side, portrait, name, 'What do you want to talk about?', oShop_TalkMenu,
                    options
                );

                // NOTE We expect oShop_TalkMenu to call event_user(0);
            }
            break;
            
        case 4: // Exit
            with(oShop)
                instance_destroy();
            break;
    }
}

