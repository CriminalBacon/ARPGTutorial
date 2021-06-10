/// @description ???
 
function enemyWait(){
	if (++stateWait >= stateWaitDuration)
	{
		//reset stateWait so it is ready for next time
		stateWait = 0;
		state = stateTarget;
	
	}
	
}