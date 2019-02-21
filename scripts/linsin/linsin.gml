/// @description linsin(x)
/// @param x

// This function works like sine, but it treats the graph as if the function was ragged, with straight lines /\/

var val = argument[0] % 360;
if (val <= 90) {
    return lerp(0, 1, val / 90);
} else if (val <= 180) {
    return lerp(1, 0, (val - 90) / 90);
} else if (val <= 270) {
    return lerp(0, -1, (val - 180) / 90);
} else {
    return lerp(-1, 0, (val - 270) / 90);
}
