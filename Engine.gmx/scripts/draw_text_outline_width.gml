///draw_text_outline(x,y,str,outwidth,outcol,outfidelity,lineWidth)
//Created by Andrew McCluskey http://nalgames.com/
//x,y: Coordinates to draw
//str: String to draw
//outwidth: Width of outline in pixels
//outcol: Colour of outline (main text draws with regular set colour)
//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

var dto_dcol=draw_get_color();
var lineHeight = string_height('W');
var xx = argument0;
var yy = argument1;
draw_set_color(argument4);

for(var dto_i = 45; dto_i < 405; dto_i += 360 / argument5)
{
    draw_text_ext(round(xx + lengthdir_x(argument3, dto_i)), round(yy + lengthdir_y(argument3, dto_i)), argument2, lineHeight, argument6);
}

draw_set_color(dto_dcol);

draw_text_ext(round(xx), round(yy), argument2, lineHeight, argument6);

