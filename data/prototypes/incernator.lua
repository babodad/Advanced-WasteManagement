data:extend(
{
    --- item:
    {
        type = "item",
        name = "incernator",
        icon = "__base__/graphics/icons/boiler.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "energy",
        order = "b[steam-power]-a[boiler]",
        place_result = "incernator",
        stack_size = 50
    },
    --- recipe:
    {
        type = "recipe",
        name = "incernator",
        enabled = true,
        energy_required = 10,
        ingredients = {{"stone-furnace", 1}, {"pipe", 4}},
        result = "incernator",
        result_count = 1,
    },

    --- entity:
    {
        type = "boiler",
        name = "incernator",
        icon = "__base__/graphics/icons/heat-boiler.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "incernator"},
        max_health = 200,
        corpse = "small-remnants",
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        mode = "output-to-separate-pipe",
        resistances =
        {
          {
            type = "fire",
            percent = 90
          },
          {
            type = "explosion",
            percent = 30
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
        selection_box = {{-1.5, -1}, {1.5, 1}},
        target_temperature = 500,
        fluid_box =
        {
          base_area = 1,
          height = 2,
          base_level = -1,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            {type = "input-output", position = {-2, 0.5}},
            {type = "input-output", position = {2, 0.5}}
          },
          production_type = "input-output",
          filter = "water"
        },
        output_fluid_box =
        {
          base_area = 1,
          height = 2,
          base_level = 1,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            {type = "output", position = {0, -1.5}}
          },
          production_type = "output",
          filter = "steam"
        },
        energy_consumption = "2.7MW",
		energy_source =
		{
		  type = "burner",
		  fuel_category = "incernator",
		  effectivity = 0.75,
		  fuel_inventory_size = 2,
		  emissions = 0.05 / 6.5
		  smoke =
		  {
			{
			  name = "smoke",
			  north_position = util.by_pixel(-38, -47.5),
			  south_position = util.by_pixel(38.5, -32),
			  east_position = util.by_pixel(20, -70),
			  west_position = util.by_pixel(-19, -8.5),
			  frequency = 20,
			  starting_vertical_speed = 0.0,
			  starting_frame_deviation = 60
			}
		  }
		},
        working_sound =
        {
          sound =
          {
            filename = "__base__/sound/boiler.ogg",
            volume = 0.8
          },
          max_sounds_per_type = 3
        },
    
        structure =
        {
          north =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/heat-exchanger/heatex-N-idle.png",
                priority = "extra-high",
                width = 131,
                height = 108,
                shift = util.by_pixel(-0.5, 4),
                hr_version = {
                  filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-idle.png",
                  priority = "extra-high",
                  width = 269,
                  height = 221,
                  shift = util.by_pixel(-1.25, 5.25),
                  scale = 0.5
                }
              },
              {
                filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
                priority = "extra-high",
                width = 137,
                height = 82,
                shift = util.by_pixel(20.5, 9),
                draw_as_shadow = true,
                hr_version = {
                  filename = "__base__/graphics/entity/boiler/hr-boiler-N-shadow.png",
                  priority = "extra-high",
                  width = 274,
                  height = 164,
                  scale = 0.5,
                  shift = util.by_pixel(20.5, 9),
                  draw_as_shadow = true,
                }
              }
            }
          },
          east =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/heat-exchanger/heatex-E-idle.png",
                priority = "extra-high",
                width = 102,
                height = 147,
                shift = util.by_pixel(-2, -0.5),
                hr_version = {
                  filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-idle.png",
                  priority = "extra-high",
                  width = 211,
                  height = 301,
                  shift = util.by_pixel(-1.75, 1.25),
                  scale = 0.5
                }
              },
              {
                filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
                priority = "extra-high",
                width = 92,
                height = 97,
                shift = util.by_pixel(30, 9.5),
                draw_as_shadow = true,
                hr_version = {
                  filename = "__base__/graphics/entity/boiler/hr-boiler-E-shadow.png",
                  priority = "extra-high",
                  width = 184,
                  height = 194,
                  scale = 0.5,
                  shift = util.by_pixel(30, 9.5),
                  draw_as_shadow = true,
                }
              }
            }
          },
          south =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/heat-exchanger/heatex-S-idle.png",
                priority = "extra-high",
                width = 128,
                height = 100,
                shift = util.by_pixel(3, 10),
                hr_version = {
                  filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-idle.png",
                  priority = "extra-high",
                  width = 260,
                  height = 201,
                  shift = util.by_pixel(4, 10.75),
                  scale = 0.5
                }
              },
              {
                filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
                priority = "extra-high",
                width = 156,
                height = 66,
                shift = util.by_pixel(30, 16),
                draw_as_shadow = true,
                hr_version = {
                  filename = "__base__/graphics/entity/boiler/hr-boiler-S-shadow.png",
                  priority = "extra-high",
                  width = 311,
                  height = 131,
                  scale = 0.5,
                  shift = util.by_pixel(29.75, 15.75),
                  draw_as_shadow = true,
                }
              }
            }
          },
          west =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/heat-exchanger/heatex-W-idle.png",
                priority = "extra-high",
                width = 96,
                height = 132,
                shift = util.by_pixel(1, 5),
                hr_version = {
                  filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-idle.png",
                  priority = "extra-high",
                  width = 196,
                  height = 273,
                  shift = util.by_pixel(1.5, 7.75),
                  scale = 0.5
                }
              },
              {
                filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
                priority = "extra-high",
                width = 103,
                height = 109,
                shift = util.by_pixel(19.5, 6.5),
                draw_as_shadow = true,
                hr_version = {
                  filename = "__base__/graphics/entity/boiler/hr-boiler-W-shadow.png",
                  priority = "extra-high",
                  width = 206,
                  height = 218,
                  scale = 0.5,
                  shift = util.by_pixel(19.5, 6.5),
                  draw_as_shadow = true,
                }
              }
            }
          }
        },
        fire = {},
        fire_glow = {},
        burning_cooldown = 20
      },

})