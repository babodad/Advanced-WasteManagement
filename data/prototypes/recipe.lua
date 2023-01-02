data:extend(
{
    --- Incinerator:
    {
        type = "recipe",
        name = "incinerator",
        enabled = false,
        energy_required = 10,
        ingredients = {{"steel-furnace", 1}, {"pipe", 10}, {"transport-belt", 4}},
        result = "incinerator",
        result_count = 1,
    },

    --- Advanced Incinerator:
    {
        type = "recipe",
        name = "advanced-incinerator",
        enabled = false,
        energy_required = 20,
        ingredients = {{"steel-furnace", 1}, {"pipe", 20}, {"fast-transport-belt", 4},},
        result = "advanced-incinerator",
        result_count = 1,
    },
    
    ---- Waste Furnace:
    {
        type = "recipe",
        name = "waste-furnace",
        enabled = false,
        ingredients =
        {
          {"electric-furnace", 1},
          {"electric-engine-unit", 2},
          {"express-transport-belt", 4}
        },
        result = "waste-furnace"
      },

    --Ash-Remover
    {
        type = "recipe",
        name = "ash-remover",
        icon_size = 32,
        enabled = false,
        ingredients =
        {
          {"fast-inserter", 1},
          {"coal", 4}
        },
        result = "ash-remover",
    },

    --Ash smelting
    {
        type = "recipe",
        name = "rich-iron-recovery",
        category = "smelting",
        energy_required = 30,
        ingredients = {{ "rich-iron-ash", 1}},
        enabled = true,
        result =  "iron-plate",
        result_count = 20
    },
    {
        type = "recipe",
        name = "iron-recovery",
        category = "smelting",
        energy_required = 20,
        ingredients = {{ "iron-ash", 1}},
        enabled = true,
        result =  "iron-plate",
        result_count = 2
    },
    {
        type = "recipe",
        name = "rich-copper-recovery",
        category = "smelting",
        energy_required = 30,
        ingredients = {{ "rich-copper-ash", 1}},
        enabled = true,
        result =  "copper-plate",
        result_count = 20
    },
    {
        type = "recipe",
        name = "copper-recovery",
        category = "smelting",
        energy_required = 20,
        ingredients = {{ "copper-ash", 1}},
        enabled = true,
        result =  "copper-plate",
        result_count = 2
    },
    
    -- trash-ash recipes
    {
        type = "recipe",
        name = "incinerator-landfill",
        energy_required = 0.5,
        enabled = false,
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
        enabled = false,
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