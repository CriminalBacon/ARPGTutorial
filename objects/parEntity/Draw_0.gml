/// @description

if(entityShadow) draw_sprite(sprShadow, 0, floor(x), floor(y));

if (flash != 0)
{
	//shader_set is expensive, so only use where necessary
	shader_set(shWhiteFlash)
	shader_set_uniform_f(uFlash, flash);
}

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

//check to see if a shader is set
if (shader_current() != -1) shader_reset();
