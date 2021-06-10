// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprite
sprMove = sprSlime;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = slimeWander;
enemyScript[ENEMYSTATE.CHASE] = slimeChase;