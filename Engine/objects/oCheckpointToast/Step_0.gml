/// @description  Update text animation

intensity = lerp(intensity, targetIntensity, 0.05);

if (incLength)
{
    length += 0.75;
    if (length > string_length(MESSAGE) * 6)
        targetIntensity = 0;
}

if (intensity < 0.05)
    instance_destroy();


