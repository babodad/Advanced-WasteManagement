data:extend(
{
    --- Incinerator:
    {
        type = "item",
        name = "incinerator",
        icon = "__Incinerator__/graphics/boiler.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "energy",
        order = "b[steam-power]-a[boiler]",
        place_result = "incinerator",
        stack_size = 50
    },

    --- Ash:
    -- TODO: Add different types of ash (copper,iron,stone)
    {
        type = "item",
        name = "rich-iron-ash",
        icon = "__Incinerator__/graphics/rich-iron-ash.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "iron-ash",
        icon = "__Incinerator__/graphics/iron-ash.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "rich-copper-ash",
        icon = "__Incinerator__/graphics/rich-copper-ash.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "copper-ash",
        icon = "__Incinerator__/graphics/copper-ash.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },
    {
        type = "item",
        name = "trash-ash",
        icon = "__Incinerator__/graphics/trash-ash.png",
        icon_size = 32,
        flags = {"goes-to-main-inventory"},
        subgroup = "intermediate-product",
        order = "s[incinerator-ash]",
        stack_size = 50
    },

})