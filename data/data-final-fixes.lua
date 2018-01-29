function addRecipes(Recipes)
    for recipe_name, recipe in pairs(Recipes) do
        local recipe = data.raw.recipe[recipe_name]
        if recipe then 
            -- data.raw.item[recipe_name].fuel_category = {"chemical"} 
            table.insert(data.raw.item[recipe_name], {fuel_category = "chemical"})
            table.insert(data.raw.item[recipe_name], {fuel_value = "1.0GJ"})
            -- data.raw.item[recipe_name].fuel_value = {"1.0GJ"}
        end
    end
end
    


 addRecipes(data.raw.ammo)				--Create recipes for all ammunitions
 addRecipes(data.raw.armor)				--Create recipes for all armors
 addRecipes(data.raw.item)				--Create recipes for all items
--  addRecipes(data.raw.gun)				--Create recipes for all weapons
-- addRecipes(data.raw.capsule)			--Create recipes for all capsules
-- addRecipes(data.raw.module)				--Create recipes for all modules
-- addRecipes(data.raw.tool)				--Create recipes for all forms of science packs
-- addRecipes(data.raw["rail-planner"])	--Create recipe for rail. Seriously, just rail.
-- addRecipes(data.raw["mining-tool"])		--Create recipes for all mining tools
-- addRecipes(data.raw["repair-tool"]) 	--Create recipes for all repair tools

error(serpent.block(data.raw))