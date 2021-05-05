/// @description Get new Tilemap

// This is done in the Room Start event to persist the collision map, from room to room
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
