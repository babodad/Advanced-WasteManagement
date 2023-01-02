data:extend(
{
    --- Incinerator:
    {
        type = "item",
        name = "incinerator",
        icon = "__Advanced-WasteManagement__/graphics/icons/incinerator.png",
        icon_size = 32,
        flags = {},
        subgroup = "energy",
        order = "b[steam-power]-a[boiler]z",
        place_result = "incinerator",
        stack_size = 50
    },

    --- Advanced Incinerator:
    {
        type = "item",
        name = "advanced-incinerator",
        icon = "__Advanced-WasteManagement__/graphics/icons/advanced-incinerator.png",
        icon_size = 32,
        flags = {},
        subgroup = "energy",
        order = "b[steam-power]-c[steam-turbine]z",
        place_result = "advanced-incinerator",
        stack_size = 50
    },

    ---- Waste Furnace:
    {
        type = "item",
        name = "waste-furnace",
        icon = "__Advanced-WasteManagement__/graphics/icons/waste-furnace-icon.png",
        icon_size = 64,
        flags = {},
        subgroup = "energy",
        order = "b[steam-power]-c[steam-turbine]z",
        place_result = "waste-furnace",
        stack_size = 10
      },

    --- Ash-Remover:
    {
        type = "item",
        name = "ash-remover",
        icon = "__Advanced-WasteManagement__/graphics/icons/ash-remover.png",
        icon_size = 32,
        flags = {},
        subgroup = "inserter",
        order = "e[filter-inserter]",
        place_result = "ash-remover",
        stack_size = 50
      },

    --- Ashes:
    {
        type = "item",
        name = "rich-iron-ash",
        icon = "__Advanced-WasteManagement__/graphics/icons/rich-iron-ash.png",
        icon_size = 32,
        flags = {},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "iron-ash",
        icon = "__Advanced-WasteManagement__/graphics/icons/iron-ash.png",
        icon_size = 32,
        flags = {},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "rich-copper-ash",
        icon = "__Advanced-WasteManagement__/graphics/icons/rich-copper-ash.png",
        icon_size = 32,
        flags = {},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "copper-ash",
        icon = "__Advanced-WasteManagement__/graphics/icons/copper-ash.png",
        icon_size = 32,
        flags = {},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "trash-ash",
        icon = "__Advanced-WasteManagement__/graphics/icons/trash-ash.png",
        icon_size = 32,
        flags = {},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },

})