if (delay < 1)
    instance_destroy();

image_index = iff(image_index == 0, 1, 0);
image_xscale *= 1.025;
image_yscale = image_xscale;

delay *= 0.75;
alarm[0] = delay;


