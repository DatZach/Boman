/// ToastItem(item-index)
/// Displays a toast that you picked this item up

{
    var itemIndex = argument0;
    
    with(oHud)
    {
        var toast = ds_map_create();
        toast[? 'item-index'] = itemIndex;
        toast[? 'frames'] = 0;
        toast[? 'frame-inc'] = 1;
        
        ds_list_add(toasts, toast);
        
        alarm[0] = room_speed * 3;
    }
}

