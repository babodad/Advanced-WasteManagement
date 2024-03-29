function getIngredients(recipe)
    local ingredients = {}
    if recipe.ingredients then
        for _,ing in pairs(recipe.ingredients) do
            if (ing.name and ing.amount) then
                ingredients[ing.name] = ing.amount
            elseif (ing[1] and ing[2]) then
                ingredients[ing[1]] = ing[2]
            end
        end        
    elseif recipe.normal.ingredients then
        for _,ing in pairs(recipe.normal.ingredients) do
            if (ing.name and ing.amount) then
                ingredients[ing.name] = ing.amount
            elseif (ing[1] and ing[2]) then
                ingredients[ing[1]] = ing[2]
            end
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

function getRecipe(item)
    local recipes = {}
    for i,recipe in pairs(data.raw.recipe) do
       local products = getProducts(recipe)
       for product,amount in pairs(products) do
          if (product == item) then
            return recipe
          end
       end
    end    
end

function CalcFuel(name, amount)
    local iron = 0
    local copper = 0
    local fuel = 0

    if name == "iron-plate" then
        iron = amount    
    elseif name == "steel-plate" then
        iron = 2*amount    
    elseif name == "copper-plate" then
        copper = amount

    --Scan for incinerator-fuel
    elseif name == "electronic-circuit" then 
        fuel = 5*amount    
    elseif name == "plastic-bar" then
        fuel = 10*amount    
    elseif name == "sulfur" then
        fuel = 15*amount
    elseif name == "coal" then
        fuel = 5*amount
    end
    return iron, copper, fuel
end

function scanItem(item_name, iteration)    
    local iron = 0
    local copper = 0
    local fuel = 0      
    local recipe = data.raw.recipe[item_name]
    -- local recipe = getRecipe(item_name) -- doesn't work properly
    if recipe then
        for name,amount in pairs(getIngredients(recipe)) do
            local i = iteration            
            -- log("\t" .. "Layer " .. i .. "- item: " .. name)
            local add_iron = 0
            local add_copper = 0
            local add_fuel = 0
            -- add_iron, add_copper, add_fuel = CalcFuel(name, amount)
            if name == "iron-plate" then
                add_iron = 1*amount    
            elseif name == "steel-plate" then
                add_iron = 2*amount    
            elseif name == "copper-plate" then
                add_copper = 1*amount        
            --Scan for incinerator-fuel:
            elseif name == "electronic-circuit" then 
                add_fuel = 0.1*amount  
                add_copper = 1.5*amount  
                add_iron = 1*amount   
            elseif name == "plastic-bar" then
                add_fuel = 10*amount    
            elseif name == "sulfur" then
                add_fuel = 15*amount
            elseif name == "sulfuric-acid" then
                add_fuel = 1*amount
            elseif name == "coal" then
                add_fuel = 8*amount
            --scan next recipe layer:
            elseif (add_iron + add_copper + add_fuel == 0) and i < 5 then 
                i = i+1                
                -- log("\t Scanning layer " .. i .. "...")
                add_iron, add_copper, add_fuel = scanItem(name, i)
                add_iron = amount*add_iron         
                add_copper = amount*add_copper  
                add_fuel = amount*add_fuel
            end
            iron = iron + add_iron
            copper = copper + add_copper
            fuel = fuel + add_fuel
            -- log("\t" .. "iron : "  .. iron .. " / copper: " .. copper .. " / fuel: " .. fuel)
        end

    end

    return iron, copper, fuel

end

function AddFuel(Items, item_type)
    for item_name, values in pairs(Items) do 
        if not data.raw[item_type][item_name].fuel_category then -- Skip fuel items
            local iron = 0
            local copper = 0
            local fuel = 0
            iron, copper, fuel = scanItem(item_name,1)
            if fuel > 10000 then 
                fuel = 10000
            end
            if fuel == 0 and AWM.EverythingBurns then
                fuel = 0.1
            end
            if fuel > 0 then
                data.raw[item_type][item_name].fuel_category = "incineration"
                data.raw[item_type][item_name].fuel_value = fuel .. "MJ"
                if iron >= copper then
                    if iron >= 40 then
                        data.raw[item_type][item_name].burnt_result = "rich-iron-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", rich-iron-ash, " .. iron .. ", " .. copper)
                    elseif iron >= 4 then
                        data.raw[item_type][item_name].burnt_result = "iron-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", iron-ash, " .. iron .. ", " .. copper)
                    else
                        data.raw[item_type][item_name].burnt_result = "trash-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", trash-ash, " .. iron .. ", " .. copper)
                    end
                elseif copper > iron then
                    if copper >= 40 then
                        data.raw[item_type][item_name].burnt_result = "rich-copper-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", rich-copper-ash, " .. iron .. ", " .. copper)
                    elseif copper >= 4 then
                        data.raw[item_type][item_name].burnt_result = "copper-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", copper-ash, " .. iron .. ", " .. copper)
                    else
                        data.raw[item_type][item_name].burnt_result = "trash-ash"
                        log(serpent.block(item_name) .. ", " .. fuel .. ", trash-ash, " .. iron .. ", " .. copper)
                    end
                end
            end --if fuel >0
        end       
    end
end 

AddFuel(data.raw.item, "item")
AddFuel(data.raw.ammo, "ammo")
AddFuel(data.raw.armor, "armor")
AddFuel(data.raw.gun, "gun")
AddFuel(data.raw.capsule, "capsule")
AddFuel(data.raw.module, "module")


