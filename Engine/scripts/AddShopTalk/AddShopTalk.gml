/// @description  AddShopTalk(shop, entry-text, dialogue-text);
/// @function  AddShopTalk
/// @param shop
/// @param  entry-text
/// @param  dialogue-text
/// Add a simple talking point to the shop

{
    var shop = argument0;
    var entryText = argument1;
    var dialogueText = argument2;
    
    var entry = ds_map_create();
    entry[? "entry-text"] = entryText;
    entry[? "dialogue-script"] = noone;
    entry[? "text"] = dialogueText;
    ds_list_add(shop.talk, entry);
}

