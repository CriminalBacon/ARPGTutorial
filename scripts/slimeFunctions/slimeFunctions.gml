/// ---------- slimeAttack ----------
 
function slimeAttack()
{
	
	//how fast to move
	var _spd = enemySpeed;
	
	//don't move while getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//freeze animation while in mid-air and also afer landing finishes
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	
	//how far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing end of the animation once were nearly done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	//move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);  //faces the correct direction
		
		//Commit to move and stop moving if we hit a wall
		if (enemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
			
		}
	
	}
	else
	{
		//leap to position
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	
	}
	


}
	
/// ---------- slimeChase ---------- 
 
function slimeChase()
{
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		
		
		}
		//face the correct direction
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//collide and move
		enemyTileCollision();
	}
	
	//check if close enough to launch an attack
	if (instance_exists(target) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius))
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0
		//target 8px past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	
	
	}
	
}
	
	
/// ---------- slimeWander ----------
 
function slimeWander()
{
	sprite_index = sprMove;
	
	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed) //if enemy constantly runs into wall
	{
		hSpeed = 0;
		vSpeed = 0;
		//End our move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		//set new Target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
			
		}
		
	}
	
	
	//Move towards new destination	
	else	
		{
			timePassed++;
			image_speed = 1.0;
			var _distanceToGo = point_direction(x, y, xTo, yTo);
			var _speedThisFrame = enemySpeed;
			//if we are going to overshoot the destination, just goto destination
			if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
			dir = point_direction(x, y, xTo, yTo);
			hSpeed = lengthdir_x(_speedThisFrame, dir);
			vSpeed = lengthdir_y(_speedThisFrame, dir);
			
			if (hSpeed != 0) image_xscale = sign(hSpeed);
			
			//Collide & move
			//could also just call enemyTileCollision();
			var _collided = enemyTileCollision();
	
		}
		
	//check for aggro
	if(++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(objPlayer) && (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius))
		{
			state = ENEMYSTATE.CHASE;
			target = objPlayer;
		
		}
	
	
	}
}

/// ---------- slimeHurt ----------

function slimeHurt()
{
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//collide & move, if there is a collision then stop knockback
		if (enemyTileCollision())
		{
			xTo = x;
			yTo = y;
		}
	
	}
	else
	{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
	

}

/// ---------- slimeDie ----------
function slimeDie()
{


}