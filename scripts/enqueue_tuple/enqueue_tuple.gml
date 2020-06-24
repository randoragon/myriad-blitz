/// @description enqueue_tuple(queue, val1, val2, 'priority)
/// @param queue
/// @param val1
/// @param val2
/// @param 'priority

var t = [argument[1], argument[2]];
ds_priority_add(argument[0], t, (argument_count < 4)? 0 : argument[3]);