enabled = true;
intensity = 0;
targetIntensity = 0;

// Grayscale
uni_grayscale_fade = shader_get_uniform(shGrayscale, "fade");

// Blur
uni_resolution_hoz = shader_get_uniform(shGaussianHorizontal, "resolution");
uni_resolution_vert = shader_get_uniform(shGaussianVertical, "resolution");
var_resolution_x = VIEW_WIDTH;// / VIEW_SCALE;
var_resolution_y = VIEW_HEIGHT;// / VIEW_SCALE;

uni_blur_amount_hoz = shader_get_uniform(shGaussianHorizontal, "blur_amount");
uni_blur_amount_vert = shader_get_uniform(shGaussianVertical, "blur_amount");

show_debug_message(concat(VIEW_WIDTH, " = ", __view_get( e__VW.WView, 0 )));
show_debug_message(concat(VIEW_HEIGHT, " = ", __view_get( e__VW.HView, 0 )));

//surf[0] = surface_create(view_wview[0] / VIEW_SCALE, view_hview[0] / VIEW_SCALE);
//surf[1] = surface_create(view_wview[0] / VIEW_SCALE, view_hview[0] / VIEW_SCALE);
//surf[2] = surface_create(view_wview[0] / VIEW_SCALE, view_hview[0] / VIEW_SCALE);

surf[0] = surface_create(VIEW_WIDTH, VIEW_HEIGHT);
surf[1] = surface_create(VIEW_WIDTH, VIEW_HEIGHT);
surf[2] = surface_create(VIEW_WIDTH, VIEW_HEIGHT);

