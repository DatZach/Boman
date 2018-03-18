/// @description  DEBUG - Draw AABB

if (global.DBG_ShowAABB)
{
    draw_set_color(c_red);
    with(all)
    {
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    }
}


