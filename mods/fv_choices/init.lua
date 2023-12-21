--The global tables for choices made by the player
--Choices are made of the name of the node to be replaced for the key and the 
--replacement node for the value
fv_terrain_choices = {["fv_terrain:basic_ground"] = {"fv_terrain:dirt_grass", "fv_terrain:stone_smooth"}}


local function make_choice_formspec(choices)
	--Choices is formatted like this: 
	--{{name[string], image[string], node[string], replacement_nodes[table][strings]},
	--{name[string], image[string], node[string], replacement_nodes}}
	
	local formspec - {
	"formspec_version[6]",
	"size[10,9]",
	"image_button[0,0;5,8.1;", choices[1].image, ";grass_button;", choices[1].name, ";false;true]",
	"image_button[5,0;5,8.1;", choices[2].image, ";ash_button;", choices[2].name, ";false;true]",
	"button_exit[0,8.1;10,0.9;submit_button;Confirm choice]"
	}
	
	return table.concat(formspec, "")
end

local function choice_formspec(choices)
	--Choices is formatted like this: 
	--{{name[string], image[string], node[string], replacement_nodes[table][strings]},
	--{name[string], image[string], node[string], replacement_nodes}}
	
	local formspec - {
	"formspec_version[6]",
	"size[10,9]",
	"image_button[0,0;5,8.1;", choices[1].image, ";grass_button;", choices[1].name, ";false;true]",
	"image_button[5,0;5,8.1;", choices[2].image, ";ash_button;", choices[2].name, ";false;true]",
	"button_exit[0,8.1;10,0.9;submit_button;Confirm choice]"
	}
	
	local formspec = table.concat(formspec, "")
end
