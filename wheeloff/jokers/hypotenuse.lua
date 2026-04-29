
SMODS.Joker{ --Hypotenuse
    key = "hypotenuse",
    config = {
        extra = {
            HypotenuseChips = 0,
            highestrankinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hypotenuse',
        ['text'] = {
            [1] = 'If played hand is Three of a Kind,',
            [2] = 'adds rank of the highest card times 3 to {C:blue}Chips{}.',
            [3] = 'Current {C:blue}Chips{}: +#1#'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloff_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.HypotenuseChips, (((function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)() or 0)) * 3}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Three of a Kind" then
            card.ability.extra.HypotenuseChips = (card.ability.extra.HypotenuseChips) + ((function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)()) * 3
            else
                return {
                    chips = card.ability.extra.HypotenuseChips
                }
            end
        end
    end
}