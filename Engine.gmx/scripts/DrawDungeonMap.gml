/// DrawDungeonMap(left, top, layer);
/// Draws a dungeon map for the current area

{
    var layersLeft = argument0;
    var mapLeft = argument0 + 80;
    var mapTop = argument1;
    var layer = argument2;
    
    var metadata = GetCurrentRoom();
    var groupId = metadata[? 'group-id'];
    var tileX = metadata[? 'tile-x'];
    var tileY = metadata[? 'tile-y'];
    var tileZ = metadata[? 'tile-z'];
    
    var layers = global.dungeonMaps[? groupId];
    var currentLayer = layers[| layer];
    var map = currentLayer[| 0];
    var doors = currentLayer[| 1];
    
    var visited = global.visitedAreasDungeons[? groupId];
    
    draw_set_font(fHudOverlay);
    for(var i = 0; i < ds_list_size(layers); ++i)
    {
        var yy = mapTop + i * 16;
        
        draw_set_color(iff(i == layer, c_aqua, c_white));
        draw_rectangle(
            layersLeft, yy,
            layersLeft + 32, yy + 12,
            false
        );
        
        draw_set_color(c_black);
        draw_text(layersLeft + 2, yy + 2, string(i + 1));
        
        if (i == tileZ)
            draw_sprite(sHudMapMarker, 0, layersLeft + 32 - 8, yy + 7);
    }
    
    /*
        7 8 9   ul u ur
        4 5 6   l  + r
        1 2 3   bl b br
          ^     lur
        <   >   lud, rud
          v     blr
        -   |   lr, ud
          0     none
     */
    
    var height = array_length_1d(map);
    for(var yy = 0; yy < height; ++yy)
    {
        var mLine = map[yy];
        var dLine = doors[yy];
        var width = string_length(mLine);
        for(var xx = 0; xx < width; ++xx)
        {
            var mc = string_char_at(mLine, xx + 1);
            if (mc == ' ' || ds_list_find_index(visited, concat(layer, mc)) == -1)
                continue;
            
            var dc = string_char_at(dLine, xx + 1);
            
            var xxx = mapLeft + xx * 12;
            var yyy = mapTop + yy * 12;
            
            var uj = yy == 0 || string_char_at(map[yy - 1], xx + 1) != mc;
            var rj = xx == width - 1 || string_char_at(mLine, xx + 2) != mc;
            var dj = yy == height - 1 || string_char_at(map[yy + 1], xx + 1) != mc;
            var lj = xx == 0 || string_char_at(mLine, xx) != mc;
            
            var selected = xx == tileX && yy == tileY;
            //selected = selected || (uj && xx == tileX     && yy == tileY - 1);
            //selected = selected || (rj && xx == tileX - 1 && yy == tileY    );
            //selected = selected || (dj && xx == tileX     && yy == tileY + 1);
            //selected = selected || (lj && xx == tileX - 1 && yy == tileY    );
            draw_set_color(c_white);
            draw_rectangle(xxx, yyy, xxx + 11, yyy + 11, false);
            
            var l, u, d, r;
            l = dc == '7' || dc == '4' || dc == '1' || dc == '^' ||
                dc == '<' || dc == 'v' || dc == '-' || dc == '+';
            u = dc == '7' || dc == '8' || dc == '9' || dc == '^' ||
                dc == '<' || dc == '>' || dc == '|' || dc == '+';
            d = dc == '1' || dc == '2' || dc == '3' || dc == '<' ||
                dc == '>' || dc == 'v' || dc == '|' || dc == '+';
            r = dc == '9' || dc == '6' || dc == '3' || dc == '^' ||
                dc == '>' || dc == 'v' || dc == '-' || dc == '+';
            
            if (uj) draw_sprite(sHudMapCell, 0 + u, xxx, yyy);
            if (rj) draw_sprite(sHudMapCell, 2 + r, xxx, yyy);
            if (dj) draw_sprite(sHudMapCell, 4 + d, xxx, yyy);
            if (lj) draw_sprite(sHudMapCell, 6 + l, xxx, yyy);
            
            if (selected)
                draw_sprite(sHudMapMarker, 0, xxx + 6, yyy + 6);
        }
    }
}

