data:extend({
    --INCINERATION
    {
        type = "technology",
        name = "incineration",
        icon = "__Advanced-WasteManagement__/graphics/technology/incineration-tech.png",
        icon_size = 128,
        prerequisites = {"advanced-material-processing"},
        effects =
        {
            {
              type = "unlock-recipe",
              recipe = "incinerator"
            },
            {
                type = "unlock-recipe",
                recipe = "ash-remover"
            }
        },		 
        unit =
        {
            count = 42,
            ingredients =
            {
                {"science-pack-1", 1},
                {"science-pack-2", 1},
            },
            time = 42
        }
    },

        --AWM
        {
            type = "technology",
            name = "awm",
            icon = "__Advanced-WasteManagement__/graphics/technology/awm-tech.png",
            icon_size = 128,
            prerequisites = {"nuclear-power"},
            effects =
            {
                {
                  type = "unlock-recipe",
                  recipe = "advanced-incinerator"
                },
            },		 
            unit =
            {
                count = 42,
                ingredients =
                {
                    {"science-pack-1", 1},
                    {"science-pack-2", 1},
                    {"science-pack-3", 1},
                },
                time = 42
            }
        }

})

table.insert(data.raw["technology"]["concrete"].effects,
    {
        type = "unlock-recipe",
        recipe = "incinerator-concrete"
    }
)
table.insert(data.raw["technology"]["landfill"].effects,
	{
		type = "unlock-recipe",
		recipe = "incinerator-landfill"
	}
)