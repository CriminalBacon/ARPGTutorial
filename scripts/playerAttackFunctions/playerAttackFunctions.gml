///---------------- attackSlash ----------------

function attackSlash()
{
	
	//check to see if the attack has started
	if (sprite_index != sprPlayerAttackSlash)
	{
		//Setup correct animation
		sprite_index = sprPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
		//clear hitByAttack list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
	}
	
	calcAttack(sprPlayerAttackSlashHB);
	
	//update sprite
	playerAnimateSprite();
	
	if(animationEnd)
	{
		state = playerStateFree;
		animationEnd = false;
	}

}


///---------------- attackSpin ----------------

function attackSpin()
{


}


///---------------- calcAttack ----------------

function calcAttack(_mask_index)
{
	mask_index = _mask_index;
	
	//contains all entites that are hit this frame
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, parEntity, hitByAttackNow, false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it!
									// "|" references a particular entry of a ds_list
									// could also use ds_list_find_value(hitByAttackNow,i);
			var hitID = hitByAttackNow[| i];
			
			//check  to see if hitID has not been hit
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					if(object_is_ancestor(object_index, parEnemy))
					{
						hurtEnemy(id, 5, other.id, 10);
					}
					else if (entityHitScript != -1) script_execute(entityHitScript);
				}
				
			}
		}
	
	}
	
	//removes list from memory
	ds_list_destroy(hitByAttackNow);
	
	//set mask index back to player
	_mask_index = sprPlayer;
}


///---------------- hurtEnemy ----------------

function hurtEnemy(_enemy, _damage, _source, _knockback)
{
	with (_enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemyHP -= _damage;
			flash = 1;
			
			//hurt or dead
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			
			}
			
			image_index = 0;
			if (_knockback != 0)
			{
				var _knockDirection = point_direction(x, y, (_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
		
	}
	
	
}