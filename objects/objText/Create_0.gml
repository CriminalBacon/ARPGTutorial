/// @description ???

//screen relative resolutions
//"draws" a line in the middle of the screen and extends left and right based
//on the amount of text needed
x1 = RESOLUTION_W / 2;
y1 = RESOLUTION_H - 70;
x2 = RESOLUTION_W / 2;
y2 = RESOLUTION_H;

//where the box will end up
x1Target = 0;
x2Target = RESOLUTION_W;

//number between 0 and 1 based on how much of the animation is complete
lerpProgress = 0;
//the number of characters shown in message
textProgress = 0;

textMessage = "Default message text";

//which background to use for the text box
background = 0;
