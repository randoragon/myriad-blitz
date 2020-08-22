/// @description part_system_exists_ult(system)
/// @param system
function part_system_exists_ult() {

	return ds_exists(argument[0], ds_type_grid);


}
