/// @description Apply Knockback & dirkb

#region Inherit parent event

event_inherited();

#endregion

#region Knockback mechanics && dirkb

if (global.gpspeed != 0 && (vkb != 0 || hkb != 0)) {
	x  += hkb;
	y  += vkb;
	hkb = home(hkb, 0, ahkb);
	vkb = home(vkb, 0, avkb);
}

#endregion