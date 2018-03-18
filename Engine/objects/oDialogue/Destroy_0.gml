/// @description  Cleanup resources

var count = ds_list_size(dialogue);
for(var i = 0; i < count; ++i)
    ds_map_destroy(dialogue[| i]);

ds_list_destroy(dialogue);

count = ds_list_size(segments);
for(var i = 0; i < count; ++i)
    ds_map_destroy(segments[| i]);

ds_list_destroy(segments);

if (surface_exists(surf))
    surface_free(surf);


