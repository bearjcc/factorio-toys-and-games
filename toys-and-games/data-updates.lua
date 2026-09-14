require("prototypes.util")

-- Crushing Industry: hide fallback crusher; pigment recipes already use tg.crushed() at load time.
if mods["crushing-industry"] then
  for _, item_name in ipairs({
    "tg-crushed-coal",
    "tg-crushed-iron-ore",
    "tg-crushed-copper-ore",
    "tg-crushed-stone"
  }) do
    local crushed_item = data.raw.item[item_name]
    if crushed_item then
      crushed_item.hidden = true
    end
  end
  local crusher_item = data.raw.item["tg-crusher"]
  if crusher_item then
    crusher_item.hidden = true
  end
  local crusher_recipe = data.raw.recipe["tg-crusher"]
  if crusher_recipe then
    crusher_recipe.hidden = true
  end
  local crusher_entity = data.raw["assembling-machine"]["tg-crusher"]
  if crusher_entity then
    crusher_entity.hidden = true
  end
  for _, name in ipairs({ "tg-crush-coal", "tg-crush-iron-ore", "tg-crush-copper-ore", "tg-crush-stone" }) do
    local r = data.raw.recipe[name]
    if r then
      r.hidden = true
      r.enabled = false
    end
  end
  local crushing_tech = data.raw.technology["tg-crushing"]
  if crushing_tech and crushing_tech.effects then
    local filtered = {}
    for _, effect in ipairs(crushing_tech.effects) do
      if effect.recipe ~= "tg-crusher" and not effect.recipe:find("^tg%-crush%-") then
        table.insert(filtered, effect)
      end
    end
    crushing_tech.effects = filtered
  end
end

-- Wood Industry: woodchips in pulp recipe
if data.raw.item["woodchips"] then
  data:extend({
    {
      type = "recipe",
      name = "tg-wood-pulp-from-woodchips",
      category = "tg-papering",
      enabled = false,
      energy_required = 2,
      ingredients = { { type = "item", name = "woodchips", amount = 6 } },
      results = { { type = "item", name = "tg-wood-pulp", amount = 2 } }
    }
  })
  local papermaking = data.raw.technology["tg-papermaking"]
  if papermaking and papermaking.effects then
    table.insert(papermaking.effects, { type = "unlock-recipe", recipe = "tg-wood-pulp-from-woodchips" })
  end
end

-- Bio Industries 2: accept their wood pulp in paper recipe
local bi_pulp = data.raw.item["wood-pulp"] or data.raw.item["bi-woodpulp"]
if bi_pulp then
  data:extend({
    {
      type = "recipe",
      name = "tg-paper-from-bi-wood-pulp",
      category = "tg-papering",
      enabled = false,
      energy_required = 2,
      ingredients = { { type = "item", name = bi_pulp.name, amount = 2 } },
      results = { { type = "item", name = "tg-paper", amount = 2 } }
    }
  })
  local papermaking = data.raw.technology["tg-papermaking"]
  if papermaking and papermaking.effects then
    table.insert(papermaking.effects, { type = "unlock-recipe", recipe = "tg-paper-from-bi-wood-pulp" })
  end
end

-- Planetaris Dyes: optional extra ink route (does not change our ore colour mapping)
if mods["planetaris-dyes"] then
  local dye_fluid = data.raw.fluid["planetaris-blue-dye"] or data.raw.fluid["pd-blue-dye"]
  if dye_fluid then
    data:extend({
      {
        type = "recipe",
        name = "tg-ink-from-planetaris-dye",
        category = "chemistry",
        enabled = false,
        energy_required = 4,
        ingredients = {
          { type = "fluid", name = dye_fluid.name, amount = 10 },
          { type = "fluid", name = "heavy-oil", amount = 10 }
        },
        results = { { type = "item", name = "tg-ink", amount = 3 } }
      }
    })
    local printing = data.raw.technology["tg-printing"]
    if printing and printing.effects then
      table.insert(printing.effects, { type = "unlock-recipe", recipe = "tg-ink-from-planetaris-dye" })
    end
  end
end
