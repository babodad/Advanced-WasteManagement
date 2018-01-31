data:extend(
{
    --- Incinerator:
    {
        type = "recipe",
        name = "incinerator",
        enabled = true,
        energy_required = 10,
        ingredients = {{"stone-furnace", 1}, {"pipe", 4}},
        result = "incinerator",
        result_count = 1,
    },

    --Ash smelting
    -- TODO: new recipes for each type of ash (copper,iron,stone)
    {
        type = "recipe",
        name = "rich-iron-recovery",
        category = "smelting",
        energy_required = 10,
        ingredients = {{ "rich-iron-ash", 1}},
        enabled = true,
        result =  "steel-plate"
    },
    {
        type = "recipe",
        name = "iron-recovery",
        category = "smelting",
        energy_required = 20,
        ingredients = {{ "iron-ash", 2}},
        enabled = true,
        result =  "iron-plate"
    },
    {
        type = "recipe",
        name = "rich-copper-recovery",
        category = "smelting",
        energy_required = 20,
        ingredients = {{ "rich-copper-ash", 1}},
        enabled = true,
        result =  "copper-plate"
    },
    {
        type = "recipe",
        name = "iron-recovery",
        category = "smelting",
        energy_required = 20,
        ingredients = {{ "copper-ash", 2}},
        enabled = true,
        result =  "copper-plate"
    },

    -- trash-ash recipes
    {
        type = "recipe",
        name = "incinerator-landfill",
        energy_required = 0.5,
        enabled = true,
        category = "crafting",
        ingredients =
        {
          {"trash-ash", 25}
        },
        result= "landfill",
        result_count = 1
    },
    {
        type = "recipe",
        name = "incinerator-concrete",
        energy_required = 10,
        enabled = true,
        category = "crafting-with-fluid",
        ingredients =
        {
          {"stone-brick", 1},
          {"trash-ash", 5},
          {type="fluid", name="water", amount=100}
        },
        result= "concrete",
        result_count = 10
      },

})