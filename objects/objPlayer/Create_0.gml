/// @description ???

// refers to script, so can be called at a later time
state = playerStateFree;
stateAttack = attackSlash;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;
distanceBonk = 30;
distanceBonkHeight = 8;
speedBonk = 1.5;
z = 0;

//Allows for flexibility in changing sprites
spriteRun = sprPlayerRun;
spriteIdle = sprPlayer;
spriteRoll = sprPlayerRoll;

//Animation Frame index relative to direction
localFrame = 0;

