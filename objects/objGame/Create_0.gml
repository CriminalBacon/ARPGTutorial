/// @description Initialize and globals

randomize();

global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

//initializes camera, can be any coords
global.iCamera = instance_create_layer(0,0, layer, objCamera);

//resizes application surface to the defined resolution and not the size of the actual window
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);
