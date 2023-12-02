--A standard hand that can mine things


minetest.register_item(":", {
	type = "none",
	wield_image = "basic_hand.png",
	wield_scale = {x = 0.5, y = 1, z = 4},
	tool_capabilities = {
		full_punch_interval = 0.3,
		maxlevel = 1,
		groupcaps = {
			oddly_breakable_by_hand = {
				times = {[1] = 0.2},
				uses = 0
			}
		},
		damage_groups = {fleshy = 1}
	}
})