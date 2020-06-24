/// @description Destroy the priority queue

if (ds_exists(queue, ds_type_priority)) {
	ds_priority_destroy(queue);
}