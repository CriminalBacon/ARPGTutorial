/// @description
/// @function
/// @param
function dialogResponses(_response){

	switch(_response)
	{
	case 0: break;
	
	case 1: newTextBox("You gave Response A!", 1); 
			break;
			
	case 2: newTextBox("You gave Response B!\n Any further response?", 1, ["3:Yes!", "0:No."]);
			break;
			
	case 3: newTextBox("You said something else.", 0);
			break;
			
	
	default: show_debug_message("There is an unscripted break"); 
			 break;
	
	}

}