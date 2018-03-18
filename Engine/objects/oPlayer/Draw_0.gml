if (invincible && (alarm[0] % 15) < 6)
    exit;

if (global.hp <= 0)
{
    part_particles_create(
        global.dbFx_MobSmoke,
        bbox_left + (bbox_right - bbox_left) / 2,
        bbox_top + (bbox_bottom - bbox_top) / 2,
        global.dbFx_MobSmoke_Type,
        1
    );
    
    shader_set(shWhiteSprite);
    draw_self();
    shader_reset();
}
else
    draw_self();

var rot = point_direction(x, y, oCursor.x, oCursor.y);
var xx = x + lengthdir_x(16, rot);
var yy = y + lengthdir_y(16, rot);

draw_sprite_ext(sBow, 0, xx, yy, 1, 1, rot, c_white, 1);

if (mouse_check_button(mb_left))
{
    draw_sprite_ext(sArrow, 0, xx + lengthdir_x(12, rot), yy + lengthdir_y(12, rot), 1, 1, rot - 90, c_white, 1);
    
    switch(currentArrowStatusEffect)
    {
        case global.ITEM_Lantern:
            part_particles_create(
                global.dbFx_Flame,
                xx + lengthdir_x(17, rot),
                yy + lengthdir_y(17, rot),
                global.dbFx_Flame_Type,
                3
            );
            break;
            
        case global.ITEM_Bomb:
            draw_sprite_ext(sItemIcons16, 2, xx + lengthdir_x(17, rot), yy + lengthdir_y(17, rot), 0.75, 0.75, rot - 180, c_white, 1);
            break;
    }
    
    // Foresight
    draw_set_color(c_black);
    draw_primitive_begin(pr_linestrip);
    
    xx = x + lengthdir_x(28, rot);
    yy = y + lengthdir_y(28, rot);
    
    var angle = rot;
    var hspd = lengthdir_x(strength, angle);
    var vspd = lengthdir_y(strength, angle);
    
    for(var i = 0; i < 100; ++i)
    {
        xx += hspd;
        yy += vspd;
        
        hspd += 0.3 *  cos(270 * pi / 180);
        vspd += 0.3 * -sin(270 * pi / 180);
        
        draw_vertex(xx, yy);
        
        if (hspd != 0 && vspd != 0)
            angle = CalculateSmoothAngle(hspd, vspd, angle);
        
        var cx = xx + lengthdir_x(6, angle);
        var cy = yy + lengthdir_y(6, angle);
        
        // DEBUG Uncomment the code below if you want to see the arrow position at each step
        //draw_sprite_ext(sArrow, 0, xx, yy, 1, 1, angle - 90, c_white, 0.75);
        //draw_circle(cx, cy, 2, false);
        
        if (collision_circle(cx, cy, 2, pStaticSolid, false, true) != noone)
            break;
    }
    
    draw_primitive_end();
}


