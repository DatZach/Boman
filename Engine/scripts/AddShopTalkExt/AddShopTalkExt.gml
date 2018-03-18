/// @description  AddShopTalk(shop, entry-text, dialogue-script);
/// @function  AddShopTalk
/// @param shop
/// @param  entry-text
/// @param  dialogue-script
/// Adds a scripted talking point to the shop

{
    var shop = argument0;
    var entryText = argument1;
    var dialogueScript = argument2;
    
    var entry = ds_map_create();
    entry[? "entry-text"] = entryText;
    entry[? "dialogue-script"] = dialogueScript;
    entry[? "text"] = "";
    ds_list_add(shop.talk, entry);
}

