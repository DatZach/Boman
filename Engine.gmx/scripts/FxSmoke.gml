/// FxSmoke(x, y, count);

{
    var xx = argument0;
    var yy = argument1;
    var count = argument2;
    
    if (count == 1)
    {
        var inst = instance_create(xx, yy, oFxSmoke);
        with(inst)
            motion_set(90, max(random(1), 0.1));
    }
    else
    {
        var dir = 0;
        repeat(count)
        {
            var inst = instance_create(xx, yy, oFxSmoke);
            with(inst)
                motion_set(dir, max(random(3), 0.75));
            
            dir += 360 / count;
        }
    }
}

