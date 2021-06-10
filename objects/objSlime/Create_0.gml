// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprite
sprMove = sprSlime;
sprAttack = sprSlimeAttack;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = slimeWander;
enemyScript[ENEMYSTATE.CHASE] = slimeChase;
enemyScript[ENEMYSTATE.ATTACK] = slimeAttack;