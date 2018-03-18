/// @description  Update target

value = lerp(value, target, 0.08);
if (value < 0.05 && target == 0)
{
    instance_destroy();
    exit;
}

if (value > 0.95 && target == 1 && alarm[0] < 0)
    alarm[0] = room_speed * 3;


