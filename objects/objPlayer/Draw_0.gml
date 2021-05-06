/// @description ???

//using draw_sprite_ext so we have access to all of the other varibles at a later time
//y-z is used to show height

//draw shadow
draw_sprite(sprShadow, 0, floor(x), floor(y));

//uses floor to fix any sub pixel draw issues
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)