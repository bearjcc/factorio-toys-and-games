--- Shared helpers for Toys & Games prototypes.
tg = tg or {}

tg.MOD = "toys-and-games"

--- Default item weight (1 kg) when not specified per item.
tg.WEIGHT = 1 * kg

--- Resolve crushed item names (Crushing Industry bridge applied in data-updates).
function tg.crushed(name)
  local map = {
    coal = { ci = "crushed-coal", tg = "tg-crushed-coal" },
    ["iron-ore"] = { ci = "crushed-iron-ore", tg = "tg-crushed-iron-ore" },
    ["copper-ore"] = { ci = "crushed-copper-ore", tg = "tg-crushed-copper-ore" },
    stone = { ci = "crushed-stone", tg = "tg-crushed-stone" }
  }
  local entry = map[name]
  if not entry then
    return name
  end
  if mods["crushing-industry"] and data.raw.item[entry.ci] then
    return entry.ci
  end
  return entry.tg
end

function tg.wood_pulp_item()
  if data.raw.item["wood-pulp"] then
    return "wood-pulp"
  end
  if data.raw.item["bi-woodpulp"] then
    return "bi-woodpulp"
  end
  return "tg-wood-pulp"
end

function tg.icon(path, size)
  return path, size or 64
end
