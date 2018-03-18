action_inherited();
PLAYER_NUMBER = 2;

hardSurface = false;

moveLeft = false;
moveRight = false;
moveUp = false;
moveDown = false;
moveJump = false;

flamePoints = ds_list_create();
aflame = false;
invincible = false;
canDie = false;
maxHp = 0;
hp = 0;
level = 0;
dropRate = 0;
group = "";
dying = false;

alarm[0] = room_speed * 0.5;


