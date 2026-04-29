
SMODS.Joker{ --Pyrite
    key = "pyrite",
    config = {
        extra = {
            sell_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Pyrite',
        ['text'] = {
            [1] = 'When a {C:wheeloffortune_mineral}Mineral{} card is used,',
            [2] = 'increase this joker\'s sell value by {C:gold}$1{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["wheeloffortune_wheeloffortune_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and (context.consumeable.ability.set == 'mineral' or context.consumeable.ability.set == 'mineral') then
                return {
                    func = function()local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_card = G.jokers.cards[my_pos]
                        target_card.ability.extra_value = (card.ability.extra_value or 0) + 1
                        target_card:set_cost()
                        return true
                    end,
                    message = "+"..tostring(1).." Sell Value"
                }
            end
        end
    end
}