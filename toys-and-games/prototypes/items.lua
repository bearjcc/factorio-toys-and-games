local w = tg.WEIGHT

local function item(name, opts)
  return {
    type = "item",
    name = name,
    icon = opts.icon,
    icon_size = opts.icon_size or 64,
    subgroup = opts.subgroup or "tg-intermediates",
    order = opts.order or "z",
    stack_size = opts.stack_size or 100,
    weight = opts.weight or w,
    flags = opts.flags,
    hidden = opts.hidden,
    fuel_category = opts.fuel_category,
    fuel_value = opts.fuel_value
  }
end

data:extend({
  -- Machines
  item("tg-crusher", {
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    subgroup = "tg-machines",
    order = "a[crusher]",
    stack_size = 50,
    weight = 10 * kg
  }),
  item("tg-paper-mill", {
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    subgroup = "tg-machines",
    order = "b[paper-mill]",
    stack_size = 50,
    weight = 10 * kg
  }),
  item("tg-printer", {
    icon = "__base__/graphics/icons/chemical-plant.png",
    subgroup = "tg-machines",
    order = "c[printer]",
    stack_size = 50,
    weight = 10 * kg
  }),
  item("tg-dye-greenhouse", {
    icon = "__base__/graphics/icons/solar-panel.png",
    subgroup = "tg-machines",
    order = "d[greenhouse]",
    stack_size = 50,
    weight = 10 * kg
  }),
  item("tg-dispatch-depot", {
    icon = "__base__/graphics/icons/steel-chest.png",
    subgroup = "tg-machines",
    order = "e[depot]",
    stack_size = 50,
    weight = 20 * kg
  }),

  -- Crushed / farm raw
  item("tg-crushed-coal", { icon = "__base__/graphics/icons/coal.png", subgroup = "tg-raw", order = "a[crushed-coal]" }),
  item("tg-crushed-iron-ore", { icon = "__base__/graphics/icons/iron-ore.png", subgroup = "tg-raw", order = "b[crushed-iron]" }),
  item("tg-crushed-copper-ore", { icon = "__base__/graphics/icons/copper-ore.png", subgroup = "tg-raw", order = "c[crushed-copper]" }),
  item("tg-crushed-stone", { icon = "__base__/graphics/icons/stone.png", subgroup = "tg-raw", order = "d[crushed-stone]" }),
  item("tg-woad-seeds", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-raw", order = "e[woad-seeds]", stack_size = 200 }),
  item("tg-woad", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-raw", order = "f[woad]" }),
  item("tg-flower-seeds", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-raw", order = "g[flower-seeds]", stack_size = 200 }),
  item("tg-dye-flowers", { icon = "__base__/graphics/icons/sulfur.png", subgroup = "tg-raw", order = "h[flowers]" }),

  -- Pigments (items filled from fluids via crafting)
  item("tg-pigment-black", { icon = "__base__/graphics/icons/coal.png", subgroup = "tg-intermediates", order = "a[pigment-black]" }),
  item("tg-pigment-red", { icon = "__base__/graphics/icons/iron-plate.png", subgroup = "tg-intermediates", order = "b[pigment-red]" }),
  item("tg-pigment-green", { icon = "__base__/graphics/icons/copper-plate.png", subgroup = "tg-intermediates", order = "c[pigment-green]" }),
  item("tg-pigment-white", { icon = "__base__/graphics/icons/stone-brick.png", subgroup = "tg-intermediates", order = "d[pigment-white]" }),
  item("tg-pigment-blue", { icon = "__base__/graphics/icons/lubricant.png", subgroup = "tg-intermediates", order = "e[pigment-blue]" }),
  item("tg-pigment-yellow", { icon = "__base__/graphics/icons/sulfur.png", subgroup = "tg-intermediates", order = "f[pigment-yellow]" }),

  item("tg-ink", { icon = "__base__/graphics/icons/heavy-oil.png", subgroup = "tg-intermediates", order = "g[ink]" }),
  item("tg-paint", { icon = "__base__/graphics/icons/lubricant.png", subgroup = "tg-intermediates", order = "h[paint]" }),
  item("tg-glue", { icon = "__base__/graphics/icons/plastic-bar.png", subgroup = "tg-intermediates", order = "i[glue]" }),

  -- Paper chain
  item("tg-wood-pulp", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "j[pulp]" }),
  item("tg-paper", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "k[paper]" }),
  item("tg-cardboard", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "l[cardboard]" }),
  item("tg-blank-board", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-intermediates", order = "m[blank-board]" }),
  item("tg-printed-board", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-intermediates", order = "n[printed-board]" }),
  item("tg-plain-card", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "o[plain-card]" }),
  item("tg-playing-card", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "p[playing-card]" }),
  item("tg-card-deck", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "q[deck]" }),
  item("tg-rulebook", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "r[rulebook]" }),
  item("tg-game-box", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-intermediates", order = "s[game-box]" }),
  item("tg-box-insert", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-intermediates", order = "t[box-insert]" }),

  -- Pieces
  item("tg-die", { icon = "__base__/graphics/icons/iron-gear-wheel.png", subgroup = "tg-pieces", order = "a[die]" }),
  item("tg-pawn", { icon = "__base__/graphics/icons/wood.png", subgroup = "tg-pieces", order = "b[pawn]" }),
  item("tg-army-man", { icon = "__base__/graphics/icons/plastic-bar.png", subgroup = "tg-pieces", order = "c[army-man]" }),
  item("tg-coin-token", { icon = "__base__/graphics/icons/copper-plate.png", subgroup = "tg-pieces", order = "d[coin]" }),
  item("tg-dice-cup", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-pieces", order = "e[dice-cup]" }),

  -- Finished games
  item("tg-game-checkers", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-games", order = "a[checkers]", stack_size = 20 }),
  item("tg-game-chess", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-games", order = "b[chess]", stack_size = 20 }),
  item("tg-game-cards", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-games", order = "c[cards]", stack_size = 20 }),
  item("tg-game-family", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-games", order = "d[family]", stack_size = 10 }),
  item("tg-game-wargame", { icon = "__base__/graphics/icons/wooden-chest.png", subgroup = "tg-games", order = "e[wargame]", stack_size = 10 }),

  -- Sink
  item("tg-shipping-crate", {
    icon = "__base__/graphics/icons/wooden-chest.png",
    subgroup = "tg-sink",
    order = "a[crate]",
    stack_size = 20,
    weight = 5 * kg
  }),
  item("tg-order-fulfilled", {
    icon = "__base__/graphics/icons/green-circuit.png",
    subgroup = "tg-sink",
    order = "b[order]",
    stack_size = 1,
    flags = { "hidden" }
  }),
  {
    type = "item",
    name = "tg-leisure-science-pack",
    localised_description = { "item-description.science-pack" },
    icon = "__base__/graphics/icons/utility-science-pack.png",
    icon_size = 64,
    subgroup = "science-pack",
    order = "z[tg-leisure]",
    stack_size = 200,
    weight = 1 * kg
  }
})
