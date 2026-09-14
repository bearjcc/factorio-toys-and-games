local assembler_pictures = require("__base__.prototypes.entity.assembler-pictures")

local function electric_machine_base(crafting_categories, speed, usage)
  return {
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2 },
    max_health = 350,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    resistances = { { type = "fire", percent = 70 } },
    collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    fast_replaceable_group = "assembling-machine",
    impact_category = "metal",
    crafting_categories = crafting_categories,
    crafting_speed = speed,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = usage,
    graphics_set = assembler_pictures.assembler1_graphics_set,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.5 },
    working_sound = {
      sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.4 },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    allowed_effects = { "speed", "consumption", "pollution" },
    effect_receiver = { uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true }
  }
end

local crusher = electric_machine_base({ "tg-crushing" }, 1, "150kW")
crusher.type = "assembling-machine"
crusher.name = "tg-crusher"
crusher.icon = "__base__/graphics/icons/electric-mining-drill.png"
crusher.minable.result = "tg-crusher"

local paper_mill = electric_machine_base({ "tg-papering" }, 1, "120kW")
paper_mill.type = "assembling-machine"
paper_mill.name = "tg-paper-mill"
paper_mill.icon = "__base__/graphics/icons/assembling-machine-1.png"
paper_mill.minable.result = "tg-paper-mill"

local printer = electric_machine_base({ "tg-printing", "crafting-with-fluid" }, 1.5, "180kW")
printer.type = "assembling-machine"
printer.name = "tg-printer"
printer.icon = "__base__/graphics/icons/chemical-plant.png"
printer.minable.result = "tg-printer"
printer.fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = assembler_pictures.assembler2pipepictures,
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } } },
    secondary_draw_orders = { north = -1 }
  }
}
printer.fluid_boxes_off_when_no_fluid_recipe = true

local greenhouse = electric_machine_base({ "tg-growing" }, 0.75, "100kW")
greenhouse.type = "assembling-machine"
greenhouse.name = "tg-dye-greenhouse"
greenhouse.icon = "__base__/graphics/icons/solar-panel.png"
greenhouse.minable.result = "tg-dye-greenhouse"

local depot = electric_machine_base({ "tg-dispatching" }, 1, "60kW")
depot.type = "assembling-machine"
depot.name = "tg-dispatch-depot"
depot.icon = "__base__/graphics/icons/steel-chest.png"
depot.minable.result = "tg-dispatch-depot"

data:extend({ crusher, paper_mill, printer, greenhouse, depot })
