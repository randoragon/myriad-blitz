/// @description part_system_exists_pro(system)
/// @param system
function part_system_exists_pro() {

	return ds_exists(argument[0], ds_type_grid);


}
