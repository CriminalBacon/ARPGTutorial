/// @description Update camera

// Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
// moves camera by 15%
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);


//Screen Shake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

//removes a fraction of shakeMagnitude from shakeRemain every frame
shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

//position camera where instance is located
camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);

