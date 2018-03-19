/// @description  Draw overlay - Dialogue

var OFFSET = 12;

var width = display_get_gui_width();
var height = display_get_gui_height();
var left = OFFSET;
var top = OFFSET;
var right = width - OFFSET;
var bottom = height - OFFSET;
var dialogueTop = floor(bottom - height * 0.25);

// Obscure game world
draw_set_color(c_black);
draw_set_alpha(intensity);
draw_rectangle(0, 0, width, height, false);

if (backdrop != noone)
{
    draw_set_alpha(intensity / targetIntensity);
    draw_sprite(backdrop, 0, 0, 0);
}

draw_set_alpha(1);

if (targetIntensity == 0)
    exit;

var entry = dialogue[| diagIndex];
var type = entry[? "type"];
var side = entry[? "side"];
    
// Character Portrait
if (portrait[DSide.Left] != noone)
{
    var name = namePlate[DSide.Left];
    
    draw_sprite_ext(
        portrait[DSide.Left],
        portraitFrame[DSide.Left],
        left + OFFSET,
        top,
        1, 1, 0,
        iff(name == "???", c_black, iff(side == DSide.Left, c_white, c_gray)),
        1
    );
    
    // Name Plate
    draw_set_font(fDialog_NamePlate);
    
    var nameWidth = string_width(string_hash_to_newline(name));
    var nameHeight = string_height(string_hash_to_newline(name));
    
    draw_set_color(blackColor);
    draw_roundrect_ext(
        left + 150 - nameWidth / 2 - 14,
        dialogueTop - 16 - nameHeight / 2 - 2,
        left + 150 + nameWidth / 2 + 14,
        dialogueTop - 16 + nameHeight / 2 + 2,
        2, 2, false
    );
    
    draw_set_color(c_orange);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(left + 150, dialogueTop - 16, string_hash_to_newline(name));
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}

if (portrait[DSide.Right] != noone)
{
    var name = namePlate[DSide.Right];
    
    draw_sprite_ext(
        portrait[DSide.Right],
        portraitFrame[DSide.Right],
        right - OFFSET - sprite_get_width(portrait[DSide.Right]),
        top,
        1, 1, 0,
        iff(name == "???", c_black, iff(side == DSide.Right, c_white, c_gray)),
        1
    );
    
    // Name Plate
    draw_set_font(fDialog_NamePlate);
    
    var nameWidth = string_width(string_hash_to_newline(name));
    var nameHeight = string_height(string_hash_to_newline(name));
    
    draw_set_color(blackColor);
    draw_roundrect_ext(
        right - 150 - nameWidth / 2 - 14,
        dialogueTop - 16 - nameHeight / 2 - 2,
        right - 150 + nameWidth / 2 + 14,
        dialogueTop - 16 + nameHeight / 2 + 2,
        2, 2, false
    );
    
    draw_set_color(c_orange);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(right - 150, dialogueTop - 16, string_hash_to_newline(name));
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}

// Dialogue Box
draw_set_color(whiteColor);
draw_roundrect_ext(left, dialogueTop, right, bottom, 2, 2, false);
draw_set_color(blackColor);
draw_roundrect_ext(left, dialogueTop, right, bottom, 2, 2, true);

var LINE_COUNT = 4;
var lineHeight = string_height(string_hash_to_newline("M")) + 5;
var dialogueWidth = (right - left - OFFSET * 2);
var dialogueHeight = lineHeight * LINE_COUNT;
var markerX = -1;
var markerY = -1;

if (!surface_exists(surf))
{
    surf = surface_create(dialogueWidth, dialogueHeight * 10);
}

surface_set_target(surf);
draw_clear(whiteColor);

if (type == 0)
{
    // Dialogue Text
    draw_set_font(fDialogue);
    
    var text = entry[? "value"];
    var tx = 0;
    
    for(var i = 0; i < ds_list_size(segments); ++i)
    {
        var ty = floor(tx / dialogueWidth) * lineHeight;

        var segment = segments[| i];
        switch(segment[? "type"])
        {
            
            case 0:
            {
                var partialText = segment[? "text"];
                var xx = tx % dialogueWidth;
                tx += string_width(string_hash_to_newline(partialText));
                var yy = ty;
                
                draw_set_color(segment[? "text-color"]);
                
                if (xx > 0)
                {
                    var chunk0 = "";
                    var j = 1;
                    for(; j <= string_length(partialText) &&
                        string_width(string_hash_to_newline(chunk0)) + xx < dialogueWidth;
                        ++j)
                    {
                        chunk0 += string_char_at(partialText, j);
                    }
                    
                    var chunk1 = string_copy(partialText, j, string_length(partialText) - j);
                    draw_text(xx, yy, string_hash_to_newline(chunk0));
                    draw_text_ext(0, yy + lineHeight, string_hash_to_newline(chunk1), lineHeight, dialogueWidth);
                }
                else
                    draw_text_ext(xx, yy, string_hash_to_newline(partialText), lineHeight, dialogueWidth);
                
                break;
            }
            
            case 1:
            {
                var sprite = segment[? "sprite"];
                var imageIndex = segment[? "image-index"];
                
                var spaceWidth = 1;
                var xx = tx % dialogueWidth + sprite_get_xoffset(sprite) + spaceWidth;
                tx += sprite_get_width(sprite) + spaceWidth * 2;
                var yy = ty + sprite_get_yoffset(sprite);
                
                draw_sprite(sprite, imageIndex, xx, yy);                
                break;
            }
            
        }
    }
    
    // Waiting Key Toast
    if (awaitingKey || charIndex >= string_length(text))
    {
        var ty = floor(tx / dialogueWidth) * lineHeight + 3;
        var xx = tx % dialogueWidth + OFFSET + 6;
        var yy = ty + 6;
        
        markerX = xx;
        markerY = yy;
    }
}
else
{
    // Options
    draw_set_color(blackColor);
    draw_set_font(fDialogue);
    
    var text = entry[? "value"];
    var tx = 0;
    var ty = 0;
    
    for(var i = 0; i < ds_list_size(segments); ++i)
    {
        var segment = segments[| i];
        var partialText = segment[? "text"];
        draw_text_ext(0, 0, string_hash_to_newline(partialText), -1, right - left - OFFSET * 2);
    }
    
    if (charIndex >= string_length(text))
    {
        var count = min(4, entry[? "option-count"] - windowOffset);
        for(var i = 0; i < count; ++i)
        {
            var ii = i + windowOffset;
            var xx = OFFSET + OFFSET + floor(i % 2) * ((right - left - OFFSET * 4) / 2) + 16;
            var yy = OFFSET + lineHeight + floor(i / 2) * ((bottom - dialogueTop - OFFSET * 4) / 2);
            
            draw_text(xx, yy, string_hash_to_newline(entry[? concat("option_", ii)]));

            if (ii == optionIndex)
            {
                markerX = xx - 16;
                markerY = yy + 9;
            }
        }
    }
}

surface_reset_target();
var to = max(0, (ceil(tx / dialogueWidth) - 4) * lineHeight);
draw_surface_part(
    surf,
    0, to,
    dialogueWidth, dialogueHeight,
    left + OFFSET, dialogueTop + OFFSET
);

if (markerX != -1 && markerY != -1)
{
    draw_sprite_ext(
        sDialogueFinishMarker, 0,
        left + OFFSET + markerX, dialogueTop + OFFSET + markerY - to,
        1, 1,
        get_timer() / 30000,
        c_black, 0.66
    );
    
    draw_sprite_ext(
        sDialogueFinishMarker, 0,
        left + OFFSET + markerX, dialogueTop + OFFSET + markerY - to - abs(sin(get_timer() / 600000) * 4),
        1, 1,
        get_timer() / 30000,
        c_white, 1
    );
}

draw_sprite_ext(
    sDialogueQuoteMark,
    0,
    iff(side == DSide.Left, left + 200, right - 200),
    dialogueTop,
    iff(side == DSide.Left, 1, -1),
    1, 0, c_white, 1
);


