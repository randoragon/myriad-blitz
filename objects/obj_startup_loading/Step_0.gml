/// @description load audio groups

if stage==1
{
audio_group_load(SFX);
stage=1.5;
}
if stage==1.5 && audio_group_load_progress(SFX)==100 stage=2;

///cycle
cycle=(cycle+7)%360;

