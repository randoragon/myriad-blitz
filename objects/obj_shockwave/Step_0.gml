/// @description skip if loading
if global.loading==1 exit;

///radius increasement and despawn
radius+=maxradius/time;
if image_alpha<=0
if radius>=maxradius {
instance_destroy();
}

