local function tech(name, opts)
  return {
    type = "technology",
    name = name,
    icon = opts.icon or "__base__/graphics/technology/automation-science-pack.png",
    icon_size = 256,
    prerequisites = opts.prerequisites or {},
    effects = opts.effects or {},
    unit = opts.unit,
    order = opts.order,
    hidden = opts.hidden
  }
end

local function unlock(recipe_name)
  return { type = "unlock-recipe", recipe = recipe_name }
end

local effects_crushing = {
  unlock("tg-crusher"),
  unlock("tg-crush-coal"),
  unlock("tg-crush-iron-ore"),
  unlock("tg-crush-copper-ore"),
  unlock("tg-crush-stone"),
  unlock("tg-pigment-black-from-coal"),
  unlock("tg-pigment-red-from-iron"),
  unlock("tg-pigment-green-from-copper"),
  unlock("tg-pigment-white-from-stone")
}

data:extend({
  tech("tg-crushing", {
    order = "a[tg]-a",
    prerequisites = { "automation-science-pack" },
    effects = effects_crushing,
    unit = { count = 30, ingredients = { { "automation-science-pack", 1 } }, time = 15 }
  }),
  tech("tg-woodcraft", {
    order = "a[tg]-b",
    prerequisites = { "tg-crushing" },
    effects = {
      unlock("tg-die-wood"),
      unlock("tg-pawn-wood"),
      unlock("tg-coin-token-wood")
    },
    unit = { count = 40, ingredients = { { "automation-science-pack", 1 } }, time = 15 }
  }),
  tech("tg-papermaking", {
    order = "a[tg]-c",
    prerequisites = { "tg-woodcraft" },
    effects = {
      unlock("tg-paper-mill"),
      unlock("tg-wood-pulp-from-wood"),
      unlock("tg-paper-from-pulp"),
      unlock("tg-cardboard"),
      unlock("tg-blank-board"),
      unlock("tg-plain-card"),
      unlock("tg-glue")
    },
    unit = { count = 50, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 20 }
  }),
  tech("tg-printing", {
    order = "a[tg]-d",
    prerequisites = { "tg-papermaking", "oil-processing" },
    effects = {
      unlock("tg-printer"),
      unlock("tg-ink-from-black"),
      unlock("tg-ink-from-red"),
      unlock("tg-ink-from-blue"),
      unlock("tg-printed-board"),
      unlock("tg-playing-card"),
      unlock("tg-card-deck"),
      unlock("tg-rulebook"),
      unlock("tg-paint")
    },
    unit = { count = 60, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 25 }
  }),
  tech("tg-parlour-games", {
    order = "a[tg]-e",
    prerequisites = { "tg-printing" },
    effects = {
      unlock("tg-game-box"),
      unlock("tg-box-insert"),
      unlock("tg-game-checkers"),
      unlock("tg-game-chess"),
      unlock("tg-game-cards")
    },
    unit = { count = 75, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 25 }
  }),
  tech("tg-dye-farming", {
    order = "a[tg]-f",
    prerequisites = { "tg-papermaking" },
    effects = {
      unlock("tg-dye-greenhouse"),
      unlock("tg-grow-woad"),
      unlock("tg-woad-seeds-starter"),
      unlock("tg-woad-seeds-from-woad"),
      unlock("tg-pigment-blue-from-woad")
    },
    unit = { count = 50, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 20 }
  }),
  tech("tg-bright-dyes", {
    order = "a[tg]-g",
    prerequisites = { "tg-dye-farming", "sulfur-processing" },
    effects = {
      unlock("tg-flower-seeds-starter"),
      unlock("tg-grow-flowers"),
      unlock("tg-flower-seeds-from-flowers"),
      unlock("tg-pigment-yellow-from-flowers"),
      unlock("tg-pigment-yellow-from-sulfur")
    },
    unit = { count = 60, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 25 }
  }),
  tech("tg-plastic-pieces", {
    order = "a[tg]-h",
    prerequisites = { "tg-parlour-games", "plastics" },
    effects = {
      unlock("tg-die-plastic"),
      unlock("tg-pawn-plastic"),
      unlock("tg-army-man"),
      unlock("tg-coin-token-plastic"),
      unlock("tg-dice-cup")
    },
    unit = { count = 80, ingredients = { { "chemical-science-pack", 1 }, { "logistic-science-pack", 1 } }, time = 30 }
  }),
  tech("tg-modern-board-games", {
    order = "a[tg]-i",
    prerequisites = { "tg-plastic-pieces", "tg-bright-dyes" },
    effects = {
      unlock("tg-game-family"),
      unlock("tg-game-wargame")
    },
    unit = { count = 100, ingredients = { { "chemical-science-pack", 1 }, { "production-science-pack", 1 } }, time = 30 }
  }),
  tech("tg-game-orders", {
    order = "a[tg]-j",
    prerequisites = { "tg-parlour-games" },
    hidden = true,
    effects = {
      unlock("tg-shipping-crate"),
      unlock("tg-dispatch-depot"),
      unlock("tg-dispatch-order"),
      unlock("tg-pack-checkers-order"),
      unlock("tg-pack-chess-order"),
      unlock("tg-pack-cards-order"),
      unlock("tg-pack-family-order"),
      unlock("tg-pack-wargame-order")
    },
    unit = { count = 50, ingredients = { { "logistic-science-pack", 1 } }, time = 20 }
  }),
  tech("tg-leisure-science", {
    order = "a[tg]-k",
    prerequisites = { "tg-modern-board-games" },
    hidden = true,
    effects = {
      unlock("tg-leisure-science-pack")
    },
    unit = { count = 100, ingredients = { { "production-science-pack", 1 }, { "utility-science-pack", 1 } }, time = 30 }
  })
})
