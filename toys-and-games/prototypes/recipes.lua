local function recipe(name, opts)
  return {
    type = "recipe",
    name = name,
    category = opts.category or "crafting",
    enabled = opts.enabled == true,
    energy_required = opts.energy or 2,
    ingredients = opts.ingredients,
    results = opts.results,
    main_product = opts.main_product,
    allow_productivity = opts.allow_productivity,
    subgroup = opts.subgroup,
    order = opts.order,
    hidden = opts.hidden
  }
end

local function item_ing(name, amount)
  return { type = "item", name = name, amount = amount }
end

local function fluid_ing(name, amount)
  return { type = "fluid", name = name, amount = amount }
end

local function item_res(name, amount, probability)
  local r = { type = "item", name = name, amount = amount }
  if probability then
    r.probability = probability
  end
  return r
end

local crushed_coal = tg.crushed("coal")
local crushed_iron = tg.crushed("iron-ore")
local crushed_copper = tg.crushed("copper-ore")
local crushed_stone = tg.crushed("stone")

local recipes = {
  -- Machine crafting
  recipe("tg-crusher", {
    enabled = false,
    ingredients = {
      item_ing("iron-plate", 10),
      item_ing("iron-gear-wheel", 5),
      item_ing("electronic-circuit", 2)
    },
    results = { item_res("tg-crusher", 1) }
  }),
  recipe("tg-paper-mill", {
    enabled = false,
    ingredients = {
      item_ing("iron-plate", 8),
      item_ing("iron-gear-wheel", 4),
      item_ing("wood", 20)
    },
    results = { item_res("tg-paper-mill", 1) }
  }),
  recipe("tg-printer", {
    enabled = false,
    ingredients = {
      item_ing("steel-plate", 10),
      item_ing("engine-unit", 2),
      item_ing("electronic-circuit", 5)
    },
    results = { item_res("tg-printer", 1) }
  }),
  recipe("tg-dye-greenhouse", {
    enabled = false,
    ingredients = {
      item_ing("steel-plate", 6),
      item_ing("glass", 10),
      item_ing("electronic-circuit", 3)
    },
    results = { item_res("tg-dye-greenhouse", 1) }
  }),
  recipe("tg-dispatch-depot", {
    enabled = false,
    ingredients = {
      item_ing("steel-chest", 4),
      item_ing("electronic-circuit", 10),
      item_ing("concrete", 20)
    },
    results = { item_res("tg-dispatch-depot", 1) }
  }),

  -- Crushing (tg items; CI bridge replaces ingredients in data-updates)
  recipe("tg-crush-coal", {
    category = "tg-crushing",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("coal", 2) },
    results = { item_res("tg-crushed-coal", 2) }
  }),
  recipe("tg-crush-iron-ore", {
    category = "tg-crushing",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("iron-ore", 2) },
    results = { item_res("tg-crushed-iron-ore", 2) }
  }),
  recipe("tg-crush-copper-ore", {
    category = "tg-crushing",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("copper-ore", 2) },
    results = { item_res("tg-crushed-copper-ore", 2) }
  }),
  recipe("tg-crush-stone", {
    category = "tg-crushing",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("stone", 2) },
    results = { item_res("tg-crushed-stone", 2) }
  }),

  -- Pigments from crushed minerals
  recipe("tg-pigment-black-from-coal", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing(crushed_coal, 4) },
    results = { item_res("tg-pigment-black", 1) }
  }),
  recipe("tg-pigment-red-from-iron", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing(crushed_iron, 4) },
    results = { item_res("tg-pigment-red", 1) }
  }),
  recipe("tg-pigment-green-from-copper", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing(crushed_copper, 4) },
    results = { item_res("tg-pigment-green", 1) }
  }),
  recipe("tg-pigment-white-from-stone", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing(crushed_stone, 4) },
    results = { item_res("tg-pigment-white", 1) }
  }),
  recipe("tg-pigment-blue-from-woad", {
    category = "chemistry",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-woad", 6) },
    results = { item_res("tg-pigment-blue", 1) }
  }),
  recipe("tg-pigment-yellow-from-flowers", {
    category = "chemistry",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-dye-flowers", 6) },
    results = { item_res("tg-pigment-yellow", 1) }
  }),
  recipe("tg-pigment-yellow-from-sulfur", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("sulfur", 4), item_ing("tg-pigment-white", 1) },
    results = { item_res("tg-pigment-yellow", 2) }
  }),

  -- Ink / paint / glue
  recipe("tg-ink-from-black", {
    category = "chemistry",
    enabled = false,
    energy = 4,
    ingredients = { item_ing("tg-pigment-black", 1), fluid_ing("heavy-oil", 20) },
    results = { item_res("tg-ink", 2) }
  }),
  recipe("tg-ink-from-red", {
    category = "chemistry",
    enabled = false,
    energy = 4,
    ingredients = { item_ing("tg-pigment-red", 1), fluid_ing("heavy-oil", 20) },
    results = { item_res("tg-ink", 2) }
  }),
  recipe("tg-ink-from-blue", {
    category = "chemistry",
    enabled = false,
    energy = 4,
    ingredients = { item_ing("tg-pigment-blue", 1), fluid_ing("heavy-oil", 20) },
    results = { item_res("tg-ink", 2) }
  }),
  recipe("tg-paint", {
    category = "chemistry",
    enabled = false,
    energy = 3,
    ingredients = {
      item_ing("tg-pigment-white", 1),
      item_ing("tg-pigment-yellow", 1),
      fluid_ing("light-oil", 10)
    },
    results = { item_res("tg-paint", 2) }
  }),
  recipe("tg-glue", {
    category = "chemistry",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("plastic-bar", 2), fluid_ing("steam", 20) },
    results = { item_res("tg-glue", 3) }
  }),

  -- Paper chain
  recipe("tg-wood-pulp-from-wood", {
    category = "tg-papering",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("wood", 4) },
    results = { item_res("tg-wood-pulp", 2) }
  }),
  recipe("tg-paper-from-pulp", {
    category = "tg-papering",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-wood-pulp", 2) },
    results = { item_res("tg-paper", 2) }
  }),
  recipe("tg-cardboard", {
    category = "tg-papering",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-paper", 4), item_ing("tg-glue", 1) },
    results = { item_res("tg-cardboard", 2) }
  }),
  recipe("tg-blank-board", {
    category = "tg-papering",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-cardboard", 4), item_ing("tg-glue", 1) },
    results = { item_res("tg-blank-board", 1) }
  }),
  recipe("tg-printed-board", {
    category = "tg-printing",
    enabled = false,
    energy = 4,
    ingredients = { item_ing("tg-blank-board", 1), item_ing("tg-ink", 2) },
    results = { item_res("tg-printed-board", 1) }
  }),
  recipe("tg-plain-card", {
    category = "tg-papering",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("tg-paper", 1) },
    results = { item_res("tg-plain-card", 4) }
  }),
  recipe("tg-playing-card", {
    category = "tg-printing",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-plain-card", 4), item_ing("tg-ink", 1) },
    results = { item_res("tg-playing-card", 4) }
  }),
  recipe("tg-card-deck", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-playing-card", 52), item_ing("tg-paper", 1) },
    results = { item_res("tg-card-deck", 1) }
  }),
  recipe("tg-rulebook", {
    category = "tg-printing",
    enabled = false,
    energy = 4,
    ingredients = { item_ing("tg-paper", 10), item_ing("tg-ink", 3) },
    results = { item_res("tg-rulebook", 1) }
  }),
  recipe("tg-box-insert", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-cardboard", 2) },
    results = { item_res("tg-box-insert", 1) }
  }),
  recipe("tg-game-box", {
    category = "crafting",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-cardboard", 4), item_ing("tg-glue", 1), item_ing("tg-paint", 1) },
    results = { item_res("tg-game-box", 1) }
  }),

  -- Greenhouse (seed return: no productivity)
  recipe("tg-grow-woad", {
    category = "tg-growing",
    enabled = false,
    energy = 10,
    allow_productivity = false,
    ingredients = { item_ing("tg-woad-seeds", 1) },
    results = {
      item_res("tg-woad", 4),
      item_res("tg-woad-seeds", 1, 0.95)
    }
  }),
  recipe("tg-grow-flowers", {
    category = "tg-growing",
    enabled = false,
    energy = 10,
    allow_productivity = false,
    ingredients = { item_ing("tg-flower-seeds", 1) },
    results = {
      item_res("tg-dye-flowers", 4),
      item_res("tg-flower-seeds", 1, 0.95)
    }
  }),
  recipe("tg-woad-seeds-from-woad", {
    category = "crafting",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("tg-woad", 2) },
    results = { item_res("tg-woad-seeds", 1) }
  }),
  recipe("tg-woad-seeds-starter", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("wood", 8) },
    results = { item_res("tg-woad-seeds", 2) }
  }),
  recipe("tg-flower-seeds-starter", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("wood", 4), item_ing("sulfur", 1) },
    results = { item_res("tg-flower-seeds", 2) }
  }),
  recipe("tg-flower-seeds-from-flowers", {
    category = "crafting",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("tg-dye-flowers", 2) },
    results = { item_res("tg-flower-seeds", 1) }
  }),

  -- Wooden pieces
  recipe("tg-die-wood", {
    category = "crafting",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("wood", 2) },
    results = { item_res("tg-die", 2) }
  }),
  recipe("tg-pawn-wood", {
    category = "crafting",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("wood", 1) },
    results = { item_res("tg-pawn", 4) }
  }),
  recipe("tg-coin-token-wood", {
    category = "crafting",
    enabled = false,
    energy = 1,
    ingredients = { item_ing("wood", 2) },
    results = { item_res("tg-coin-token", 4) }
  }),

  -- Plastic pieces
  recipe("tg-die-plastic", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("plastic-bar", 2) },
    results = { item_res("tg-die", 4) }
  }),
  recipe("tg-pawn-plastic", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("plastic-bar", 1) },
    results = { item_res("tg-pawn", 6) }
  }),
  recipe("tg-army-man", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("plastic-bar", 1), item_ing("tg-paint", 1) },
    results = { item_res("tg-army-man", 4) }
  }),
  recipe("tg-coin-token-plastic", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("plastic-bar", 1) },
    results = { item_res("tg-coin-token", 8) }
  }),
  recipe("tg-dice-cup", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-cardboard", 2), item_ing("wood", 2) },
    results = { item_res("tg-dice-cup", 1) }
  }),

  -- Finished games
  recipe("tg-game-checkers", {
    category = "crafting",
    enabled = false,
    energy = 4,
    ingredients = {
      item_ing("tg-printed-board", 1),
      item_ing("tg-pawn", 24),
      item_ing("tg-game-box", 1)
    },
    results = { item_res("tg-game-checkers", 1) }
  }),
  recipe("tg-game-chess", {
    category = "crafting",
    enabled = false,
    energy = 6,
    ingredients = {
      item_ing("tg-printed-board", 1),
      item_ing("tg-pawn", 16),
      item_ing("wood", 4),
      item_ing("tg-game-box", 1)
    },
    results = { item_res("tg-game-chess", 1) }
  }),
  recipe("tg-game-cards", {
    category = "crafting",
    enabled = false,
    energy = 4,
    ingredients = {
      item_ing("tg-card-deck", 1),
      item_ing("tg-rulebook", 1),
      item_ing("tg-game-box", 1)
    },
    results = { item_res("tg-game-cards", 1) }
  }),
  recipe("tg-game-family", {
    category = "crafting",
    enabled = false,
    energy = 8,
    ingredients = {
      item_ing("tg-printed-board", 1),
      item_ing("tg-die", 2),
      item_ing("tg-pawn", 8),
      item_ing("tg-card-deck", 1),
      item_ing("tg-rulebook", 1),
      item_ing("tg-box-insert", 1),
      item_ing("tg-game-box", 1)
    },
    results = { item_res("tg-game-family", 1) }
  }),
  recipe("tg-game-wargame", {
    category = "crafting",
    enabled = false,
    energy = 10,
    ingredients = {
      item_ing("tg-printed-board", 2),
      item_ing("tg-army-man", 20),
      item_ing("tg-die", 4),
      item_ing("tg-rulebook", 1),
      item_ing("tg-box-insert", 2),
      item_ing("tg-game-box", 1)
    },
    results = { item_res("tg-game-wargame", 1) }
  }),

  -- Sink
  recipe("tg-shipping-crate", {
    category = "crafting",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("wood", 4), item_ing("tg-glue", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-pack-checkers-order", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-game-checkers", 1), item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-pack-chess-order", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-game-chess", 1), item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-pack-cards-order", {
    category = "crafting",
    enabled = false,
    energy = 2,
    ingredients = { item_ing("tg-game-cards", 1), item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-pack-family-order", {
    category = "crafting",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-game-family", 1), item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-pack-wargame-order", {
    category = "crafting",
    enabled = false,
    energy = 3,
    ingredients = { item_ing("tg-game-wargame", 1), item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-shipping-crate", 1) }
  }),
  recipe("tg-dispatch-order", {
    category = "tg-dispatching",
    enabled = false,
    energy = 5,
    ingredients = { item_ing("tg-shipping-crate", 1) },
    results = { item_res("tg-order-fulfilled", 1) }
  }),
  recipe("tg-leisure-science-pack", {
    category = "crafting",
    enabled = false,
    energy = 8,
    ingredients = {
      item_ing("tg-game-family", 1),
      item_ing("tg-card-deck", 1),
      item_ing("automation-science-pack", 1)
    },
    results = { item_res("tg-leisure-science-pack", 1) }
  })
}

data:extend(recipes)
