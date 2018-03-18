/// @description  Set adjacent vines on fire

var inst = instance_place(x - 1, y, oVine);
if (inst != noone)
{
    with(inst)
        event_user(0);
}

inst = instance_place(x + 1, y, oVine);
if (inst != noone)
{
    with(inst)
        event_user(0);
}

inst = instance_place(x, y - 1, oVine);
if (inst != noone)
{
    with(inst)
        event_user(0);
}

inst = instance_place(x, y + 1, oVine);
if (inst != noone)
{
    with(inst)
        event_user(0);
}


