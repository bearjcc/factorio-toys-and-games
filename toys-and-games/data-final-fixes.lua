local setting_name = "toys-and-games-tg-sink-mode"
local mode = settings.startup[setting_name] and settings.startup[setting_name].value or "orders"

local function show_tech(name)
  local t = data.raw.technology[name]
  if t then
    t.hidden = false
  end
end

local function hide_tech(name)
  local t = data.raw.technology[name]
  if t then
    t.hidden = true
  end
end

if mode == "orders" or mode == "both" then
  show_tech("tg-game-orders")
else
  hide_tech("tg-game-orders")
end

if mode == "leisure-science" or mode == "both" then
  show_tech("tg-leisure-science")
  local lab = data.raw.lab["lab"]
  if lab and lab.inputs then
    local has = false
    for _, input in ipairs(lab.inputs) do
      if input == "tg-leisure-science-pack" then
        has = true
        break
      end
    end
    if not has then
      table.insert(lab.inputs, "tg-leisure-science-pack")
    end
  end
else
  hide_tech("tg-leisure-science")
end

-- Re-resolve pigment ingredients if CI loaded after util (defensive)
if mods["crushing-industry"] then
  local map = {
    ["tg-pigment-black-from-coal"] = tg.crushed("coal"),
    ["tg-pigment-red-from-iron"] = tg.crushed("iron-ore"),
    ["tg-pigment-green-from-copper"] = tg.crushed("copper-ore"),
    ["tg-pigment-white-from-stone"] = tg.crushed("stone")
  }
  for recipe_name, crushed_name in pairs(map) do
    local r = data.raw.recipe[recipe_name]
    if r and r.ingredients and r.ingredients[1] then
      r.ingredients[1].name = crushed_name
    end
  end
end
