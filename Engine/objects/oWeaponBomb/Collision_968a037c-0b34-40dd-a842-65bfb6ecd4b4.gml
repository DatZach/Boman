/// @description  Arrows detonate bombs if they're flying

if (other.hspd > 0 || other.vspd > 0)
    instance_destroy();


