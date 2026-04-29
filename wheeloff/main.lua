SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "Blinds",
    path = "Blinds.png", 
    px = 34, 
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
})

SMODS.Atlas({
    key = "Tags",
    path = "Tags.png", 
    px = 34, 
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/spelunker.lua"))()
    assert(SMODS.load_file("jokers/spelunkerpotion.lua"))()
    assert(SMODS.load_file("jokers/slugcheerstothat.lua"))()
    assert(SMODS.load_file("jokers/maltn.lua"))()
    assert(SMODS.load_file("jokers/ironworttea.lua"))()
    assert(SMODS.load_file("jokers/liquidcheese.lua"))()
    assert(SMODS.load_file("jokers/drbob.lua"))()
    assert(SMODS.load_file("jokers/fonduedjoker.lua"))()
    assert(SMODS.load_file("jokers/hypotenuse.lua"))()
    assert(SMODS.load_file("jokers/drinkmix.lua"))()
    assert(SMODS.load_file("jokers/pyrite.lua"))()
    assert(SMODS.load_file("jokers/kitty.lua"))()
    assert(SMODS.load_file("jokers/energyflavoredzestybar.lua"))()
    assert(SMODS.load_file("jokers/drinkcooler.lua"))()
    assert(SMODS.load_file("jokers/cellargrowth.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/palladium.lua"))()
    assert(SMODS.load_file("consumables/cobalt.lua"))()
    assert(SMODS.load_file("consumables/Duratanium.lua"))()
    assert(SMODS.load_file("consumables/mythril.lua"))()
    assert(SMODS.load_file("consumables/orichalcum.lua"))()
    assert(SMODS.load_file("consumables/naquadah.lua"))()
    assert(SMODS.load_file("consumables/adamantite.lua"))()
    assert(SMODS.load_file("consumables/titanium.lua"))()
    assert(SMODS.load_file("consumables/troxinium.lua"))()
    assert(SMODS.load_file("consumables/chlorophyte.lua"))()
    assert(SMODS.load_file("consumables/xantophyte.lua"))()
    assert(SMODS.load_file("consumables/luminite.lua"))()
    assert(SMODS.load_file("consumables/cellargrotto.lua"))()
    assert(SMODS.load_file("consumables/caverns.lua"))()
    assert(SMODS.load_file("consumables/thepot.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/fondue.lua"))()
    assert(SMODS.load_file("enhancements/brass.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/lavenderseal.lua"))()
end

-- load the blinds
if true then
    assert(SMODS.load_file("blinds/blinds.lua"))()
end

--load the tags
if true then
    assert(SMODS.load_file("tags/tags.lua"))()
end

-- load boosters
assert(SMODS.load_file("boosters.lua"))()
SMODS.ObjectType({
    key = "wheeloffortune_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "wheeloffortune_wheeloff_jokers",
    cards = {
        ["j_wheeloffortune_spelunker"] = true,
        ["j_wheeloffortune_spelunkerpotion"] = true,
        ["j_wheeloffortune_slugcheerstothat"] = true,
        ["j_wheeloffortune_maltn"] = true,
        ["j_wheeloffortune_ironworttea"] = true,
        ["j_wheeloffortune_liquidcheese"] = true,
        ["j_wheeloffortune_drbob"] = true,
        ["j_wheeloffortune_fonduedjoker"] = true,
        ["j_wheeloffortune_hypotenuse"] = true
    },
})

SMODS.ObjectType({
    key = "wheeloffortune_drinks",
    cards = {
        ["j_wheeloffortune_maltn"] = true,
        ["j_wheeloffortune_ironworttea"] = true,
        ["j_wheeloffortune_liquidcheese"] = true,
        ["j_wheeloffortune_drbob"] = true
    },
})

SMODS.ObjectType({
    key = "wheeloffortune_wheeloffortune_jokers",
    cards = {
        ["j_wheeloffortune_drinkmix"] = true,
        ["j_wheeloffortune_pyrite"] = true,
        ["j_wheeloffortune_kitty"] = true,
        ["j_wheeloffortune_energyflavoredzestybar"] = true,
        ["j_wheeloffortune_drinkcooler"] = true,
        ["j_wheeloffortune_cellargrowth"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end
loc_colour()
G.ARGS.LOC_COLOURS.wheeloffortune_mineral = HEX("B38CB1")