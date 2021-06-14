// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprite
sprMove = sprSlime;
sprAttack = sprSlimeAttack;
sprHurt = sprSlimeHurt;
sprDie = sprSlimeDie;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = slimeWander;
enemyScript[ENEMYSTATE.CHASE] = slimeChase;
enemyScript[ENEMYSTATE.ATTACK] = slimeAttack;
enemyScript[ENEMYSTATE.HURT] = slimeHurt;
enemyScript[ENEMYSTATE.DIE] = slimeDie;