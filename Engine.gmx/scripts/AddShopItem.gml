/// AddShopItem(shop, db-index, price);
/// Adds an item from the Item database to the shop

{
    var shop = argument0;
    var dbIndex = argument1;
    var price = argument2;
    
    var item = ds_map_create();
    item[? 'db-item-index'] = dbIndex;
    item[? 'price'] = price;
    ds_list_add(shop.items, item);
}

