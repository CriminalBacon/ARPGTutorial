/// @description
/// @function
/// @param
function attackSlash(){
	
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