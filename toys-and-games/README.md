# Toys & Games (Factorio 2.0)

A bolt-on production mod inspired by Baketorio-style chains: crush minerals into pigments, make paper, print boards, mould pieces, assemble board games, then sink output via **customer orders** or optional **leisure science**.

## Install

1. Copy the `toys-and-games` folder into your Factorio `mods` directory:
   - Windows: `%appdata%\Factorio\mods\`
   - Linux: `~/.factorio/mods/`
   - macOS: `~/Library/Application Support/Factorio/mods/`
2. Enable **Toys & Games** in the mod menu (Factorio **2.0+**).
3. Start a new game or load a save (new items and technologies are added on load).

Zip install: archive this folder as `toys-and-games_0.1.0.zip` (folder name inside the zip must be `toys-and-games` or `toys-and-games_0.1.0` per Factorio conventions).

## Progression (short)

1. **Crushing** — crusher (or Crushing Industry) → mineral pigments (coal black, iron red, copper green, stone white).
2. **Woodcraft** — wooden dice, pawns, tokens in assemblers.
3. **Papermaking** — paper mill → pulp, paper, cardboard, blank boards.
4. **Printing** — printer + chemistry inks → printed boards, cards, rulebooks.
5. **Parlour games** — checkers, chess, card game in boxes.
6. **Dye farming** — greenhouse, woad, blue pigment; then flowers / sulfur for yellow.
7. **Plastic pieces** — plastic dice, pawns, army figures (oil chain).
8. **Modern board games** — family game and wargame with inserts and packaging.
9. **Sink** (setting-dependent) — pack crates → **dispatch depot**, or craft **leisure science packs** for labs.

Moulding stays on vanilla **assembling machines**; dedicated buildings are crusher, paper mill, printer, dye greenhouse, and dispatch depot.

## Settings

| Setting | Values | Default |
|--------|--------|---------|
| `tg-sink-mode` | `orders`, `leisure-science`, `both` | `orders` |

- **orders** — unlocks shipping crates, packing recipes, and dispatch depot (consumes crates → order fulfilled token).
- **leisure-science** — unlocks leisure science pack recipe and adds the pack to vanilla labs (does not replace vanilla science).
- **both** — enables both sink paths.

## Optional dependencies

Soft deps in `info.json` (`?` = optional):

| Mod | Bridge behaviour |
|-----|------------------|
| `crushing-industry` | Uses CI crushed items in pigment recipes; hides `tg-crusher` and TG crushed items. |
| `wood-industry` | Extra pulp recipe from `woodchips`. |
| `Bio_Industries_2` | Paper from BI wood pulp when present. |
| `planetaris-dyes` | Extra ink recipe from Planetaris dye fluid (our ore colours stay iron=red, copper=green). |

## Non-goals (v1)

- No hard dependency on Space Age or Quality.
- No handhelds, arcade cabinets, or electronics toy line.
- Not a full production overhaul; vanilla chem plants, furnaces, and assemblers do most work.

## License

MIT — see [LICENSE](LICENSE). Placeholder graphics reference `base` only; see [CREDITS](CREDITS.md) for planned art.
