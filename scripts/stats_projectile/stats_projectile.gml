/// @description stats_projectile(type, dmg, pen, kb);
/// @param type
/// @param dmg
/// @param pen
/// @param kb
function stats_projectile() {

	switch (argument[0]) {
	    case "p": case "P":
	        pdmg = argument[1];
	        ppen = argument[2];
	        pkb  = argument[3];
	    break;
	    case "f": case "F":
	        fdmg = argument[1];
	        fpen = argument[2];
	        fkb  = argument[3];
	    break;
	    case "c": case "C":
	        cdmg = argument[1];
	        cpen = argument[2];
	        ckb  = argument[3];
	    break;
	}



}
