//if (enabled)
{
    // Do horizontal blur first
    surface_set_target(surf[1]);
    if (enabled) shader_set(shGaussianHorizontal);
        shader_set_uniform_f(uni_resolution_hoz, var_resolution_x, var_resolution_y);
        shader_set_uniform_f(uni_blur_amount_hoz, intensity * 2);
        draw_surface(surf[2], 0, 0);
    shader_reset();
    surface_reset_target();
    
    // Do vertical blur last
    surface_set_target(surf[0]);
    if (enabled) shader_set(shGaussianVertical); 
        shader_set_uniform_f(uni_resolution_vert, var_resolution_x, var_resolution_y);
        shader_set_uniform_f(uni_blur_amount_vert, intensity * 2);
        draw_surface(surf[1], 0, 0);
    shader_reset();
    surface_reset_target();
    
    // Grayscale
    if (enabled) shader_set(shGrayscale);
        shader_set_uniform_f(uni_grayscale_fade, intensity);
        draw_surface(surf[0], 0, 0);
    shader_reset();
}

