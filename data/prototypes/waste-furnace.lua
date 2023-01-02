local idle_animation = {
    layers =
    {
      {
        filename = "__Advanced-WasteManagement__/graphics/entity/waste-furnace/hr-waste-furnace_idle.png",
        priority = "high",
        width = 956/4,
        height = 438/2,
        line_length = 4,
        frame_count = 8,
        animation_speed = 0.5,
        shift = util.by_pixel(0.75, 5.75),
        hr_version =
        {
          filename = "__Advanced-WasteManagement__/graphics/entity/waste-furnace/hr-waste-furnace_idle.png",
          priority = "high",
          width = 956/4,
          height = 219,
          line_length = 4,
          frame_count = 8,
          animation_speed = 0.5,
          shift = util.by_pixel(0.75, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
        priority = "high",
        width = 129,
        height = 100,
        repeat_count = 8,
        shift = {0.421875, 0},
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
          priority = "high",
          width = 227,
          height = 171,
          repeat_count = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(11.25, 7.75),
          scale = 0.5
        }
      }
    }
  }
  local working_animation = {    
    layers =
    {
      {
        filename = "__Advanced-WasteManagement__/graphics/entity/waste-furnace/hr-waste-furnace_burning.png",
        priority = "high",
        width = 956/4,
        height = 438/2,
        line_length = 4,
        frame_count = 8,
        animation_speed = 1,
        shift = util.by_pixel(0.75, 5.75),
        hr_version =
        {
          filename = "__Advanced-WasteManagement__/graphics/entity/waste-furnace/hr-waste-furnace_burning.png",
          priority = "high",
          width = 956/4,
          height = 219,
          line_length = 4,
          frame_count = 8,
          animation_speed = 1,
          shift = util.by_pixel(0.75, 5.75),
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
        priority = "high",
        width = 129,
        height = 100,
        repeat_count = 8,
        shift = {0.421875, 0},
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
          priority = "high",
          width = 227,
          height = 171,
          repeat_count = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(11.25, 7.75),
          scale = 0.5
        }
      }
    }
}
local waste_furnace = {
    type = "burner-generator",
    name = "waste-furnace",
    icon = "__Advanced-WasteManagement__/graphics/icons/waste-furnace-icon.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "waste-furnace"},
    max_health = 420,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    effectivity = 0.5,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    max_power_output = "1MW",    
    burner =
    {
      type = "burner",
      fuel_category = "incineration",
      fuel_inventory_size = 2,
      burnt_inventory_size = 1,
      effectivity = 0.6,
      emissions_per_minute = 60,
      light_flicker = {color = {0,0,0}},
      smoke =
      {
        {
          name = "smoke",
          frequency = 10,
          north_position = north_smoke,
          south_position = north_smoke,
          east_position = east_smoke,
          west_position = east_smoke,
          starting_vertical_speed = 0.02,
        },
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/furnace.ogg",
        volume = 1.6
      },
      max_sounds_per_type = 3
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5,
    idle_animation = {
      north = idle_animation,
      south = idle_animation,
      east = idle_animation,
      west = idle_animation,
    },
    always_draw_idle_animation = true,
    animation = {
      north = working_animation,
      south = working_animation,
      east = working_animation,
      west = working_animation
    }
}
data:extend({waste_furnace})