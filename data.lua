
local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")

local graphics = "__snouz_space_platform_hull__/graphics"
local ENTITYPATH = graphics .. "/entity/"


data:extend(
{
  {
    type = "item",
    name = "snouz_wall_hull",
    icon = graphics .. "/icons/snouz_wall_hull.png",
    --subgroup = "turret",
    --order = "b[turret]-az[gun-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "snouz_wall_hull",
    --default_import_location = "fulgora",
    stack_size = 50,
    weight = 20 * kg
  },

  {
    type = "recipe",
    name = "snouz_wall_hull",
    --icon = graphics .. "/icons/snouz_wall_hull.png",
    --category = "electromagnetics",
    always_show_made_in = true,
    energy_required = 16,
    enabled = false,
    allow_productivity = false,
    ingredients =
    {
      {type = "item", name = "stone-wall", amount = 2},
    },
    results = {
      {type = "item", name = "snouz_wall_hull", amount = 1},
    },
    --crafting_machine_tint =
    --{
    --  primary = {r = 0.460, g = 0.188, b = 0.649, a = 1.000}, -- #752fa5ff
    --  secondary = {r = 0.489, g = 0.484, b = 0.381, a = 1.000}, -- #7c7b61ff
    --  tertiary = {r = 0.196, g = 0.101, b = 0.101, a = 1.000}, -- #311919ff
    --  quaternary = {r = 0.518, g = 0.539, b = 0.993, a = 1.000}, -- #8489fdff
    --}
  },

  {
    type = "technology",
    name = "snouz_wall_hull",
    icon = graphics .. "/technology/snouz_wall_hull.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "snouz_wall_hull"
      }
    },
    prerequisites = {}, --"tungsten-carbide", "electromagnetic-plant"
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        --{"production-science-pack", 1},
        --{"utility-science-pack", 1},
        --{"space-science-pack", 1},
        --{"metallurgic-science-pack", 1},
        --{"electromagnetic-science-pack", 1},
        --{"agricultural-science-pack", 1},
        --{"cryogenic-science-pack", 1},
        --{"promethium-science-pack", 1}
        
      },
      time = 60
    },
  },

  {
    type = "wall",
    name = "snouz_wall_hull",
    icon = graphics .. "/icons/snouz_wall_hull.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.wall(),
    minable = {mining_time = 0.2, result = "snouz_wall_hull"},
    fast_replaceable_group = "wall",
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    dying_explosion = "wall-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "stone",
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
    --{
    ---- how far the mirroring works
    --range = 2,
    ---- what kind of damage triggers the mirroring
    ---- if not present then anything triggers the mirroring
    --damage_type = "physical",
    ---- caused damage will be multiplied by this and added to the subsequent damages
    --reaction_modifier = 0.1,
    --action =
    --{
    --type = "direct",
    --action_delivery =
    --{
    --type = "instant",
    --target_effects =
    --{
    --type = "damage",
    ---- always use at least 0.1 damage
    --damage = {amount = 0.1, type = "physical"}
    --}
    --}
    --},
    --}
    --},
    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 15
      },
      {
        type = "impact",
        decrease = 55,
        percent = 96
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 10
      },
      {
        type = "fire",
        percent = 40
      },
      {
        type = "acid",
        percent = 5
      },
      {
        type = "laser",
        percent = 40
      }
    },
    visual_merge_group = 0, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-single.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 60,
            repeat_count = 1,
            shift = util.by_pixel(10, 17),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      straight_vertical =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-vertical.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 110,
            repeat_count = 1,
            shift = util.by_pixel(10, 29),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      straight_horizontal =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 1,
            shift = util.by_pixel(14, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-corner-right.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 1,
            shift = util.by_pixel(17, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-corner-left.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 120,
            repeat_count = 1,
            shift = util.by_pixel(9, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-t.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-t-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 1,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-ending-right.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 1,
            shift = util.by_pixel(17, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = ENTITYPATH .. "wall/wall-ending-left.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 68,
            repeat_count = 1,
            shift = util.by_pixel(9, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      filling =
      {
        filename = ENTITYPATH .. "wall/wall-filling.png",
        priority = "extra-high",
        width = 48,
        height = 56,
        variation_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, -1),
        scale = 0.5
      },
      water_connection_patch = util.empty_sprite(),
      --[[{
        sheets =
        {
          {
            filename = ENTITYPATH .. "wall/wall-patch.png",
            priority = "extra-high",
            width = 116,
            height = 128,
            shift = util.by_pixel(0, -2),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-patch-shadow.png",
            priority = "extra-high",
            width = 144,
            height = 100,
            shift = util.by_pixel(9, 15),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },]]
      gate_connection_patch =
      {
        sheets =
        {
          {
            filename = ENTITYPATH .. "wall/wall-gate.png",
            priority = "extra-high",
            width = 82,
            height = 108,
            shift = util.by_pixel(0, -7),
            scale = 0.5
          },
          {
            filename = ENTITYPATH .. "wall/wall-gate-shadow.png",
            priority = "extra-high",
            width = 130,
            height = 78,
            shift = util.by_pixel(14, 18),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },

    wall_diode_green =
    {
      sheet =
      {
        filename = ENTITYPATH .. "wall/wall-diode-green.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23),
        scale = 0.5
      }
    },
    wall_diode_green_light_top =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_right =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_left =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.2
    },

    wall_diode_red =
    {
      sheet =
      {
        filename = ENTITYPATH .. "wall/wall-diode-red.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23),
        scale = 0.5
      }
    },
    wall_diode_red_light_top =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_right =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_left =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.2
    },

    circuit_connector = circuit_connector_definitions["wall"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = {type = "virtual", name = "signal-G"}
  },
})