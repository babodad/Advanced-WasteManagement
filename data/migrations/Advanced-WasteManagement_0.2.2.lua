for _, force in pairs(game.forces) do
	if force.technologies["awm"] and not force.technologies["awm"].researched then
        force.recipes["waste-furnace"].enabled = false
	end
end