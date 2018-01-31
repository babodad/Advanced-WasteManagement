function getIngredients(recipe)
    local ingredients = {}
    for _,ing in pairs(recipe.ingredients) do
       if (ing.name and ing.amount) then
          ingredients[ing.name] = ing.amount
       elseif (ing[1] and ing[2]) then
          ingredients[ing[1]] = ing[2]
       end
    end
    return ingredients
 end

 function getProducts(recipe)
    local products = {}
    if (recipe.results) then
       for i,product in pairs(recipe.results) do
          if (product.name and product.amount) then
             products[product.name] = product.amount
          end
       end
    elseif (recipe.result) then
       local amount = 1
       if (recipe.result_count) then
          amount = recipe.result_count
       end
       products[recipe.result] = amount
    end
    return products
 end
 
 function getRecipes(item)
    local recipes = {}
    for i,recipe in pairs(data.raw.recipe) do
       local products = getProducts(recipe)
       for product,amount in pairs(products) do
          if (product == item) then
             table.insert(recipes, recipe)
          end
       end
    end
    return recipes
 end


function calcFuel(item_name, i)
    local copper
    local iron
    local fuel

    local ingredients = data.raw.recipe[item_name].ingredients
        if ingredients then           
            for _, ing in pairs(ingredients) do                
                local name
                local amount
                if (ing.name and ing.amount) then
                    name = ing.name
                    amount = ing.amount
                end
                elseif (ing[1] and ing[2]) then
                    name = ing[1]
                    amount = ing[2]
                end             
                for n, value in pairs(ingr) do
                    if (n % 2 ~= 0) then -- if odd -> item-name
                        --Scan for metals
                        if value == "iron-plate" then
                            iron = iron + ingr[n+1]
                            log("\t" .. "contains "  .. serpent.line(ingr[n+1]) .. " iron" ) 
                        end
                        elseif value == "steel-plate" then
                            iron = iron + 2*ingr[n+1]
                            log("\t" .. "contains "  .. serpent.line(ingr[n+1]) .. " steel" ) 
                        end
                        elseif value == "copper-plate" then
                            copper = copper + ingr[n+1]
                            log("\t" .. "contains "  .. serpent.line(ingr[n+1]) .. " copper" ) 
                        end
                        --Scan for incinerator-fuel
                        elseif value == "plastic-bar" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*10) ) 
                            fuel = fuel + ingr[n+1]*10
                        end
                        elseif value == "electronic-circuit" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*5) ) 
                            fuel = fuel + ingr[n+1]*5
                        end
                        elseif value == "sulfur" then
                            flammable = true
                            log("\t" .. "Flame-Value:" .. serpent.line(ingr[n+1]*30) ) 
                            fuel = fuel + ingr[n+1]*15
                        end
                        elseif i < 5
                            log("\t" .. "iron : "  .. iron .. " / copper: " copper .. " / copper: " .. fuel)  
                            log("\t" .. "scanning layer "  .. i+1 .. " of " serpent.line(value)) 
                            add_iron, add_copper, add_fuel = getIngredients(item_name, i+1)
                            log("\t" .. "iron : "  .. iron .. " / copper: " copper .. " / copper: " .. fuel)  
                            log("\t" .. "addiron : "  .. add_iron .. " / addcopper: " add_copper .. " / addcopper: " .. add_fuel)
                        end
                         



                    end




end

function addFuel(Items, item_type)
    for item_name, values in pairs(Items) do        
        -- log("Item-Name:")
        -- log(serpent.block(item_name))        
        -- log("Values:")
        -- for title, value in pairs(values) do
        --     log("\t" .. serpent.line(title) .. " = " .. serpent.line(value) )
        -- end        
        -- log("Recipe:")
        local recipe = data.raw.recipe[item_name]
        local ingredients = {}
        local flammable = false
        local flame_value = 0
        local metal = false
        local madeof = "" --temp variable for recipe output below
        if recipe then -- if recipe exists
            local ingredients = recipe.ingredients
            if ingredients then   
                madeof = ingredients             
                for _, ingr in pairs(ingredients) do
                    -- log("\t" .. serpent.line(ingr) )                    
                    for n, value in pairs(ingr) do
                        -- log("\t" .. serpent.line(value) )
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


                        if value == "steel-plate" then
                            metal = true
                            log("\t" .. "contains metal")
                        end
                        if value == "iron-plate" then
                            metal = true
                            log("\t" .. "contains metal")
                        end
                        if value == "copper-plate" then
                            metal = true
                            log("\t" .. "contains metal")
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
            log("Item-Name:")
            log(serpent.block(item_name))  
            log("\t" .. serpent.line(madeof) ) 
            data.raw[item_type][item_name].fuel_category = "incinerator"
            data.raw[item_type][item_name].fuel_value = flame_value .. "MJ"
        end
        if metal then
            data.raw[item_type][item_name].burnt_result = "incinerator-ash"
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

-- addFuel(data.raw.item, "item")
-- addFuel(data.raw.module, "module")
-- addFuel(data.raw.ammo, "ammo")
-- addFuel(data.raw.capsule, "capsule")
-- addFuel(data.raw.armor, "armor")
-- addFuel(data.raw.tool, "tool")

data.raw.recipe[item_name]

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