/// @description 
/// @function
/// @param
function roomTransition(_type, _targetRoom){

	//Check to see if there is already a transition happening
	if (!instance_exists(objTransition))
	{
		//using -9999, so we shouldn't set anyting lower than that.  This will draw overtop everthing
		with (instance_create_depth(0, 0, -9999, objTransition))
		{
			type = _type;
			target = _targetRoom;
			
		
		
		}
	
	} else show_debug_message("Trying to transition while transition is happening!!");

}