--The starting blocks for the worldgen

minetest.register_node("fv_terrain:basic_ground", {
	description = "Basic ground node",
	drawtype = "normal",
	tiles = { "basic_ground.png" },
	groups = {oddly_breakable_by_hand = 1},
	is_ground_content = true
})

minetest.register_node("fv_terrain:basic_water_source", {
	description = "Basic ocean/lake node",
	drawtype = "normal",
	tiles = { "basic_ground.png" },
	groups = {oddly_breakable_by_hand = 1},
	is_ground_content = true
})

minetest.register_node("fv_terrain:basic_river_water_source", {
	description = "Basic river water node",
	drawtype = "normal",
	tiles = { "basic_ground.png" },
	groups = {oddly_breakable_by_hand = 1},
	is_ground_content = true
})

minetest.register_alias("mapgen_stone", "fv_terrain:basic_ground")
minetest.register_alias("mapgen_water_source", "fv_terrain:basic_water_source")
minetest.register_alias("mapgen_river_water_source", "fv_terrain:basic_river_water_source")