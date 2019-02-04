/// @description destroy sprites
if sprite_index!=noone
{
for(var i=0; i<array_length_1d(cut1); i++)
{sprite_delete(cut1[i]); cut1[i]=-4;}

for(var i=0; i<array_length_1d(cut2); i++)
{sprite_delete(cut2[i]); cut2[i]=-4;}
}

