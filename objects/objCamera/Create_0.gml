/// @description Setup Camera

//get current camera id
cam = view_camera[0];
follow = objPlayer;

viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;

//coords where the camera is heading to
xTo = xstart;
yTo = ystart;

//how long the shake will be
shakeLength = 0;

//how strong the shake will be
shakeMagnitude = 0;

//how much of the shake is left
shakeRemain = 0;