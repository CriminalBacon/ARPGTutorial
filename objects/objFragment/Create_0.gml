/// @description 

bounce = 0;
deteriorate = 0;
z = 0;
spd = 0;
fric = 0;
image_speed = 0;
//assign random image frame
image_index = irandom(image_number-1);

//get collision map
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

//randomly flip horizontally and/or vertically
image_xscale = choose(-1, 1);
image_yscale = choose(-1, 1);