-- function get_ItemType(name)
--     local item_types = {"ammo", "armor", "capsule", "fluid", "gun", "item", "mining-tool", "module", "tool", "item-with-entity-data"}
--     local item_type = nil
--     for i, type_name in pairs(item_types) do
--       if data.raw[type_name][name] then item_type = type_name end
--     end
--     return item_type
--   end


function addFuel(Items, item_type)
    for item_name, values in pairs(Items) do        
        log("Item-Name:")
        log(serpent.block(item_name))        
        log("Values:")
        for title, value in pairs(values) do
            log("\t" .. serpent.line(title) .. " = " .. serpent.line(value) )
        end        
        log("Recipe:")
        local recipe = data.raw.recipe[item_name]
        local ingredients = {}
        local flammable
        local flame_value = 0
        if recipe then -- if recipe exists
            local ingredients = recipe.ingredients
            if ingredients then                
                for _, ingr in pairs(ingredients) do
                    log("\t" .. serpent.line(ingr) )
                    for n, value in pairs(ingr) do
                        log("\t" .. serpent.line(value) )
                        if value == "plastic-bar" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*10) ) 
                            flame_value = flame_value + ingr[n+1]*10
                        end
                        if value == "electronic-circuit" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*10) ) 
                            flame_value = flame_value + ingr[n+1]*10
                        end
                        if value == "advanced-circuit" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*20) ) 
                            flame_value = flame_value + ingr[n+1]*20
                        end
                        if value == "processing-unit" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*40) ) 
                            flame_value = flame_value + ingr[n+1]*40
                        end
                        if value == "battery" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*30) ) 
                            flame_value = flame_value + ingr[n+1]*30
                        end
                        if value == "explosives" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*15) ) 
                            flame_value = flame_value + ingr[n+1]*15
                        end
                        -- if value == "coal" then
                        --     flammable = true
                        --     log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*10) ) 
                        --     flame_value = flame_value + ingr[n+1]*10
                        -- end
                    end                    
                end
            end
        end
        if flammable then
            data.raw[item_type][item_name].fuel_category = "incinerator"
            data.raw[item_type][item_name].fuel_value = flame_value .. "MJ"
        end

        
            -- log("key: " .. key .. " value: " .. value)
        -- local recipe = data.raw.recipe[recipe_name]
        -- if recipe then 
        --     get_ItemType()
        --     -- data.raw.item[recipe_name].fuel_category = {"chemical"} 
        --     data.raw.item[recipe_name], {fuel_category = "chemical"})
        --     data.raw.item[recipe_name], {fuel_value = "1.0GJ"})
        --     -- data.raw.item[recipe_name].fuel_value = {"1.0GJ"}
        -- end
    end
end
    

log ("Test")

addFuel(data.raw.item, "item")
addFuel(data.raw.module, "module")
addFuel(data.raw.ammo, "ammo")
addFuel(data.raw.capsule, "capsule")
addFuel(data.raw.armor, "armor")
addFuel(data.raw.tool, "tool")


--  addRecipes(data.raw.ammo)				--Create recipes for all ammunitions
--  addRecipes(data.raw.armor)				--Create recipes for all armors
				--Create recipes for all items
--  addRecipes(data.raw.gun)				--Create recipes for all weapons
-- addRecipes(data.raw.capsule)			--Create recipes for all capsules
-- addRecipes(data.raw.module)				--Create recipes for all modules
-- addRecipes(data.raw.tool)				--Create recipes for all forms of science packs
-- addRecipes(data.raw["rail-planner"])	--Create recipe for rail. Seriously, just rail.
-- addRecipes(data.raw["mining-tool"])		--Create recipes for all mining tools
-- addRecipes(data.raw["repair-tool"]) 	--Create recipes for all repair tools
-- data.raw.item["iron-chest"].fuel_category = "chemical"
-- data.raw.item["iron-chest"].fuel_value = "1.0GJ"
-- -- table.insert(data.raw.ammo["flamethrower-ammo"], {fuel_category = "chemical"})
-- -- table.insert(data.raw.ammo["flamethrower-ammo"], {fuel_value = "1.0GJ"})
-- data.raw.ammo["flamethrower-ammo"].fuel_category = "chemical"
-- data.raw.ammo["flamethrower-ammo"].fuel_value = "1.0GJ"