if (image_alpha < 0)
    instance_destroy();

image_alpha -= fade;
direction += spin * 0.5;
image_angle -= spin;
image_xscale += expand;
image_yscale += expand;


