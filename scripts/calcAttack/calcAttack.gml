/// @description use Attack hitbox and check for hits
/// @function
/// @param
function calcAttack(_mask_index){
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
					image_blend = c_red;
				
				}
				
			}
		}
	
	}
	
	//removes list from memory
	ds_list_destroy(hitByAttackNow);
	
	//set mask index back to player
	_mask_index = sprPlayer;
}