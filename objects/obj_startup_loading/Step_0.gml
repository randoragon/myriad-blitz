/// @description Load Audio Groups

#region Load audio groups

if (stage == 1) {
	audio_group_load(SFX);
	stage = 1.5;
}

if (stage == 1.5 && audio_group_load_progress(SFX) == 100) {
	stage = 2;
}

#endregion

#region Cycle

cycle = (cycle + 7) % 360;

#endregion