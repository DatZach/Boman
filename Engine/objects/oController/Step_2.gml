/// @description  Handle Camera

if (instance_exists(oPlayer))
{
    var viewCenterX = oPlayer.x - __view_get( e__VW.WView, 0 ) / 2;
    var viewCenterY = oPlayer.y - __view_get( e__VW.HView, 0 ) / 2;
    var newCamX = 0;
    var newCamY = 0;
    var mx = oCursor.x;
    var my = oCursor.y;
    
    var len = point_distance(oPlayer.x, oPlayer.y, mx, my);
    var dir = point_direction(oPlayer.x, oPlayer.y, mx, my);
    newCamX = lengthdir_x(len * 0.25, dir);
    newCamY = lengthdir_y(len * 0.25, dir);

    __view_set( e__VW.XView, 0, floor(lerp(__view_get( e__VW.XView, 0 ), viewCenterX + newCamX, 0.45 )));
    __view_set( e__VW.YView, 0, floor(lerp(__view_get( e__VW.YView, 0 ), viewCenterY + newCamY, 0.45 )));
}


