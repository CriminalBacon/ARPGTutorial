/// @description ???

// refers to script, so can be called at a later time
state = playerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

//Allows for flexibility in changing sprites
spriteRun = sprPlayerRun;
spriteIdle = sprPlayer;
spriteRoll = sprPlayerRoll;

//Animation Frame index relative to direction
localFrame = 0;

