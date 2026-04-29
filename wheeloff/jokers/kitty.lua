
SMODS.Joker{ --Kitty
    key = "kitty",
    config = {
        extra = {
            KittyXChips = 2
        }
    },
    loc_txt = {
        ['name'] = 'Kitty',
        ['text'] = {
            [1] = 'Gives {X:blue,C:white}X0.8{}-{X:blue,C:white}X4{} Chips. Amount changes every hand.',
            [2] = 'Currently: X#1#'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloffortune_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.KittyXChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.KittyXChips = pseudorandom('RANGE:0.8|4', 0.8, 4)
            return {
                x_chips = card.ability.extra.KittyXChips
            }
        end
    end
}