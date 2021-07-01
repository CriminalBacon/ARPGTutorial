
function hurtPlayer(_direction, _force, _damage){
	
	if(objPlayer.invulnerable <= 0)
	{
		global.playerHealth = max(0, global.playerHealth - _damage);
		
		if(global.playerHealth > 0)
		{
			with(objPlayer)
			{
				state = playerStateBonk;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				screenShake(2, 10);
				flash = 0.7;
				invulnerable = 60
				flashShader = shRedFlash;
			}
		
		}
		else 
		{
			//kill the player
		
		}
	
	}

}