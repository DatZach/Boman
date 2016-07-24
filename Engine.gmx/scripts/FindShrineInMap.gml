/// FindShrineInMap(x, y, dir);
/// Returns an array containing the x/y of the next shrine in a given direction

{
    var xx = argument0;
    var yy = argument1;
    var dir = argument2;
    
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    var tileZ = metadata[? 'tile-z'];
    var layers = global.dungeonMaps[? groupId];
    var currentLayer = layers[| tileZ];
    var map = currentLayer[| 0];
    
    var height = array_length_1d(map);
    var width = string_length(map[0]);

    switch(dir)
    {
        case vk_right:
        case vk_down:
        {
            var h = 0;
            var v = 1;
            while(h < width)
            {
                while(v < height)
                {
                    var rx = (xx + h) % width;
                    var ry = (yy + v) % height;
                    if (v >= height - 1)
                    {
                        ++h;
                        v = 0;
                        rx = (xx + h) % width;
                        ry = (yy + v) % height;
                        
                        if (h >= width - 1)
                        {
                            v = height;
                            break;
                        }
                    }
                    
                    ++v;
                    
                    var row = map[ry];
                    var mc = string_char_at(row, rx + 1);
                    //show_debug_message(concat('mc = "', mc, '" ', rx, '/', ry));
                    if (IsNumeric(mc))
                    {
                        var r = 0;
                        r[0] = rx; r[1] = ry;
                        //show_debug_message(concat('SC - ', rx, ',', ry));
                        return r;
                    }
                }
            }
            break;
        }
        
        case vk_left:
        case vk_up:
        {
            for(var h = width - 1; h >= 0; --h)
            {
                for(var v = height - 1; v >= 0; --v)
                {
                    var rx = (xx + h) % width;
                    var ry = (yy + v - 1) % height;
                    if (ry < 0)
                    {
                        --h;
                        ry = height - 1;
                    }
                    
                    var row = map[ry];
                    var mc = string_char_at(row, rx + 1);
                    if (IsNumeric(mc))
                    {
                        var r = 0;
                        r[0] = rx; r[1] = ry;
                        show_debug_message(concat('SC - ', rx, ',', ry));
                        return r;
                    }
                }
            }
            break;
        }
    }
    
    show_debug_message('Not Found');
    
    var r = 0;
    r[0] = xx; r[1] = yy;
    return r;
}

