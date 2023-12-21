--The global tables for choices made by the player
--Choices are made of the name of the node to be replaced for the key and the 
--replacement node for the value
--fv_terrain_choices = {["fv_terrain:basic_ground"] = {"fv_terrain:dirt_grass", "fv_terrain:stone_smooth"}}
fv_terrain_choices = {}


fv_choices = { basic = {
		{ name = "Temperate", image = "dirt_grass_side.png", node = "fv_terrain:basic_ground", replacement_nodes = {"fv_terrain:dirt_grass", "fv_terrain:stone_smooth"}},
		{ name = "Volcanic", image = "stone_dark.png", node = "fv_terrain:basic_ground", replacement_nodes = {"fv_terrain:stone_rough", "fv_terrain:stone_dark"}}
	}
	}

local current_choice = "basic"
local current_pick = 1

local function make_choice_formspec(choices)
	--Choices is formatted like this: 
	--{{name[string], image[string], node[string], replacement_nodes[table][strings]},
	--{name[string], image[string], node[string], replacement_nodes}}
	
	local formspec = {
	"formspec_version[6]",
	"size[10,9]",
	"image_button[0,0;5,8.1;", choices[1].image, choices[1].name, choices[1].name, ";false;true]",
	"image_button[5,0;5,8.1;", choices[2].image, choices[2].name, choices[2].name, ";false;true]",
	"button_exit[0,8.1;10,0.9;submit_button;Confirm choice]"
	}
	
	return table.concat(formspec, "")
end

local function choice_formspec(choices, player)
	--Choices is formatted like this: 
	--{{name[string], image[string], node[string], replacement_nodes[table][strings]},
	--{name[string], image[string], node[string], replacement_nodes}}
	
	local f = {
	"formspec_version[6]",
	"size[10,9]",
	"image_button[0,0;5,8.1;", choices[1].image, ";left;", choices[1].name, ";false;true]",
	"image_button[5,0;5,8.1;", choices[2].image, ";right;", choices[2].name, ";false;true]",
	"button_exit[0,8.1;10,0.9;submit_button;Confirm choice]"
	}
	
	local formspec = table.concat(f, "")
	
	--Sends the formspec to the player
	minetest.show_formspec(player, "fv_choices:choice", formspec)
	
end

--demo formspec
local demo_formspec = [[ formspec_version[6]
size[10.5,11]
button_exit[3.7,9.6;3,0.8;;Okay]
textarea[0.8,0.7;9,8.4;;;This is game is basically a proof of concept. There is about 2 minutes of gameplay\, so playing this game should be very easy. Simply wait for the choice menu to show up\, choose an option\, and watch the world change around you, and have a wonderful day. Merry Christmas!]
]]

--Sends a "this is a demo" formspec to the player after they join
local demo = function(player)
	minetest.show_formspec(player, "fv_choices:demo", demo_formspec)
end

local send_choice = function(player)
	
end


--When a player joins, wait for a couple of seconds, then send them the demo formspec
minetest.register_on_joinplayer(function(ObjectRef, last_login)
		minetest.after(1, demo, ObjectRef.get_player_name(ObjectRef))
	end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	--Send the choice formspec after the demo formspec is closed
	if formname == "fv_choices:demo" then
		minetest.after(2.5, choice_formspec, fv_choices[current_choice], player.get_player_name(player))
	end
	
	--Change the 
	if formname == "fv_choices:choice" then
		local c = fv_choices[current_choice]
		--minetest.chat_send_all(dump2(c))
		--minetest.chat_send_all(c)
		
		--minetest.chat_send_all("choice formspec sent")
		--minetest.chat_send_all(dump2(fields)) --fields[fv_choices[current_choice][1].name])
		if fields["left"] == c[1].name then
			--minetest.chat_send_all("left")
			fv_terrain_choices[c[1]["node"]] = c[1].replacement_nodes
		elseif fields["right"] == c[2].name then
			--minetest.chat_send_all("right")
			fv_terrain_choices[c[2]["node"]] = c[2].replacement_nodes
		end
		--minetest.chat_send_all(dump2(fv_terrain_choices))
		
	end
end
)