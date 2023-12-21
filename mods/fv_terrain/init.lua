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


--The rest of the terrain blocks
minetest.register_node("fv_terrain:dirt_grass", {
	description = "Grass",
	drawtype = "normal",
	tiles = { "dirt_grass_top.png", "dirt_grass_bottom.png", 
		"dirt_grass_side.png", "dirt_grass_side.png", 
		"dirt_grass_side.png", "dirt_grass_side.png"},
	groups = {oddly_breakable_by_hand = 1},
	is_ground_content = true
})

minetest.register_node("fv_terrain:stone_smooth", {
	description = "Stone",
	drawtype = "normal",
	tiles = { "stone_smooth.png" },
	groups = {oddly_breakable_by_hand = 1},
	is_ground_content = true
})

--ABMs for the basic blocks

--Replace basic nodes with their replacement nodes

--Returns "dirt_grass" or "stone_smooth" depending on surrounding nodes
local ground_to_dirt = function(pos, node, active_object_count, active_object_count_wider)
	local top = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})
	local bottom = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
	
	if fv_terrain_choices["fv_terrain:basic_ground"] then
		if (top.name == "air") and not (bottom.name == "air") and pos.y > -100 then 
			minetest.set_node(pos, {name = fv_terrain_choices["fv_terrain:basic_ground"][1]})
		else
			minetest.set_node(pos, {name = fv_terrain_choices["fv_terrain:basic_ground"][2]})
		end
	end
end

minetest.register_abm({
	nodenames = {"fv_terrain:basic_ground"},
	interval = 1,
	chance = 5,
	catch_up = true,
	action = ground_to_dirt
})

minetest.register_lbm({
	name = "fv_terrain:transform_ground_to_dirt",
	nodenames = {"fv_terrain:basic_ground"},
	run_at_every_load = false,
	catch_up = true,
	action = ground_to_dirt
})

