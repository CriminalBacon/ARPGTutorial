/// @description Draw Health
// You can write your code in this editor

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);

// get _playerHealth as a whole integer
_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	// returns 1 or 0, which determines a empty or whole heart
	var _imageIndex = (i > _playerHealth); 
	
	// figure out if we need a fraction of a heart
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);		
	}
	
	draw_sprite(sprHealth, _imageIndex, 8 + ((i - 1) * 16), 8);
	
}