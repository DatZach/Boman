if (global.gamePaused) exit;

if (mouse_button == mb_left)
    image_angle += median(1, point_distance(oPlayer.x, oPlayer.y, mouse_x, mouse_y) / 50, 4);

x = mouse_x;
y = mouse_y;
