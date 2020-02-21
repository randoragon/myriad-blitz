/// @description layers_swallow()
// There are certain objects (boss, obj_tooltip) that need to always be on layers with a certain name.
// This script assigns all those objects to their respective layers, and should normally be called whenever
// there's a room change.

boss.layer = layer_get_id("Mouse");
obj_tooltip.layer = layer_get_id("Tooltips");