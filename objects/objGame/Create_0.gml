/// @description Initialize and globals

randomize();

global.gamePaused = false;

//initializes camera, can be any coords
global.iCamera = instance_create_layer(0,0, layer, objCamera);

room_goto(ROOM_START);
